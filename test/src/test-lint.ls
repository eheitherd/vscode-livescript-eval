'use strict'

require! {
  fs
  path
  'glob-all'
  chai: {expect}
  'ls-lint': {lint}
  'prelude-ls': {map, each, count-by}
}

module.exports = (...) ->
  describe 'lint' ->
    <[ ./*.ls ./**/src/**/*.ls ]>
    |> map -> path.resolve root-dir, it
    |> glob-all.sync
    |> -> it
    |> each (file) ->
      it (reform-path file), ->
        fs.read-file-sync file, encoding: \utf8
        |> lint
        |> count-by (.level)
        |> (.error)
        |> (~= true)
        |> -> expect it .to.be.false

root-dir =
  module.filename
  |> path.dirname
  |> path.resolve _, \../../

reform-path = ->
  it
  |> path.relative './', _
  |> (.replace /\\/g \/)
