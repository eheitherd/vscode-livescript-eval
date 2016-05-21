#------------------------------------------------------------------------------
# Evaluate LiveScript code

'use strict'

require! {
  util
  vscode: {window}
  livescript: lsc
  'prelude-ls': {is-type}
  './eval-in-vsc'
  './eval-with-arguments'
}

# String -> Promise
module.exports = (src) ->
  if is-type \String src
    evaluate src
      .then resolve-curry
      .then util.inspect
  else
    Promise.resolve!

evaluate = (src) ->
  resolve, reject <- new Promise _
  src
  |> lsc.compile _, {+bare, -header}
  |> eval-in-vsc
  |> resolve

resolve-curry = (obj) ->
  if typeof obj is \function
    window.show-input-box {place-holder}
      .then ->
        if is-type \String it
          resolve-curry eval-with-arguments obj, it
        else
          obj
  else
    obj

place-holder =
  'The evalution result is a function. 
   Input arguments and press \'Enter\' 
  if you want to call it.'
