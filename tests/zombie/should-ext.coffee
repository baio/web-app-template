should = require "should"

module.exports = should

module.exports.mixin = (browser) ->

  should.Assertion.prototype.vis = ->
    should(browser.query(@obj)).not.equal null, "object #{@obj} should be visible"
    should(browser.query(@obj+"[style*='display: none']")).equal null, "object #{@obj} should be visible"

  should.Assertion.prototype.hid = ->
    if browser.query(@obj)
      should(browser.query(@obj+"[style*='display: none']")).not.equal null, "object #{@obj} should be hidden"
