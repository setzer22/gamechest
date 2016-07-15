var UserHomeCtrl = function($scope, LoginService, ToastService, $state) {
    $scope.hola = "hola";

    $scope.show = false;
    
    $scope.games = ["Final Fantasy VI", "Jumbotron", "Jumbotron Plus"];


};


angular.module('GameChestApp').controller('UserHomeCtrl', ['$scope', 'LoginService', 'ToastService', '$state', UserHomeCtrl]);
