var AboutCtrl = function($scope, $state) {
    $scope.goto_autor = function () {
        $state.go('author');
    }
    $scope.goto_pagina = function() {
        $state.go('pagina');
    }
};


angular.module('RandomApp').controller('AboutCtrl', ['$scope', '$state', AboutCtrl]);
