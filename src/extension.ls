#------------------------------------------------------------------------------
# LiveScript eval

'use strict'

require! {
  vscode: {window, workspace, commands}
  './ls-eval'
}

export activate = (context) ->
  output-channel = window.create-output-channel 'LiveScript eval'
  command-reg = register-command command, -> ls-eval output-channel
  context.subscriptions.push output-channel, command-reg

register-command = commands.register-command

command = \extension.livescript-eval
