#------------------------------------------------------------------------------
# Get selection of LiveScript code

'use strict'

require! {
  vscode: {window}
}

# -> Promise
module.exports = ->
  {document, selection} = get-active-editor!

  selection
  |> (.with!)
  |> -> unless it.is-empty then document.get-text it
  |> Promise.resolve

get-active-editor = -> window.active-text-editor ? null-editor

null-editor =
  selection: with: -> is-empty: true
  document: get-text: -> ''
