Template web app
================

Project template for web app.
Provide static files server (for dev and test).
Headless client test via zombie and mocha.
Coffee-script sources.

###Project tree

```shell
    +
    |
    +---tests
    |   +
    |   |
    |   +---zombie
    |       +
    |       |
    |       +---specs
    |
    +---www
    |   +
    |   |
    |   +---libs
    |       +
    |       |
    |       +---bower_modules
    |           +
    |           |
    |           +---bin
    |
    ...FILES...

```

#Folders

+ tests\zombie - zombie tests here
+ www - folder for you app
+ www\libs - folder fo fird party js files
+ www\libs\bower_modules - where bower modules installed
+ www\libs\bower_modules\bin - here copied built bower modules

###Configs

see `app.yaml`

###Gitignore

`bower_modules, npm_modules, www\js\libs\bower_modules, js\*.js, tests\*.js`

###Server

+ Grunt
+ static connect server (dev)
+ static connect server (test)
+ bower
+ mocha
+ zombie

###Front-end (via bower)

+ jquery
+ requirejs
+ knockoutjs
+ bootstrap

##Install

+ `npm install`
+ `grunt install`

Windows users! If npm modules fail to install, try to use  `--msvs_version=2012` cl argument or `SET VisualStudioVersion=11.0` before installation.
Use appropriate vs version in both cases.

##Compile

`grunt compile`

##Test

`grunt`

##Debug

+ `grunt test-server`
+ `grunt test-all` or `grunt test-current`

##Run

+ `grunt dev-server`