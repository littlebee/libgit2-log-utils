# libgit2-log-utils
Simple utility functions for fetching git history using libgit2  

### Installation
`npm install libgit2-log-utils`


### Usage
Like stupid simple:
*from bin/getLogJson*
```javascript
LogUtils.getCommitHistory(process.argv[2]).then(function(history) {
  return console.log(JSON.stringify(history, null, 2));
})["catch"](function(error) {
  return console.error(error);
});
```
...will produce...
```json
[
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
     "id": "more like the above ..."
  }
]
```
