<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>





<!DOCTYPE html>
<html ng-app="app">
<head>
<meta charset="utf-8" />

<!-- 
<spring:url value="/resources/css/welcome.css" var="coreCss" />
<link href="${coreCss}" rel="stylesheet" />
<link rel="/resources/css/welcome.css" href="welcome.css"> -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet" />



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script src="<c:url value="/resources/js/app.js" />"></script>
<script src="<c:url value="/resources/js/controllers.js" />"></script>





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
  siema ${user.imie} 
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

		<div ng-controller="PController as vm">
			<c:forEach items="${lista.getBookList()}" var="list">
				<dl class="dl-horizontal"
					style="float: left; margin-left: 10px; margin-right: 10px; width: 190px; margin-left: 0;">

					<dt style="margin-bottom: 1em; width: auto; padding-right: 1em;">${list.nazwiskoautora}</dt>

					<dt>
						<p style="width: auto; white-space: normal; padding-right: 1em; text-align: left;">${list.tytul}</p>
					</dt>
					<dt>
						<img style="width: 120px; height: 150px;"
							src='<c:url value="/resources/img/${list.idksiazki}.jpg"></c:url>' />
					</dt>

					<dt>
						<p>${list.cena}PLN</p>
					</dt>
					<dt>
						<p>ilosc w magazynie: ${list.ilosc}</p>
						ilość: <input style="width: 70px;" type="text"
							ng-model="vm.ilosc${list.idksiazki}">
						{{vm.ilosc${list.idksiazki}}}
					</dt>
					<dt>
						<button style="margin-top: 5px;"
							ng-click="dodaj('${list.idksiazki}',vm.ilosc${list.idksiazki})">dodaj
							do koszyka</button>
					</dt>
				</dl>
			</c:forEach>
		</div>






	</div>







	<!-- 
<div id="TopContainer">
			<div id="top">
					<a href=/ksiegarnia>
			
				<img height="300px" name="obrazek"
					src="<c:url value="/resources/img/books.png" />">
					</a>
			
			</div>
			<div id="title">Bardzo fajna ksiegarnia</div>
	
		<div id="koszyk">
			<a href="/ksiegarnia/cart"> koszyk zakupów </a>
		</div>

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
</div>

<div id="DownContainer">
	<div id="cont" ng-controller="PController as vm">
		<c:forEach items="${lista.getBookList()}" var="list">
			<div class = "product">
				<h3>${list.nazwiskoautora}</h3>
				<p>${list.tytul}</p>
				<img style="width: 120px; height: 150px;"
					src='<c:url value="/resources/img/${list.idksiazki}.jpg"></c:url>' />
				<p>${list.cena}PLN</p>
				<p>ilosc w magazynie: ${list.ilosc}</p>
				ilość: <input type="text" ng-model="vm.ilosc${list.idksiazki}"><br />
				{{vm.ilosc${list.idksiazki}}}
				<button
					ng-click="dodaj('${list.idksiazki}',vm.ilosc${list.idksiazki})">dodaj
					do koszyka</button>
			</div>

		</c:forEach>
	</div>
	<c:choose>
<c:when test="${not empty sessionScope.user}">
<div id="logging">siema ${user.imie} </br>
<a href="/ksiegarnia/user/logout">Wyloguj sie</a></div>
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



	<div style="clear: both;"></div>
	<div id="filtr">
		Przefiltruj cenowo:
		<form action="/ksiegarnia/product/cost" method="post">
			Minimalna cena: <input name="min" /> Maksymalna cena: <input
				name="max" /> <input type="submit" value="filtruj" />
		</form>
	</div>
	</div>
	






 -->
</body>
</html>