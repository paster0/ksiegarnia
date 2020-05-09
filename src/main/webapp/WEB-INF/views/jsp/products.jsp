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
					</ul>
				</div>
			</nav>

			<div class="pull-right">
				<c:choose>
					<c:when test="${not empty sessionScope.user}">
  Witaj  ${user.imie} 
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
		
		<div class="row" style="width: 900px"  ng-controller="PController as vm">
			<c:forEach items="${lista}" var="list">
				<div class="col-xs-6 col-md-4">
					<dl class="dl-horizontal"
						style="margin-left: 10px; margin-right: 10px; width: 190px; margin-left: 0;">

						<dt style="margin-bottom: 1em; width: auto; padding-right: 1em;">${list.nazwiskoautora}</dt>

						<dt>
							<p
								style="width: auto; white-space: normal; padding-right: 1em; text-align: left;">${list.tytul}</p>
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
				</div>
			</c:forEach>

		</div>





	</div>





</body>
</html>