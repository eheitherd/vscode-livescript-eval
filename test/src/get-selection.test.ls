'use strict'

require! {
  chai: {expect}
  vscode: {window, commands, Position}
  '../../lib/get-selection'
}

module.exports = ->
  describe \get-selection (...) ->
    it 'No selection' ->
      get-selection!
        .then -> expect it .to.be.undefined
    it 'Get selection' ->
      insert \123
        .then select
        .then get-selection
        .then -> expect it .to.be.equal \2
    it 'No active editor' ->
      close-editor!
        .then wait-close
        .then get-selection
        .then -> expect it .to.be.undefined

insert = (str) ->
  pos = new Position 0 0
  edit <- window.active-text-editor.edit
  edit.insert pos, str

select = ->
  commands.execute-command \cursorHome
    .then -> commands.execute-command \cursorRight
    .then -> commands.execute-command \cursorRightSelect

close-editor = -> commands.execute-command 'workbench.action.closeActiveEditor'

wait-close = ->
  if window.active-text-editor?
    resolve, reject <- new Promise _
    <- set-timeout _, 0
    resolve wait-close!
  else
    Promise.resolve!
