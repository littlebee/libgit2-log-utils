#!/usr/bin/env coffee

Path = require('path')

nodegit = require 'nodegit'
GitLogUtils = require('../src/libgit2-log-utils')
gitLogUtils = new GitLogUtils(nodegit)

unless process.argv?.length > 2
  console.log "usage:  test/scripts/getLogJson fileOrDirectory"
  process.exit(1)

gitLogUtils.getCommitHistory(process.argv[2])
.then (history)->
  console.log JSON.stringify(history, null, 2)
.catch (error) ->
  console.error error
