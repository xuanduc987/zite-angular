'use strict'

###*
 # @ngdoc function
 # @name ziteApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the ziteApp
###
angular.module 'ziteApp'
  .controller 'MainCtrl', ($location, $window, Auth, News) ->
    vm = @
    Auth.is_loggedin()
    vm.credential = Auth.credential

    News.fetch().then (data) ->
        vm.documents = data
    return
