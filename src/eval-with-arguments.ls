#------------------------------------------------------------------------------
# Evaluate with arguments in context of Visual Studio Code

'use strict'

# (a -> b) -> String -> b
module.exports = (func, args) -> eval "func(#args)"
