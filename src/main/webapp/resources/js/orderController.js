angular.module('orderApp').controller(
		'orderController',
		function($http, $scope) {
			$scope.status = [ "zrealizowane", "wyslane", "oczekujace" ];

			$scope.ref = function() {

				$http.get('/ksiegarnia/admin').success(function(data) {

				});
			};

			$scope.orderUpdate = function(id, status) {
				$scope.id = id;
				$scope.ss = status;

				// alert("Jestem tutaj "+ $scope.id+ " nowy status = " +
				// $scope.ss);

				$http.put(
						'/ksiegarnia/admin/order/updateStatus/' + $scope.id
								+ '/' + $scope.ss).success(function(data) {
					// reload page
					location.reload();

				});

			};

		});
