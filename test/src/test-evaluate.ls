'use strict'

require! {
  chai: {expect}
  '../../lib/evaluate'
}

module.exports = ->
  describe \evaluate (...) ->
    it \evaluate ->
      evaluate 'a = -> 1\na!'
        .then -> expect it .to.be.equal \1
    it 'compile error' ->
      evaluate ')'
        .then (-> it), (.message)
        .then -> expect it .to.be.equal 'unmatched \`)\` on line 1'
    it 'evaluate error' ->
      evaluate 'a'
        .then (-> it), (.message)
        .then -> expect it .to.be.equal 'a is not defined'
