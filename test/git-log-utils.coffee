
Fs = require 'fs'
Path = require 'path'

GitLogUtils = require('../src/libgit2-log-utils')

expectedCommitsForFile = require './data/expectedCommitsForFile'
expectedCommitsForDir = require './data/expectedCommitsForDir'

debugger

describe "GitUtils", ->

  testData = null

  describe "when loading file history for known file in git", ->

    beforeEach (done) ->
      testFileName = Path.join __dirname, 'lib', 'fiveCommits.txt'
      GitLogUtils.getCommitHistory(testFileName)
      .then (commitHistory) ->
        testData = commitHistory
        done()

    it "should have 5 commits", ->
      testData.length.should.equal(5)

    it "first 5 commits should match last known good", ->
      expect(JSON.stringify(testData)).to.equal JSON.stringify(expectedCommitsForFile)

  describe "when loading history for a directory", ->
    beforeEach (done) ->
      testFileName = Path.join __dirname, '..'
      GitLogUtils.getCommitHistory(testFileName)
      .then (commitHistory) ->
        testData = commitHistory
        done()

    it "should have at least as many commits as we once did", ->
      expect(testData.length).to.be.above(expectedCommitsForDir.length)

    it "should have all the same commits we once had", ->
      _expectedArray = expectedCommitsForDir.sort (a, b) -> a.authorDate - b.authorDate
      _expectedJson = JSON.stringify(_expectedArray, null, 2)
      _testArray = testData.sort (a, b) -> a.authorDate - b.authorDate
      _testDataJson = JSON.stringify(_testArray, null, 2).slice(0, _expectedJson.length)

      expect(_testDataJson).to.equal _expectedJson
