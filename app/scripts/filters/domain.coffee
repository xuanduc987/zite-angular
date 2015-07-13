'use strict'

###*
 # @ngdoc filter
 # @name ziteApp.filter:domain
 # @function
 # @description
 # # domain
 # Filter in the ziteApp.
###
angular.module 'ziteApp'
  .filter 'domain', ->
    (input) ->
      urls = /\w+:\/\/([\w|\.]+)/
      matches = urls.exec input
      output = matches[1] if matches != null
