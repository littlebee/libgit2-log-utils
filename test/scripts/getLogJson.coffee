#!/usr/bin/env coffee

require 'coffee-script/register'

Path = require('path')
LogUtils = require '../../src/libgit2-log-utils'

LogUtils.getCommitHistory(Path.dirname(process.argv[2])).then (history)->
  console.log history
