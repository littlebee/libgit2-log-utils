###

  This file is different in the atom fork of this package.  Atom loads
  it's own version of nodegit and doesn't really like it when you import
  another instance
###

# for the Atom fork, this line is uncommented.
Nodegit = require('atom').GitRepositoryAsync.Git

# for the normal nodejs version this line is uncommented.
# Nodegit = require('nodegit')

module.exports = Nodegit
