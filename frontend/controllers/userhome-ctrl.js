var UserHomeCtrl = function($scope, LoginService, ToastService, $state) {
    //Mapeo nombres scheme a visibles para el usuario
    $scope.campNames = {"name" : "Nombre",
                        "year": "Año",
                        "platform": "Plataformas",
                        "genre": "Género",
                        "company": "Compañia",
                        "developer": "Desarrollador",
                        "composer": "Compositor"
                       }

   
    
    $scope.show = false; 
    $scope.games = [{"name": "Final Fantasy VI", "genre": "RPG", "year" : 2010},
    {"name":"Jumbotron" , "campo_vacio" : ""},
    {"name":"Jumbotron Plus", "genre": "awesomness"}];


};


angular.module('GameChestApp').controller('UserHomeCtrl', ['$scope', 'LoginService', 'ToastService', '$state', UserHomeCtrl]);
