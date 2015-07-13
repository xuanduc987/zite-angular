'use strict'

###*
 # @ngdoc overview
 # @name ziteApp
 # @description
 # # ziteApp
 #
 # Main module of the application.
###
angular
  .module 'ziteApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'angular-loading-bar'
  ]
  .config ($httpProvider) ->
    $httpProvider.defaults.headers.common = {}
    $httpProvider.defaults.headers.post = {}
    $httpProvider.defaults.headers.put = {}
    $httpProvider.defaults.headers.patch = {}
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
        controllerAs: 'about'
      .when '/login',
        templateUrl: 'views/login.html'
        controller: 'LoginCtrl'
        controllerAs: 'login'
      .otherwise
        redirectTo: '/'
