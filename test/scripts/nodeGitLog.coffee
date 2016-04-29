#!/usr/bin/env coffee

Git = require('nodegit')
# Open the repository directory.
Git.Repository.open('/Users/Bee/projects/atom/packages/git-time-machine').then((repo) ->
  console.log 'opened repo'
  repo.getMasterCommit()
).then (firstCommitOnMaster) ->
  console.log 'got first commit on master'
  # Create a new history event emitter.
  history = firstCommitOnMaster.history()
  # Listen for commit events from the history.
  history.on 'commit', (commit) ->
    author = commit.author()
    console.log 'Author:\u0009' + author.name() + ' <' + author.email() + '>'
    console.log 'Date:\u0009' + commit.date()
    console.log '\n    ' + commit.message() + '\n'
    commit.getDiff().then (arrayDiff) ->
      debugger
      console.log "#{arrayDiff.length} diffs"
      for diff, diffIndex in arrayDiff
        diff.patches().then (patches) ->
          console.log "diff: #{diffIndex}, patches: #{patches.length}"
          for patch in patches
            console.log
            console.log "lineStats:", patch.lineStats()


    console.log "\n"

    return

  # Start emitting events.
  history.start()
  return

.catch (error) ->
  console.error "oui error:  #{error}"
