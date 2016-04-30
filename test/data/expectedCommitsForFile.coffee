###
  this is the expected data for the first five commits of test-data/fiveCommits.txt.
  Only the keys in these objects are tested against the actual first five commits read
  from git log

  this should remain static, but if you need to redo, use bin/gitLogJson.coffee test/lib/fiveCommits.txt
  and replace array below with pasted output

###
module.exports = [
  {
    "id": "fa491d21e6d543672d8d47216544cf1a18763a35",
    "author": "Bee",
    "authorDate": 1461987461000,
    "message": "5th of five commits",
    "body": "",
    "hash": "fa491d21e6d543672d8d47216544cf1a18763a35",
    "linesAdded": 2,
    "linesDeleted": 0,
    "files": [
      {
        "path": "test/lib/fiveCommits.txt",
        "linesAdded": 2,
        "linesDeleted": 0
      }
    ]
  },
  {
    "id": "49caf8bef751e178ef8d89ac6af8704256382532",
    "author": "Bee",
    "authorDate": 1461987406000,
    "message": "4th of five commits",
    "body": "",
    "hash": "49caf8bef751e178ef8d89ac6af8704256382532",
    "linesAdded": 1,
    "linesDeleted": 2,
    "files": [
      {
        "path": "test/lib/fiveCommits.txt",
        "linesAdded": 1,
        "linesDeleted": 2
      }
    ]
  },
  {
    "id": "ded9e225427367bae60606fa068e1c767b60b6cc",
    "author": "Bee",
    "authorDate": 1461987342000,
    "message": "3rd of five commits",
    "body": "",
    "hash": "ded9e225427367bae60606fa068e1c767b60b6cc",
    "linesAdded": 1,
    "linesDeleted": 0,
    "files": [
      {
        "path": "test/lib/fiveCommits.txt",
        "linesAdded": 1,
        "linesDeleted": 0
      }
    ]
  },
  {
    "id": "16dcd8bde3f5647f9bec0e7ae591197ca1a315fe",
    "author": "Bee",
    "authorDate": 1461987315000,
    "message": "2nd of five commits",
    "body": "",
    "hash": "16dcd8bde3f5647f9bec0e7ae591197ca1a315fe",
    "linesAdded": 7,
    "linesDeleted": 2,
    "files": [
      {
        "path": "test/lib/fiveCommits.txt",
        "linesAdded": 7,
        "linesDeleted": 2
      }
    ]
  },
  {
    "id": "184e2ceb1d705e6640a6a572620d61d87f7ff620",
    "author": "Bee",
    "authorDate": 1461949936000,
    "message": "add src/ lib/ test/ + initial build",
    "body": "",
    "hash": "184e2ceb1d705e6640a6a572620d61d87f7ff620",
    "linesAdded": 206,
    "linesDeleted": 3,
    "files": [
      {
        "path": "Gruntfile.coffee",
        "linesAdded": 15,
        "linesDeleted": 3
      },
      {
        "path": "lib/README.md",
        "linesAdded": 5,
        "linesDeleted": 0
      },
      {
        "path": "package.json",
        "linesAdded": 1,
        "linesDeleted": 0
      },
      {
        "path": "src/libgit2-log-utils.coffee",
        "linesAdded": 29,
        "linesDeleted": 0
      },
      {
        "path": "test/data/expectedCommitsForDir.coffee",
        "linesAdded": 59,
        "linesDeleted": 0
      },
      {
        "path": "test/data/expectedCommitsForFile.coffee",
        "linesAdded": 59,
        "linesDeleted": 0
      },
      {
        "path": "test/git-log-utils.coffee",
        "linesAdded": 35,
        "linesDeleted": 0
      },
      {
        "path": "test/lib/fiveCommits.txt",
        "linesAdded": 3,
        "linesDeleted": 0
      }
    ]
  }
]
