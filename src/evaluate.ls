#------------------------------------------------------------------------------
# Evaluate LiveScript code

'use strict'

require! {
  util
  'livescript': lsc
  'prelude-ls': {is-type}
  './eval-in-vsc'
}

module.exports = (src) ->
  if is-type \String src
    try
      src
      |> lsc.compile _, {+bare, -header}
      |> eval-in-vsc
      |> util.inspect
    catch e
      e.message
