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
    loginPath = '/account/login'

    defaultParams =
      appver: '2.0'
      deviceType: 'ipad'

    formPost = (url, data) ->
      $http {
        method: 'POST'
        url: url
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        transformRequest: (obj) ->
          str = []
          for k, v of obj
            str.push(encodeURIComponent(k) + "=" + encodeURIComponent(v))
          str.join("&")
        data: data
      }


    token: null
    userId: null

    login: (email, password) ->
      params =
        email: email
        password: password
      angular.merge(params, defaultParams)
      formPost(baseUrl + loginPath, params)
