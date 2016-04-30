#!/usr/bin/env coffee

require 'coffee-script/register'

Path = require('path')
LogUtils = require '../../src/libgit2-log-utils'

unless process.argv.length > 2
  console.log "usage:  test/scripts/getLogJson fileOrDirectory"
LogUtils.getCommitHistory(process.argv[2])
.then (history)->
  console.log JSON.stringify(history, null, 2)
.catch (error) ->
  console.error error
