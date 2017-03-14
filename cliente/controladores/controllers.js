var empleadoControllers = angular.module('empleadoControllers', []);

empleadoControllers.controller('EmpleadoListadoCtrl', ['$scope', '$http', function ($scope, $http) {
  empleados();
  
  function empleados() {
    $http.get('http://localhost/influencias/servidor/controladores/?a=listar').then(function(r){
        $scope.model = r.data;
    });
  }
        
  $scope.registrar = function() {
    var model = {
      estocolmo: $scope.estocolmo,
      londres: $scope.londres
    };
    if ($scope.estocolmo >= 1000 && $scope.estocolmo <= 1999 && $scope.londres >= 2000 && $scope.londres <= 2999){
      $http.post('http://localhost/influencias/servidor/controladores/?a=registrar', model)
      .then(function(r) {
        empleados();
        $scope.estocolmo = null;
        $scope.londres = null;
      });  
    }
    
  }

}]);
