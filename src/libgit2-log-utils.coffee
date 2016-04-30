
ChildProcess = require "child_process"
Path = require "path"
Fs = require "fs"

# _ = require('underscore')

Git = require('nodegit')
Promise = require('es6-promise').Promise


module.exports = class Libgit2LogUtils

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
        "id": "1c41d8f647f7ad30749edcd0a554bd94e301c651",
        "authorName": "Bee Wilkerson",
        "relativeDate": "6 days ago",
        "authorDate": 1450881433,
        "message": "docs all work again after refactoring to bumble-build",
        "body": "",
        "hash": "1c41d8f",
        "linesAdded": 2,
        "linesDeleted": 2
      }, {
        ...
      }]
  ###
  @getCommitHistory: (fileOrDirectory) ->
    gitRepoDir = @findGitRepoFor(fileOrDirectory)

    return new Promise (resolve, reject) ->
      diffPromises = []
      patchPromises = []
      Git.Repository.open(gitRepoDir)
      .then (repo) -> repo.getMasterCommit()
      .then (firstCommitOnMaster) ->
        _getCommitHistory(firstCommitOnMaster)
      .then (allCommits) ->
        historyEntries = []
        for commit in allCommits
          _newHistoryEntryWithPatches(commit, historyEntries, diffPromises, patchPromises)
        return historyEntries

      .then (historyEntries) ->
        Promise.all(diffPromises).then ->
          Promise.all(patchPromises).then ->
            resolve(historyEntries)

      .catch (error) ->
        console.error("ERROR: ", error)



_processPatches = (patches, historyEntry) ->
  for patch in patches
    #console.log "patch for #{historyEntry.message}"
    switch
      when patch.isCopied()
        historyEntry.files.push patch.newFile().path()
        #console.log "copiedFile #{patch.newFile().path()}"
      when patch.isRenamed()
        historyEntry.files.concat [patch.oldFile().path(), patch.newFile().path()]
      else
        historyEntry.files.push patch.oldFile().path()

    lineStats = patch.lineStats()
    historyEntry.linesAdded += lineStats.total_additions
    historyEntry.linesDeleted += lineStats.total_deletions
    #console.log lineStats


_getCommitHistory = (firstCommitOnMaster) ->
  new Promise (historyResolve) ->
    commits = []
    history = firstCommitOnMaster.history()
    history.on 'commit', (commit) ->
      commits.push commit
    history.on 'end', () ->
      historyResolve(commits)
    history.start()


_newHistoryEntryWithPatches = (commit, historyEntries, diffPromises, patchPromises) ->
  historyEntry = _newHistoryEntry(commit)
  historyEntries.push historyEntry
  diffPromises.push commit.getDiff().then (arrayDiff) ->
    debugger
    for diff, diffIndex in arrayDiff
      patchPromises.push new Promise (patchResolve)->
        diff.patches()
        .then (patches) ->
          _processPatches(patches, historyEntry)
          patchResolve()
        .catch (error) ->
          console.error("ERROR: ", error)
  return historyEntries


_newHistoryEntry = (commit) ->
  {
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
