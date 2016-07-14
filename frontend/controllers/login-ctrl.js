var LoginCtrl = function($scope, LoginService, ToastService, $state) {
    $scope.user = {
        name: '',
        password: ''
    };

    $scope.login = function() {
        LoginService.login($scope.user)
            .then(function() {
                // Si todo correcto, vamos al estado tareas
                $state.go('tareas');
            }, function(err) {
                // Nuevamente discrimanos según el estado de la respuesta
                if (err.status === 401) ToastService.showToast("Contraseña incorrecta");
                else if (err.status === 404) ToastService.showToast("El usuario no existe");
                else if (err.status === 500) ToastService.showToast("Ha occurido un error, vuelvelo a intentar");
            });
    };

    $scope.register = function() {
        $state.go('register')
    }
};


angular.module('GameChestApp').controller('LoginCtrl', ['$scope', 'LoginService', 'ToastService', '$state', LoginCtrl]);
