angular.module('app').controller(
		'PController',
		function($http, $scope) {
			$scope.cart = 'pusto';
			this.ref = function(cartId) {
				$scope.cartId = cartId;
				$http.get('/ksiegarnia/rest/cart/' + $scope.cartId).success(
						function(data) {
							$scope.cart = data;
						});
			};

			$scope.dodaj = function(cartId, ilosc) {

				$scope.cartId = cartId;
				$scope.ilosc = ilosc;
				for (var x = 0; x < ($scope.ilosc); x++) 
				{
					
					$http.put('/ksiegarnia/rest/cart/add/' + $scope.cartId)
							.success(function(data)

							{
							});
				}

			}

			$scope.usun = function(idksiazki) {
				$scope.idksiazki = idksiazki;
				$http.put('/ksiegarnia/rest/cart/remove/' + $scope.idksiazki)
						.success(function(data) {
						});
			}

		});