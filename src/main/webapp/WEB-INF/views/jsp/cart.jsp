<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>

<html ng-app="app">
<head>
<meta charset="utf-8" />
<title>Angular</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script src="<c:url value="/resources/js/app.js" />"></script>
<script src="<c:url value="/resources/js/controllers.js" />"></script>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet" />

</head>
<body>

	<div class="container">
		<div class="page-header row">

			<div class="pull-left">
				<a href=/ksiegarnia> <img class="img-rounded"
					src="<c:url value="/resources/img/books.png" />" width="304"
					height="236">
				</a>
			</div>
			<h1 class="text-center jumbotron vertical-center">Ksiegarnia</h1>

			<div class="pull-right">

				<a href="/ksiegarnia/cart"> Koszyk zakupów <span
					class="glyphicon glyphicon-shopping-cart"></span></a>

			</div>
		</div>

		<div>
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">Nawigacja</a>
					</div>
					<ul class="nav navbar-nav">
						<li><a href="/ksiegarnia">Strona główna</a></li>
						<li><a href="/ksiegarnia/product">Zobacz książki</a></li>
						<li><a href="#">O nas</a></li>
					</ul>
				</div>
			</nav>

			<div class="pull-right">
				<c:choose>
					<c:when test="${not empty sessionScope.user}">
  Witaj ${user.imie} 
<a href="/ksiegarnia/user/logout">Wyloguj sie</a>
					</c:when>
					<c:otherwise>

						<form method="post" action="\ksiegarnia\user\login">
							<div class="form-group">
								<label for="exampleInputEmail1">Email</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									name="mail">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Hasło</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="haslo">
							</div>
							<div class="checkbox">
								<label> <input type="checkbox"> Zapamietaj mnie
								</label>
							</div>
							<button type="submit" class="btn btn-default" value="Login">Submit</button>
						</form>
						<td colspan="2">Nie masz konta? <a
							href="/ksiegarnia/user/reg">Zarejestruj sie</a></td>
			</div>
			</c:otherwise>
			</c:choose>
		</div>

		<div class="col-md-6" ng-controller="PController as vm"
			ng-init="init('${cartId}')">
			<h1>Koszyk zakupów</h1>
			<table class="table">
				<tr>
					<th>Produkt</th>
					<th>Cena za sztukę</th>
					<th>Liczba sztuk</th>
					<th>Cena</th>
					<th>Akcja</th>
				</tr>
				<tr ng-repeat="item in cart.cartItems">
					<td>{{item.book.tytul}}</td>
					<td>{{item.book.cena}}</td>
					<td>{{item.quantity}}</td>
					<td>{{item.totalPrice}}</td>
					<td></td>
					<td><a href="#"
						ng-click="usun(item.book.idksiazki, '${cartId}')">usun</a></td>
				</tr>
				<tr>
					<th></th>
					<th></th>
					<th>Łączna cena</th>
					<th>{{cart.grandTotal}}</th>
					<th></th>
				</tr>
			</table>
			<form action="/ksiegarnia/order" method="get">
				<input type="submit" value="Zamawiam" onclick="return confirm('Jestes pewny?')"/>
			</form>
			<h1 style="color: red; font-size: 22px;">${blad}</h1>




		</div>
























		<!--  
	<div id="top">
		Bardzo fajna ksiegarnia <img
			src="<c:url value="/resources/img/books.png" />" width="400px"
			height="200px" style="float: left;">

	</div>
	<a href="/ksiegarnia/cart"><div">koszyk zakupów</div></a>
	<div style="clear: both;"></div>
	</a>
	<div style="clear: both;"></div>
	<div id="menu">
		<ol>
			<li><a href=/ksiegarnia>Strona główna</a></li>
			<li>Oferta</li>
			<li><a href=/ksiegarnia/product>Zobacz ksiazki</a></li>
			<li>O nas</li>
			<li>Kontakt</li>
		</ol>
	</div>

	<div id = "cont" ng-controller="PController as vm" ng-init="init('${cartId}')">
		<h1>Koszyk zakupów</h1>

		<table class="table table-hover">
			<tr>
				<th>Produkt</th>
				<th>Cena za sztukę</th>
				<th>Liczba sztuk</th>
				<th>Cena</th>
				<th>Akcja</th>
			</tr>
			<tr ng-repeat="item in cart.cartItems">
				<td>{{item.book.tytul}}</td>
				<td>{{item.book.cena}}</td>
				<td>{{item.quantity}}</td>
				<td>{{item.totalPrice}}</td>
				<td></td>
				<td><a href="#" ng-click="usun(item.book.idksiazki, '${cartId}')">usun</a></td>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th>Łączna cena</th>
				<th>{{cart.grandTotal}}</th>
				<th></th>
			</tr>
		</table>





		<button ng-click="ref('${cartId}')">Tutaj nie klikaj</button>
		<form action="/ksiegarnia/order" method="get">
			<input type="submit" value="Zamawiam" />
		</form>
		
<h1>${blad}</h1>



	</div>

<c:choose>
<c:when test="${not empty sessionScope.user}">
siema ${user.imie} </br>
<a href="/ksiegarnia/user/logout">Wyloguj sie</a>
</c:when>
<c:otherwise>
		<div id="logging">
			<form method="post" action="\ksiegarnia\user\login">
				<table>
					<thead>
						<tr>
							<th colspan="2">Zaloguj sie</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Email</td>
							<td><input type="text" name="mail" value="" /></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="password" name="haslo" value="" /></td>
						</tr>
						<tr>
							<td><input type="submit" value="Login" /></td>
							<td><input type="reset" value="Reset" /></td>
						</tr>
						<tr>
							<td colspan="2">Nie masz konta? <a href="/ksiegarnia/user/reg">Zarejestruj
									sie</a></td>
						</tr>
					</tbody>
				</table>
			</form>	
</div>

</c:otherwise>
</c:choose>

	-->
</body>
</html>