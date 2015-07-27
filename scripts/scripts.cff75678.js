(function(){"use strict";angular.module("ziteApp",["ngAnimate","ngCookies","ngResource","ngRoute","ngSanitize","ngTouch","angular-loading-bar"]).config(["$httpProvider",function(a){return a.defaults.headers.common={},a.defaults.headers.post={},a.defaults.headers.put={},a.defaults.headers.patch={}}]).config(["$routeProvider",function(a){return a.when("/",{templateUrl:"views/main.html",controller:"MainCtrl",controllerAs:"main"}).when("/section/:section?",{templateUrl:"views/main.html",controller:"MainCtrl",controllerAs:"main"}).when("/about",{templateUrl:"views/about.html",controller:"AboutCtrl",controllerAs:"about"}).when("/login",{templateUrl:"views/login.html",controller:"LoginCtrl",controllerAs:"login"}).otherwise({redirectTo:"/"})}])}).call(this),function(){"use strict";angular.module("ziteApp").controller("MainCtrl",["$location","$window","$routeParams","Auth","News",function(a,b,c,d,e){var f;f=this,d.is_loggedin(),f.credential=d.credential,f.section=c.section||"topstories",e.fetch(f.section).then(function(a){return f.documents=a})}])}.call(this),function(){"use strict";angular.module("ziteApp").controller("AboutCtrl",function(){this.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]})}.call(this),function(){"use strict";angular.module("ziteApp").factory("ZiteServer",["$http",function(a){var b,c,d,e,f,g;return c="https://api.zite.com/api/v2",g="/account/login/",b="/news/",f="/log/event/",d={appver:"2.0",deviceType:"ipad"},e=function(b,c){return a({method:"POST",url:b,headers:{"Content-Type":"application/x-www-form-urlencoded"},transformRequest:function(a){var b,c,d;c=[];for(b in a)d=a[b],c.push(encodeURIComponent(b)+"="+encodeURIComponent(d));return c.join("&")},data:c})},{credential:{},login:function(a,b){var f;return f={email:a,password:b},angular.merge(f,d),e(c+g,f)},getArticles:function(e){return null==e&&(e="topstories"),a.get(c+b,{params:angular.merge({section:e},d,this.credential)})},markAsRead:function(a,b){var g;return g={section:a,url:b,event:"ArticleView",orientation:"portrait",source:"section",webmode:!1},angular.merge(g,d,this.credential),e(c+f,g)}}}])}.call(this),function(){"use strict";angular.module("ziteApp").controller("LoginCtrl",["Auth","$window","$location",function(a,b,c){var d;d=this,d.credential=a.credential,a.is_loggedin()&&c.path("/"),d.login=function(){return a.log_in(d.user.email,d.user.password,"/")}}])}.call(this),function(){"use strict";angular.module("ziteApp").filter("fromNow",function(){return function(a){return moment.unix(a).fromNow()}})}.call(this),function(){"use strict";angular.module("ziteApp").filter("domain",function(){return function(a){var b,c,d;return d=/\w+:\/\/([\w|\.]+)/,b=d.exec(a),null!==b?c=b[1]:void 0}})}.call(this),function(){"use strict";angular.module("ziteApp").directive("article",["LogEvent",function(a){return{restrict:"EA",templateUrl:"views/templates/article.html",scope:{document:"=",section:"="},controller:["$scope","$window","$location",function(b,c,d){var e,f,g,h;for(h=b.document.images,f=0,g=h.length;g>f;f++){if(e=h[f],e.h===e.w&&e.h>=120){b.document.cover_url=e.url;break}if(e.w>800&&e.h<e.w/2){b.document.cover_url=e.url,b.document.is_full_pic=!0;break}}return b.visitLink=function(){return b.document.isread=1,a.markAsRead(b.section,b.document.url),c.open(b.document.url,"_blank"),!0},b.clickTag=function(a){return d.path("/section/"+a.id),!0}}]}}])}.call(this),function(){"use strict";angular.module("ziteApp").service("Auth",["$location","$window","ZiteServer",function(a,b,c){var d;this.credential=angular.fromJson(b.sessionStorage.getItem("credential"))||{},d=this,this.is_loggedin=function(){var b;return b=this.credential.hasOwnProperty("userId"),b||a.path("/login"),b},this.log_in=function(e,f,g){return c.login(e,f).success(function(c){return d.credential=c,b.sessionStorage.setItem("credential",angular.toJson(d.credential)),a.path(g)}).error(function(a,b){return d.credential=a})}}])}.call(this),function(){"use strict";angular.module("ziteApp").service("News",["ZiteServer","Auth","$q",function(a,b,c){this.articles={},this.load=function(d){var e,f;return null==d&&(d="topstories"),e=c.defer(),a.credential=b.credential,f=this,a.getArticles(d).success(function(a){return f.articles[d]=a.documents,e.resolve()}).error(function(){return e.reject()}),e.promise},this.fetch=function(a){var b,d;return null==a&&(a="topstories"),b=c.defer(),this.articles.hasOwnProperty(a)&&null!==this.articles[a]?b.resolve(this.articles[a]):(d=this,this.load(a).then(function(){return b.resolve(d.articles[a])})["catch"](function(){return b.reject()})),b.promise}}])}.call(this),function(){"use strict";angular.module("ziteApp").service("LogEvent",["ZiteServer","Auth",function(a,b){this.markAsRead=function(c,d){return a.credential=b.credential,a.markAsRead(c,d)}}])}.call(this),angular.module("ziteApp").run(["$templateCache",function(a){"use strict";a.put("views/about.html","<p>This is the about view.</p>"),a.put("views/login.html",'<div class="auth-forms"> <h2>Login</h2> <form ng-submit="login.login()"> Email: <input type="email" ng-model="login.user.email" class="form-control"> Password: <input type="password" ng-model="login.user.password" class="form-control"> <input type="submit" class="btn btn-primary"> </form> </div>'),a.put("views/main.html",'<div class="content"> <ul class="articles"> <li ng-repeat="document in main.documents"> <article section="main.section" document="document"> </article></li> </ul> </div> <br>'),a.put("views/templates/article.html",'<div class="article"> <div class="title_row"> <a class="article_title{{ document.isread > 0 ? \'_read\' : \'\' }}" href ng-click="visitLink()" ng-attr-title="{{ document.title }}"> {{ document.title }} </a> </div> <div class="info_row"> <a class="article_host" ng-href="{{ document.url }}" ng-attr-title="{{ document.title }}"> {{ document.source.name }} </a> <span class="host"></span> <span class="author" ng-if="document.author != null"> · by {{ document.author }}</span> <span class="timestamp"> · {{ document.timestamp | fromNow }}</span> <ul class="tags"> <li ng-repeat="topic in document.relatedtopics | limitTo:2"> <a href ng-click="clickTag(topic)" class="tag">{{ topic.name }}</a> </li> </ul> </div> <div class="content_row"> <div class="image_cover_div" ng-if="document.cover_url != null"> <img class="{{ document.is_full_pic ? \'full_\' : \'\' }}image_cover" ng-src="{{ document.cover_url }}" alt="Cover Image"> </div> <div class="text_content" ng-if="!document.is_full_pic"> <p class="summary"> {{ document.summary[0] | limitTo:350 }} <span ng-if="document.summary[0].length > 350">...</span> </p> </div> </div> </div>')}]);