'use strict'

###*
 # @ngdoc filter
 # @name ziteApp.filter:fromNow
 # @function
 # @description
 # # fromNow
 # Filter in the ziteApp.
###
angular.module 'ziteApp'
  .filter 'fromNow', ->
    (timestamp) ->
      moment.unix(timestamp).fromNow()
