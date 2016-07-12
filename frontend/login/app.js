var App = angular.module('FormsApp', []);

App.controller('FormsController', ['$scope', function($scope) {
    $scope.login_status = "no";
    $scope.users = [{mail: "hola@hola.com", password: "hola"},
                    {mail: "pepe@pepe.com", password: "pepe"}];
}]);
