#------------------------------------------------------------------------------
# Provides test runner

'use strict'

require! \vscode/lib/testrunner

testrunner.configure do
  ui: \bdd
  use-colors: true

module.exports = testrunner
