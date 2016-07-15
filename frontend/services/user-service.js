UserService = function($http, $q, $window) {
    var get = function(method) {
        return function () {
            console.log("get for "+method);
            var q = $q.defer();
            $http.get("http://localhost:8080/user/"+method)
                .then(
                    function(response) {console.log(response.data); q.resolve(response.data)},
                    function(err) {q.reject(err);}
                );
            return q.promise;
        }
    };

    this.playedGames = get('played_games');
    this.noPlayedGames = get('no_played_games');
    this.allGames = get('all_games');
    this.game_list = get('game_list');

    this.add_game = function (body) {
        q = $q.defer();

        console.log(body);
        
        $http.post("http://localhost:8080/user", body).then(
            function (ok) {
                console.log(ok);
                q.resolve(ok);
            },
            function (err) {
                console.log(err);
                q.resolve(err);
            }
        );

        return q.promise;
    }
}

angular.module('GameChestApp').service('UserService', ['$http', '$q', '$window', UserService]);
