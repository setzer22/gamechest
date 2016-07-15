var UserHomeCtrl = function($scope, UserService, LoginService, ToastService, $state) {
    //Mapeo nombres scheme a visibles para el usuario
    $scope.campNames = {"name" : "Nombre",
                        "year": "Año",
                        "platform": "Plataforma",
                        "platforms": "Plataforma",
                        "score" : "Valoración",
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

    $scope.game_list = [];
    UserService.game_list()
      .then(
        function(game_list){
           game_list.forEach( function (game) {
              game.name = game.game_id.name;
              delete game.game_id
           }
          )
           $scope.games = game_list;
        },
        function (err) {
           console.log(err);
        }
    );
      
      


};


angular.module('GameChestApp').controller('UserHomeCtrl', ['$scope', 'UserService', 'LoginService', 'ToastService', '$state', UserHomeCtrl]);
