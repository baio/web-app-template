module.exports = (grunt) ->

  grunt.initConfig
    config: grunt.file.readYAML('app.yaml'),
    connect:
      'test-server-once':
        options:
          port : '<%= config.test.server.port_once %>'
          base: '<%= config.test.server.base %>'
      'test-server':
        options:
          port : '<%= config.test.server.port %>'
          keepalive : true
          base: '<%= config.test.server.base %>'
      'dev-server':
        options:
          port : '<%= config.dev.server.port %>'
          base: '<%= config.dev.server.base %>'
          keepalive : true
          open : true
    mochaTest:
      options :
        'server-port' :  '<%= config.test.server.port %>'
      'test-current':
        options:
          reporter: "dot"
          require: "coffee-script"
          bail : true
        src: ['<%= config.test.current_spec_path %>']
      'test-all':
        options:
          reporter: "spec"
          require: "coffee-script"
          bail : true
        src: ['<%= config.test.all_specs_path %>']
    bower:
      install :
        options:
          copy : false
    bower_postinst:
      dist:
        options:
          components:
            knockoutjs: ['npm', 'grunt' : 'build']
    copy:
      main:
        files: [
          {src: 'www/libs/bower_modules/jquery/jquery.min.js', dest : 'www/libs/bower_modules/bin/jquery.min.js'}
          {src: 'www/libs/bower_modules/knockoutjs/build/output/knockout-latest.js', dest : 'www/libs/bower_modules/bin/knockout.min.js'}
          {src: 'www/libs/bower_modules/requirejs/require.js', dest : 'www/libs/bower_modules/bin/requirejs.js'}
          {src: 'www/libs/bower_modules/bootstrap/dist/js/bootstrap.min.js', dest : 'www/libs/bower_modules/bin/bootstrap.min.js'}
          {src: 'www/libs/bower_modules/bootstrap/dist/css/bootstrap.min.css', dest : 'www/libs/bower_modules/bin/css/bootstrap.min.css'}
          {expand: true, cwd: 'www/libs/bower_modules/bootstrap/dist/fonts', src: ['**'], dest : 'www/libs/bower_modules/bin/fonts/'}
        ]
    coffee:
      glob_to_multiple:
        expand: true
        cwd: ['www/js/', 'tests/'],
        src: ['./**/*.coffee']
        ext: '.js'

  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks("grunt-mocha-test")
  grunt.loadNpmTasks('grunt-bower-task')
  grunt.loadNpmTasks("grunt-bower-postinst")
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-coffee')

  grunt.registerTask("default", ["connect:test-server-once", "mochaTest:test-all"])
  grunt.registerTask("test-current", ["mochaTest:test-current"])
  grunt.registerTask("test-all", ["mochaTest:test-all"])
  grunt.registerTask("dev-server", ["connect:dev-server"])
  grunt.registerTask("test-server", ["connect:test-server"])
  grunt.registerTask("install", ["bower", "bower_postinst", "copy"])
  grunt.registerTask("compile", ["coffee"])