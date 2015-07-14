'use strict'

###*
 # @ngdoc service
 # @name ziteApp.News
 # @description
 # # News
 # Service in the ziteApp.
###
angular.module 'ziteApp'
  .service 'News', (ZiteServer, Auth, $q)->
    @articles = {}

    @load = (section = "topstories") ->
      deferred = $q.defer()

      ZiteServer.credential = Auth.credential
      that = @
      ZiteServer.getArticles(section)
        .success (data) ->
          that.articles[section] = data.documents
          deferred.resolve()
        .error ->
          deferred.reject()

      deferred.promise

    @fetch = (section = "topstories") ->
      deferred = $q.defer()
      if @articles.hasOwnProperty(section) && @articles[section] != null
        deferred.resolve(@articles[section])
      else
        that = @
        @load(section)
          .then -> deferred.resolve(that.articles[section])
          .catch -> deferred.reject()

      deferred.promise
    return
