var app = angular.module('appDemo', [
  'ngRoute',
  'empleadoControllers'
]);

app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/', {
        templateUrl: 'vistas/listado.html',
        controller: 'EmpleadoListadoCtrl'
      }).
      otherwise({
        redirectTo: '/'
      });
  }]);