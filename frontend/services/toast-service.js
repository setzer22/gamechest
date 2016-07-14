var ToastService = function($mdToast) {

    var toast = $mdToast.simple();

    this.showToast = function(txt) {
        console.log("Toast: " + txt);
        $mdToast.show(
            toast.textContent(txt)
                .position({ left: true, bottom: true, top: false, right: false })
                .hideDelay(6000)
        );
    }
}

angular.module('GameChestApp').service('ToastService', ['$mdToast', ToastService]);
