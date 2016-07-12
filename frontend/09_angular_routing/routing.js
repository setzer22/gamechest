// Aquí definís el enrutamiento con ui-router
var router = function($stateProvider, $urlRouterProvider) {
    $stateProvider
        .state('layout', {
            abstract: true,
            templateUrl: 'partials/layout.html',
            controller: 'LayoutCtrl'
        })
        .state('pietMondrian', {
            url: '/piet-mondrian',
            parent: 'layout',
            templateUrl: 'partials/pietMondrian.html',
            controller: 'PietMondrianCtrl'
        })
        .state('ciclistas', {
            url: '/ciclistas',
            parent: 'layout',
            templateUrl: 'partials/ciclistas.html',
            controller: 'CiclistasCtrl'
        })
        .state('about', {
            url: '/about',
            parent: 'layout',
            templateUrl: 'partials/about.html',
            controller: 'AboutCtrl'
        })
        .state('author', {
            url: '/author',
            parent: 'about', 
            templateUrl: 'partials/about/autor.html'
        })
        .state('pagina', {
            url: '/pagina',
            parent: 'about', 
            templateUrl: 'partials/about/pagina.html'
        });

    $urlRouterProvider.otherwise('/piet-mondrian');
};

angular.module('RandomApp').config(['$stateProvider', '$urlRouterProvider', router]);
