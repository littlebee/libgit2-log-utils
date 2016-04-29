
ChildProcess = require "child_process"
Path = require "path"
Fs = require "fs"

# _ = require('underscore')

Git = require('nodegit')
Promise = require('es6-promise').Promise


module.exports = class Libgit2LogUtils

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
    historyEntries = []
    return new Promise (resolve, reject) ->
      # Open the repository directory.
      Git.Repository.open(fileOrDirectory).then((repo) ->
        repo.getMasterCommit()
      ).then (firstCommitOnMaster) ->
        # Create a new history event emitter.
        history = firstCommitOnMaster.history()
        # Listen for commit events from the history.
        history.on 'commit', (commit) ->
          historyEntry = {
            id: commit.sha()
            author: commit.author().name()
            authorDate: commit.timeMs()
            message: commit.summary()
            body: commit.message().split('\n\n')[1..-1].join('\n\n')
            hash: commit.sha()
            linesAdded: 0
            linesDeleted: 0
          }
          historyEntries.push historyEntry
          commit.getDiff().then (arrayDiff) ->
            debugger
            for diff, diffIndex in arrayDiff
              diff.patches().then (patches) ->
                for patch in patches
                  lineStats = patch.lineStats()
                  historyEntry.linesAdded += lineStats.total_additions
                  historyEntry.linesDeleted += lineStats.total_deletions

        history.on 'end', () ->
          resolve(historyEntries)

        # Start emitting events.
        history.start()
