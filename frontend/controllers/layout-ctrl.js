var LayoutCtrl = function($scope, $state, LoginService, TareasService) {
    
    $scope.show = false;
    
    $scope.games = ["Final Fantasy VI", "Jumbotron", "Jumbotron Plus"];
  
    $scope.logout = function() {
        LoginService.logout();
        TareasService.reset();
        $state.go('login');
    };
    
    $scope.goUser = function() {
        $state.go('userhome');
    };

    $scope.addGame = function () {
        $state.go('gamelist');
    }

    $scope.username = function () {
        return LoginService.getUser();
    }

    $scope.loggedIn = function () {
        return LoginService.isLoggedIn();
    }

    $scope.showLogout = function() { return LoginService.isLoggedIn(); }
};


angular.module('GameChestApp').controller('LayoutCtrl', ['$scope', '$state', 'LoginService', 'TareasService', LayoutCtrl]);
