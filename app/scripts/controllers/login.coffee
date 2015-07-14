'use strict'

###*
 # @ngdoc function
 # @name ziteApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the ziteApp
###
angular.module 'ziteApp'
  .controller 'LoginCtrl', (Auth, $window, $location) ->
    vm = @
    vm.credential = Auth.credential

    if Auth.is_loggedin()
      $location.path('/')

    vm.login = ->
      Auth.log_in(vm.user.email, vm.user.password, '/')
    return
