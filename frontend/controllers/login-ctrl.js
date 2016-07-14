var LoginCtrl = function($scope, LoginService, ToastService, $state) {
    $scope.user = {
        name: '',
        password: ''
    };

    $scope.login = function() {
        LoginService.login($scope.user)
            .then(function() {
                ToastService.showToast("Bienvenido " + $scope.user.name + ", te has logueado correctamente");
                $state.go('tareas');
            }, function(err) {
                if (err.status === 401) ToastService.showToast("Contraseña incorrecta");
                else if (err.status === 404) ToastService.showToast("El usuario no existe");
                else if (err.status === 500) ToastService.showToast("Ha occurido un error, vuelvelo a intentar");
            });
    };

    $scope.register = function() {
        LoginService.register($scope.user)
            .then(function() {
                ToastService.showToast("Bienvenido " + $scope.user.name + ", te has registrado correctamente");
            }, function(err) {
                console.log(err);
                if (err.code === 11000) ToastService.showToast("El usuario ya existe");
                else if (err.status === 500) ToastService.showToast("Ha occurido un error, vuelvelo a intentar");
            });
   };
};


angular.module('GameChestApp').controller('LoginCtrl', ['$scope', 'LoginService', 'ToastService', '$state', LoginCtrl]);
