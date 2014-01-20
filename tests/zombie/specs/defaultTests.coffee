Browser = require "zombie"
should = require "../should-ext"
grunt = require "grunt"

browser = new Browser()

describe "transport page test suit", ->

  before (done) ->

    serverPort = grunt.config.get("mochaTest.options.server-port")

    browser.console.log = ->
      return
      console.log ">>>>>>>>>>>"
      console.log Array.prototype.slice.call arguments
      console.log ">>>>>>>>>>>"

    browser.visit("http://localhost:#{serverPort}/index.html")
    .then(done, done)

    should.mixin browser

  describe "index page defaults", ->

    it "default divs should exist", ->
      should("#nav_bar").vis()
      should("#nav_panel").vis()
      should("#content").vis()
