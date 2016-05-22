#------------------------------------------------------------------------------
# Tests

'use strict'

require! 'prelude-ls': {each}

<[
  get-selection.test
  evaluate.test
  lint.test
]>
|> each -> (require "./#{it}")!
