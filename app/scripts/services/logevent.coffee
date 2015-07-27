'use strict'

###*
 # @ngdoc service
 # @name ziteApp.logEvent
 # @description
 # # logEvent
 # Service in the ziteApp.
###
angular.module 'ziteApp'
  .service 'LogEvent', (ZiteServer, Auth) ->
    @markAsRead = (section, url) ->
      ZiteServer.credential = Auth.credential
      ZiteServer.markAsRead(section, url)
    return
