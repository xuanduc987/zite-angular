'use strict'

###*
 # @ngdoc directive
 # @name ziteApp.directive:article
 # @description
 # # article
###
angular.module 'ziteApp'
  .directive 'article', ->
    restrict: 'EA'
    templateUrl: 'views/templates/article.html'
    scope:
      document: '='
