
ChildProcess = require "child_process"
Path = require "path"
Fs = require "fs"

_ = require('underscore')
Bstr = require('bumble-strings')

Promise = require('es6-promise').Promise


module.exports = class Libgit2LogUtils

  constructor: (nodegit) ->
    @Nodegit = nodegit
    @_checkNodegitSet()
    return @


  # TODO : move to more general lib?
  @findGitRepoFor: (fileOrDirectory) ->
    dirName = if Fs.lstatSync(fileOrDirectory).isDirectory()
      Path.resolve(fileOrDirectory)
    else
      Path.dirname(Path.resolve(fileOrDirectory))

    # walks the parents until there are no more
    while not Fs.existsSync(Path.join(dirName, '.git')) && dirName.length > 0 && dirName != '/'
      dirName = Path.dirname(dirName)

    return dirName


  ###
    Returns a promise that when fullfilled, returns an array of javascript objects representing
    the commits that effected the requested file with line stats, that looks like this:
      [{
        "id": "118c9782dbd8598c6f06f4e1ebfc3bca44da0709",
        "author": "Bee",
        "authorDate": 1461944361000,
        "message": "Initial commit",
        "body": "",
        "hash": "118c9782dbd8598c6f06f4e1ebfc3bca44da0709",
        "linesAdded": 56,
        "linesDeleted": 0,
        "files": [
          {
            "path": ".gitignore",
            "linesAdded": 33,
            "linesDeleted": 0
          },
          {
            "path": "LICENSE",
            "linesAdded": 21,
            "linesDeleted": 0
          },
          {
            "path": "README.md",
            "linesAdded": 2,
            "linesDeleted": 0
          }
        ]
      }, {
        ...
      }]
  ###
  tStart = null
  
  getCommitHistory: (fileOrDirectory) ->
    @_checkNodegitSet()

    gitRepoDir = Libgit2LogUtils.findGitRepoFor(fileOrDirectory)
    projectRelativeFileOrDirectory = Path.resolve(fileOrDirectory).slice(gitRepoDir.length+1)
    # console.log "gitRepoDir=", gitRepoDir
    # console.log "projectRelativeFileOrDirectory=", projectRelativeFileOrDirectory
    tStart = Date.now()
    
    return new Promise (resolve, reject) =>
      diffPromises = []
      patchPromises = []
      allCommits = []
      repo = null
      @Nodegit.Repository.open(gitRepoDir)
      .then (r) -> 
        repo = r
        repo.getMasterCommit()
      
      .then (firstCommitOnMaster) =>
        walker = repo.createRevWalk();
        walker.push(firstCommitOnMaster.sha());
        walker.sorting(@Nodegit.Revwalk.SORT.Time);

        return walker.fileHistoryWalk(projectRelativeFileOrDirectory, 100);
      
      .then (revWalkCommits) =>
          console.log 'initial commits', revWalkCommits.length, Date.now() - tStart
          @_processRevwalkCommits(repo, projectRelativeFileOrDirectory, allCommits, revWalkCommits)
      
      .then =>
        console.log 'allCommits', allCommits.length, Date.now() - tStart    
          
        historyEntries = []
        for commit in allCommits
          commit.commit.repo = repo
          @_newHistoryEntryWithPatches(commit.commit, historyEntries, diffPromises, patchPromises)
        return historyEntries
      
      .then (historyEntries) ->
        console.log 'historyEntries', historyEntries.length, Date.now() - tStart
        Promise.all(diffPromises).then ->
          console.log 'diffPromises', diffPromises.length, Date.now() - tStart
          Promise.all(patchPromises).then ->
            console.log 'patchPromises', patchPromises.length,  Date.now() - tStart
            # resolve(historyEntries)
            if projectRelativeFileOrDirectory.length <= 0
              resolve(historyEntries)
            else
              resolve _.filter historyEntries, (historyEntry) ->
                for file in historyEntry.files
                  return true if Bstr.startsWith(file.path, projectRelativeFileOrDirectory)
                return false

      .catch (error) ->
        reject(error)


  _checkNodegitSet: ->
    unless @Nodegit?
      error = "Nodegit has not been set.  Need to call init(nodegit) on libgit2-log-utils"
      console.error error
      throw error

  _processRevwalkCommits: (repo, projectRelativeFileOrDirectory, allCommits, revWalkCommits) ->
    lastSha = undefined
    if allCommits.length > 0
      lastSha = allCommits[allCommits.length - 1].commit.sha()
      if revWalkCommits.length == 1 and revWalkCommits[0].commit.sha() == lastSha
        return
    
    revWalkCommits.forEach (entry) ->
      allCommits.push entry
      return
    
    return unless allCommits.length > 0
    
    walker = repo.createRevWalk()
    
    lastSha = allCommits[allCommits.length - 1]?.commit.sha()
    walker.push lastSha if lastSha
    
    walker.sorting @Nodegit.Revwalk.SORT.TIME
    walker.fileHistoryWalk(projectRelativeFileOrDirectory, 100).then (revWalkCommits) =>
      console.log 'more commits', revWalkCommits.length, Date.now() - tStart
      @_processRevwalkCommits(repo, projectRelativeFileOrDirectory, allCommits, revWalkCommits)
    


  _processPatches: (patches, historyEntry) ->
    for patch in patches
      #console.log "patch for #{historyEntry.message}"
      lineStats = patch.lineStats()

      @_getFileEntries(patch, historyEntry, lineStats)
      historyEntry.linesAdded += lineStats.total_additions
      historyEntry.linesDeleted += lineStats.total_deletions
      #console.log lineStats


  _getCommitHistory: (firstCommitOnMaster) ->
    new Promise (historyResolve) ->
      commits = []
      history = firstCommitOnMaster.history()
      history.on 'commit', (commit) ->
        commits.push commit
      history.on 'end', () ->
        historyResolve(commits)
      history.start()


  _newHistoryEntryWithPatches: (commit, historyEntries, diffPromises, patchPromises) ->
    historyEntry = @_newHistoryEntry(commit)
    historyEntries.push historyEntry
    diffPromises.push commit.getDiff().then (arrayDiff) =>
      for diff, diffIndex in arrayDiff
        patchPromises.push new Promise (patchResolve) =>
          diff.patches()
          .then (patches) =>
            @_processPatches(patches, historyEntry)
            patchResolve()
          .catch (error) ->
            console.error("ERROR: ", error)
    return historyEntries


  _newHistoryEntry: (commit) ->
    return {
      id: commit.sha()
      author: commit.author().name()
      authorDate: commit.timeMs()
      message: commit.summary()
      body: commit.message().split('\n\n')[1..-1].join('\n\n')
      hash: commit.sha()
      linesAdded: 0
      linesDeleted: 0
      files: []
    }


  _getFileEntries: (patch, historyEntry, lineStats) ->
    diffFile = if patch.isCopied() || patch.isRenamed() then patch.newFile() else patch.oldFile()
    historyEntry.files.push @_getNewFileEntry(diffFile, lineStats)


  _getNewFileEntry: (diffFile, lineStats) ->
    return {
      path: diffFile.path()
      linesAdded: lineStats.total_additions
      linesDeleted: lineStats.total_deletions
    }
