<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>

<html ng-app="app">
<head>
<meta charset="utf-8" />
<title>Koszyk</title>

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
							<button type="submit" class="btn btn-default" value="Login">Zaloguj</button>
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
</body>
</html>