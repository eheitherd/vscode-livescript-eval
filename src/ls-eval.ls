#------------------------------------------------------------------------------
# Eval selection of LiveScript code

'use strict'

require! {
  './get-selection'
  './evaluate'
  './print'
}

module.exports = (output-channel) ->
  get-selection!
  |> evaluate
  |> print output-channel, _
