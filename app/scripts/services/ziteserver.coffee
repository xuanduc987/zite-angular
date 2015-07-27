'use strict'

###*
 # @ngdoc service
 # @name ziteApp.ZiteServer
 # @description
 # # ZiteServer
 # Factory in the ziteApp.
###
angular.module 'ziteApp'
  .factory 'ZiteServer', ($http) ->
    baseUrl = 'https://api.zite.com/api/v2'
    loginPath = '/account/login/'
    articlesPath = '/news/'
    logEventPath = '/log/event/'

    defaultParams =
      appver: '2.0'
      deviceType: 'ipad'

    formPost = (url, data) ->
      $http {
        method: 'POST'
        url: url
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        params: data
      }

    credential:
      token: null
      userId: null

    login: (email, password) ->
      params =
        email: email
        password: password
      angular.merge(params, defaultParams)
      formPost(baseUrl + loginPath, params)

    getArticles: (section = "topstories") ->
      $http.get(baseUrl + articlesPath, { params: angular.merge({ section: section }, defaultParams, @credential) })

    markAsRead: (section, url) ->
      params =
        section: section
        url: url
        event: 'ArticleView'
        orientation: 'portrait'
        source: 'section'
        webmode: false
      angular.merge(params, defaultParams)
      formPost(baseUrl + logEventPath, params)
