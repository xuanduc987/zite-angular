'use strict'

###*
 # @ngdoc service
 # @name ziteApp.Auth
 # @description
 # # Auth
 # Service in the ziteApp.
###
angular.module 'ziteApp'
  .service 'Auth', ($location, $cookies, ZiteServer) ->
    @credential = angular.fromJson($cookies.get('credential')) || {}
    auth = @

    @is_loggedin = ->
      logged = @credential.hasOwnProperty("userId")
      $location.path('/login') if !logged
      logged

    @log_in = (email, password, target) ->
      ZiteServer.login(email, password)
        .success (data) ->
          auth.credential = data
          $cookies.put('credential', angular.toJson(auth.credential))
          $location.path(target)
        .error (data, status) ->
          auth.credential = data
    return
