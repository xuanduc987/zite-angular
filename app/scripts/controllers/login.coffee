'use strict'

###*
 # @ngdoc function
 # @name ziteApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the ziteApp
###
angular.module 'ziteApp'
  .controller 'LoginCtrl', (ZiteServer, $window, $location) ->
    vm = @
    vm.credential = angular.fromJson($window.sessionStorage.getItem('credential')) || {}

    vm.login = ->
      ZiteServer.login(vm.user.email, vm.user.password)
        .success (data) ->
          vm.credential = data
          $window.sessionStorage.setItem('credential', angular.toJson(vm.credential))
        .error (data, status) -> vm.credential = data
    return
