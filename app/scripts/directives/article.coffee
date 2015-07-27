'use strict'

###*
 # @ngdoc directive
 # @name ziteApp.directive:article
 # @description
 # # article
###
angular.module 'ziteApp'
  .directive 'article', (LogEvent) ->
    restrict: 'EA'
    templateUrl: 'views/templates/article.html'
    scope:
      document: '='
      section: '='
    controller: ($scope, $window, $location) ->
      for pic in $scope.document.images
        if pic.h == pic.w && pic.h >= 120
          $scope.document.cover_url = pic.url
          break
        if pic.w > 800 && pic.h < pic.w / 2
          $scope.document.cover_url = pic.url
          $scope.document.is_full_pic = true
          break

      $scope.visitLink = ->
        LogEvent.markAsRead($scope.section, $scope.document.url)
        $window.open($scope.document.url, '_blank')
        return true

      $scope.clickTag = (topic) ->
        $location.path('/section/' + topic.id)
        return true


