#------------------------------------------------------------------------------
# Tests

'use strict'

require! 'prelude-ls': {each}

module.exports = ->
  <[
    test-get-selection
    test-evaluate
    test-lint
  ]>
  |> each -> (require "./#{it}")!
