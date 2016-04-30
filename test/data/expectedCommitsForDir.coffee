###
  this is the expected data for the first five commits of test-data/fiveCommits.txt.
  Only the keys in these objects are tested against the actual first five commits read
  from git log

  this should remain static, but if you need to redo, use bin/gitLogJson.coffee test/lib/fiveCommits.txt
  and replace array below with pasted output

###
module.exports = [{
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
  "id": "40fe9cb1340607506ff5302c9c3360b9a06c01b7",
  "author": "Bee",
  "authorDate": 1461986381000,
  "message": "last tweak to readme. I swear.",
  "body": "",
  "hash": "40fe9cb1340607506ff5302c9c3360b9a06c01b7",
  "linesAdded": 31,
  "linesDeleted": 14,
  "files": [
    {
      "path": "README.md",
      "linesAdded": 5,
      "linesDeleted": 3
    },
    {
      "path": "bin/getLogJson.coffee",
      "linesAdded": 2,
      "linesDeleted": 3
    },
    {
      "path": "src/libgit2-log-utils.coffee",
      "linesAdded": 24,
      "linesDeleted": 8
    }
  ]
},
{
  "id": "216b7e1201c23df79097d1f689269c40c89d5c26",
  "author": "Bee",
  "authorDate": 1461985668000,
  "message": "more readme enhancements",
  "body": "",
  "hash": "216b7e1201c23df79097d1f689269c40c89d5c26",
  "linesAdded": 3,
  "linesDeleted": 3,
  "files": [
    {
      "path": "README.md",
      "linesAdded": 3,
      "linesDeleted": 3
    }
  ]
},
{
  "id": "518aa497d77ce9a9e85598c3064b177ecb239591",
  "author": "Bee",
  "authorDate": 1461985585000,
  "message": "more readme enhancements",
  "body": "",
  "hash": "518aa497d77ce9a9e85598c3064b177ecb239591",
  "linesAdded": 5,
  "linesDeleted": 2,
  "files": [
    {
      "path": "README.md",
      "linesAdded": 5,
      "linesDeleted": 2
    }
  ]
},
{
  "id": "40ef1f1a3a20d5c57cfb4244c8621672807d33dc",
  "author": "Bee",
  "authorDate": 1461985369000,
  "message": "readme enhancements",
  "body": "",
  "hash": "40ef1f1a3a20d5c57cfb4244c8621672807d33dc",
  "linesAdded": 6,
  "linesDeleted": 4,
  "files": [
    {
      "path": "README.md",
      "linesAdded": 6,
      "linesDeleted": 4
    }
  ]
},
{
  "id": "8a23fd5c55e3d435a6048f28cbf1db434d031706",
  "author": "Bee",
  "authorDate": 1461985053000,
  "message": "updated readme; moved getLogJson into bin dir",
  "body": "",
  "hash": "8a23fd5c55e3d435a6048f28cbf1db434d031706",
  "linesAdded": 64,
  "linesDeleted": 14,
  "files": [
    {
      "path": "README.md",
      "linesAdded": 50,
      "linesDeleted": 0
    },
    {
      "path": "bin/getLogJson.coffee",
      "linesAdded": 14,
      "linesDeleted": 0
    },
    {
      "path": "test/scripts/getLogJson.coffee",
      "linesAdded": 0,
      "linesDeleted": 14
    }
  ]
},
{
  "id": "233b26b3a1e212e50693e2e41f2252afa7ebf16d",
  "author": "Bee",
  "authorDate": 1461978358000,
  "message": "output linesAdded and linesDeleted for each file",
  "body": "",
  "hash": "233b26b3a1e212e50693e2e41f2252afa7ebf16d",
  "linesAdded": 35,
  "linesDeleted": 15,
  "files": [
    {
      "path": "package.json",
      "linesAdded": 3,
      "linesDeleted": 1
    },
    {
      "path": "src/libgit2-log-utils.coffee",
      "linesAdded": 31,
      "linesDeleted": 13
    },
    {
      "path": "test/scripts/getLogJson.coffee",
      "linesAdded": 1,
      "linesDeleted": 1
    }
  ]
},
{
  "id": "dc332a86942066f1623c268c65ae3874bda9e98a",
  "author": "Bee",
  "authorDate": 1461975069000,
  "message": "fix issue with linesAdded/Deleted and async hell. add files affected by commit to returned js object",
  "body": "",
  "hash": "dc332a86942066f1623c268c65ae3874bda9e98a",
  "linesAdded": 101,
  "linesDeleted": 35,
  "files": [
    {
      "path": "src/libgit2-log-utils.coffee",
      "linesAdded": 95,
      "linesDeleted": 34
    },
    {
      "path": "test/scripts/getLogJson.coffee",
      "linesAdded": 6,
      "linesDeleted": 1
    }
  ]
},
{
  "id": "e25658f1e902ea7dd88f0be03b306b8936c7546e",
  "author": "Bee",
  "authorDate": 1461964423000,
  "message": "basic functionality",
  "body": "",
  "hash": "e25658f1e902ea7dd88f0be03b306b8936c7546e",
  "linesAdded": 89,
  "linesDeleted": 1,
  "files": [
    {
      "path": "package.json",
      "linesAdded": 4,
      "linesDeleted": 0
    },
    {
      "path": "src/libgit2-log-utils.coffee",
      "linesAdded": 38,
      "linesDeleted": 1
    },
    {
      "path": "test/scripts/getLogJson.coffee",
      "linesAdded": 9,
      "linesDeleted": 0
    },
    {
      "path": "test/scripts/nodeGitLog.coffee",
      "linesAdded": 38,
      "linesDeleted": 0
    }
  ]
},
{
  "id": "667881a51ea41a29f94002f0e3c671b576c00d73",
  "author": "Bee",
  "authorDate": 1461951030000,
  "message": "add build to npm prepublish",
  "body": "",
  "hash": "667881a51ea41a29f94002f0e3c671b576c00d73",
  "linesAdded": 3,
  "linesDeleted": 3,
  "files": [
    {
      "path": "Gruntfile.coffee",
      "linesAdded": 1,
      "linesDeleted": 2
    },
    {
      "path": "package.json",
      "linesAdded": 2,
      "linesDeleted": 1
    }
  ]
},
{
  "id": "4716fdb2ecc7815ca7c8771390837bd2a7fda5f9",
  "author": "Bee",
  "authorDate": 1461950017000,
  "message": "add lib/ to gitignore",
  "body": "",
  "hash": "4716fdb2ecc7815ca7c8771390837bd2a7fda5f9",
  "linesAdded": 3,
  "linesDeleted": 0,
  "files": [
    {
      "path": ".gitignore",
      "linesAdded": 3,
      "linesDeleted": 0
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
},
{
  "id": "1f0f2cc0131e591d7d26f943e38dc249a235b6a8",
  "author": "Bee",
  "authorDate": 1461948235000,
  "message": "bumble-build/bin/init",
  "body": "",
  "hash": "1f0f2cc0131e591d7d26f943e38dc249a235b6a8",
  "linesAdded": 35,
  "linesDeleted": 1,
  "files": [
    {
      "path": "Gruntfile.coffee",
      "linesAdded": 8,
      "linesDeleted": 0
    },
    {
      "path": "package.json",
      "linesAdded": 27,
      "linesDeleted": 1
    }
  ]
},
{
  "id": "237270983a408dd4987d052c4057872b0cd779b1",
  "author": "Bee",
  "authorDate": 1461945016000,
  "message": "npm init",
  "body": "",
  "hash": "237270983a408dd4987d052c4057872b0cd779b1",
  "linesAdded": 26,
  "linesDeleted": 0,
  "files": [
    {
      "path": "package.json",
      "linesAdded": 26,
      "linesDeleted": 0
    }
  ]
},
{
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
}]
