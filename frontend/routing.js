angular.module('GameChestApp').config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
    function($stateProvider, $urlRouterProvider, $locationProvider) {

    $stateProvider
    .state('layout', {
        abstract: false,
        templateUrl: '/views/partials/layout.html',
        controller: 'LayoutCtrl'
    })
    .state('login', {
        parent: 'layout',
        templateUrl: '/views/partials/login.html',
        url: '/login',
        controller: 'LoginCtrl'
    })
    .state('register', {
        parent: 'layout',
        templateUrl: '/views/partials/register.html',
        url: '/register',
        controller: 'RegisterCtrl'
    });

    // Cuando la ruta a la que acceda el usuario no sea ninguna
    // de las definidas arriba, redirigimos al login
    $urlRouterProvider.otherwise('/login');

    // Con esto evitamos que salga el # siempre en la url
    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });

}]);

// Un .run se ejecuta cuando la aplicación de angular se ha configurado y ya está corriendo
angular.module('GameChestApp').run(['$rootScope', 'LoginService', '$state', function($rootScope, LoginService, $state) {
   $rootScope.$on("$stateChangeStart", function(event, next) {
        if (!LoginService.isLoggedIn() && next.name !== "login") {
            event.preventDefault();
            $state.go("login");
        }
    });
}]);
