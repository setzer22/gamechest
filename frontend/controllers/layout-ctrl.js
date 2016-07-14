var LayoutCtrl = function($scope, $state, LoginService, TareasService) {
    
    $scope.logout = function() {
        LoginService.logout();
        TareasService.reset();
        $state.go('login');
    };

    $scope.username = function () {
        return LoginService.getUser();
    }

    $scope.loggedIn = function () {
        return LoginService.isLoggedIn();
    }

    $scope.showLogout = function() { return LoginService.isLoggedIn(); }
};


angular.module('GameChestApp').controller('LayoutCtrl', ['$scope', '$state', 'LoginService', 'TareasService', LayoutCtrl]);
