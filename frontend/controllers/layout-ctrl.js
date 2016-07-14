var LayoutCtrl = function($scope, $state, LoginService, TareasService) {
    $scope.pageName = function() {
        if ($state.includes('login')) return "Login";
        else return "Listado de Tareas";
    };

    $scope.logout = function() {
        LoginService.logout();
        TareasService.reset();
        $state.go('login');
    };

    $scope.showLogout = function() { return LoginService.isLoggedIn(); }
};


angular.module('GameChestApp').controller('LayoutCtrl', ['$scope', '$state', 'LoginService', 'TareasService', LayoutCtrl]);
