'use strict'

###*
 # @ngdoc function
 # @name ziteApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the ziteApp
###
angular.module 'ziteApp'
  .controller 'MainCtrl', ($location, $window, ZiteServer) ->
    vm = @
    vm.credential = angular.fromJson($window.sessionStorage.getItem('credential')) || {}
    $location.path('/login') if !vm.credential.hasOwnProperty("userId")

    ZiteServer.credential = vm.credential
    ZiteServer.getArticles()
      .success (data) ->
        vm.documents = data.documents
    return
