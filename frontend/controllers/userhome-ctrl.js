var UserHomeCtrl = function($scope, LoginService, ToastService, $state) {
    //Mapeo nombres scheme a visibles para el usuario
    $scope.campNames = {"name" : "Nombre",
                        "year": "Año",
                        "platform": "Plataforma",
                        "genre": "Género",
                        "company": "Compañia",
                        "developer": "Desarrollador",
                        "composer": "Compositor",
                        "state" : "Estado",
                        "first_completion_year": "Primer completado",
                        "times": "Tiempos",
                        "time" : "Tiempo"
                       }

   
    $scope.games = [{"name": "Final Fantasy VI", "genre": "RPG", "year" : 2010},
    {"name":"Jumbotron" , "campo_vacio" : ""},
    {"name":"Jumbotron Plus", "genre": "awesomness"}];


};


angular.module('GameChestApp').controller('UserHomeCtrl', ['$scope', 'LoginService', 'ToastService', '$state', UserHomeCtrl]);
