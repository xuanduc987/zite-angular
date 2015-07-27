'use strict'

###*
 # @ngdoc function
 # @name ziteApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the ziteApp
###
angular.module 'ziteApp'
  .controller 'MainCtrl', ($location, $window, $routeParams, Auth, News) ->
    vm = @
    Auth.is_loggedin()
    vm.credential = Auth.credential
    vm.section = $routeParams.section || 'topstories'

    News.fetch(vm.section).then (data) ->
        vm.documents = data
    return
