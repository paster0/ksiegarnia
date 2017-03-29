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
<link href="<c:url value="/resources/css/welcome.css" />"
	rel="stylesheet" />



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script src="<c:url value="/resources/js/app.js" />"></script>
<script src="<c:url value="/resources/js/controllers.js" />"></script>



</head>
<body>

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
	<div class="cont" ng-controller="PController as vm">
		<c:forEach items="${lista.getBookList()}" var="list">
			<div class="product">
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
		<div id="logging">
			<form method="post" action="\samochody\user\login">

				<table>
					<thead>
						<tr>
							<th colspan="2">Zaloguj sie</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Email</td>
							<td><input type="text" name="name" value="" /></td>
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
							<td colspan="2">Nie masz konta? <a href="user/reg">Zarejestruj
									sie</a></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>



	<div style="clear: both;"></div>
	<div id="filtr">
		Przefiltruj cenowo:
		<form action="/ksiegarnia/product/cost" method="post">
			Minimalna cena: <input name="min" /> Maksymalna cena: <input
				name="max" /> <input type="submit" value="filtruj" />
		</form>
	</div>
	</div>
	







</body>
</html>