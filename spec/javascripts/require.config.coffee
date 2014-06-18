allTestFiles = []
TEST_REGEXP = /app\/assets\/javascripts\/\w*\/\w*\.spec\.\w*$/
pathToModule = (path) ->
  path.replace(/^\/base\//, "../../").replace /\.js$/, ""

Object.keys(window.__karma__.files).forEach (file) ->

  # Normalize paths to RequireJS module names.
  allTestFiles.push pathToModule(file)  if TEST_REGEXP.test(file)
  return

requirejs.config

  # Karma serves files from '/app'
  baseUrl: "base/app/assets/javascripts"

  # configurations
  paths:
    'angular': 'angular/angular'
    'angular-mocks': 'angular-mocks/angular-mocks'
    'angular-resource': 'angular-resource/angular-resource'
    'angular-animate': 'angular-animate/angular-animate'
    'angular-ui-router': 'angular-ui-router/release/angular-ui-router'
    'bindonce': 'angular-bindonce/bindonce'
    'ui-bootstrap-tpls': 'angular-bootstrap/ui-bootstrap-tpls'
    'jquery': 'jquery/dist/jquery'
    'lodash': 'lodash/dist/lodash'
    'bootstrap': 'sass-bootstrap/dist/js/bootstrap'
  shim:
    'angular':
      exports: 'angular'
      deps: ['jquery']
    'angular-mocks': ['angular']
    'lodash':
      exports: '_'
    'angular-resource': ['angular']
    'angular-animate': ['angular']
    'angular-ui-router': ['angular']
    'bindonce': ['angular']
    'ui-bootstrap-tpls': ['angular']
    'bootstrap': ['jquery']

  # ask Require.js to load these files (all our tests)
  deps: allTestFiles

  # start test run, once Require.js is done
  callback: window.__karma__.start
