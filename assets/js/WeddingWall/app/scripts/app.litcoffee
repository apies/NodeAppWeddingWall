App File
--------

This file ties the app together with dependencies listed as
an array of strings as the second argument. The third argument
instantiates the routes and associates them with controllers
and templates

    angular
      .module('weddingWallApp', [
        'ngCookies',
        'ngResource',
        'ngSanitize',
        'ngRoute',
        'btford.socket-io',
        'weddingWallApp:directives',
        'weddingWallApp:services'
      ])
      .config ($routeProvider) ->
        $routeProvider
          .when '/',
            templateUrl: 'views/home.html'
            controller: 'MainCtrl'
          .when '/the-big-day',
            templateUrl: 'views/the_big_day.html'
            controller: 'TheBigDayCtrl'
          .when '/our-story',
            templateUrl: 'views/our_story.html'
            controller: 'OurStoryCtrl'
          .when '/registry',
            templateUrl: 'views/registry.html'
            controller: 'RegistryCtrl'
          .when '/wedding_wall',
            templateUrl: 'views/wedding_wall.html'
            controller: 'WeddingWallCtrl'
          .when '/login/:userId',
            template: ''
            controller: 'LoginCtrl'
          .otherwise
            redirectTo: '/'
      .factory 'socket', (socketFactory) ->
        socketFactory()

