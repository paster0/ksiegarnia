<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html ng-app="orderApp">
<head>
<meta charset="utf-8" />

<!-- 
<spring:url value="/resources/css/welcome.css" var="coreCss" />
<link href="${coreCss}" rel="stylesheet" />
<link rel="/resources/css/welcome.css" href="welcome.css"> -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet" />
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script src="<c:url value="/resources/js/orderApp.js" />"></script>
<script src="<c:url value="/resources/js/orderController.js" />"></script>
<script type="text/javascript">

	function toggle_visibility(id) {
		var e = document.getElementById(id);
		if (e.style.display == 'block')
			e.style.display = 'none';
		else
			e.style.display = 'block';
	}	

	
	
	
</script>
<title>Insert title here</title>

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
		</div>
		<div>
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">Nawigacja</a>
					</div>
					<ul class="nav navbar-nav">
						<li><a href=/ksiegarnia/admin/product>zarządzanie
								książkami</a></li>
						<li><a href=/ksiegarnia/admin/order>zarządzanie
								zamowieniami</a></li>
						<li><a href=/ksiegarnia/admin/user>zarzadznie
								uzytkownikami</a></li>
					</ul>
				</div>
			</nav>
		</div>

		<a href="/ksiegarnia/admin/order/done">zrealizowane zamowienia</a>
		<div ng-controller="orderController as cont">
			<table class="table table-striped">
				<tr>
					<th>Id zamowienia</th>
					<th>adres</th>
					<th>cena</th>
					<th>status</th>
					<th>pokaz szczegóły</th>
				</tr>


				<c:forEach items="${list}" var="list">
					<tr class="table table-striped">
						<th>${list.id}</th>
						<td>${list.adres}</td>
						<td>${list.cena}</td>
						<td><c:if test="${list.status eq 'zrealizowane'}">
								<c:set var="st" value="${0}" />

							</c:if> <c:if test="${list.status eq 'wyslane'}">
								<c:set var="st" value="${1}" />
							</c:if> <c:if test="${list.status eq 'oczekujace'}">
								<c:set var="st" value="${2}" />
							</c:if> <select ng-model="selected${list.id}"
							ng-options="item for item in status"
							ng-init="selected${list.id} = status[${st}]">
						</select>


							<button ng-click="orderUpdate('${list.id}', selected${list.id})">zmien</button></td>
						<td>
							<button id="hide" onclick="toggle_visibility('d'+${list.id});">pokaz/ukryj
								szczegóły</button>
						</td>
					</tr>



					<div id='d${list.id}' style='display: none;'>

						<h2>Szczegóły zamówienia nr.${list.id}</h2>
						</br>
						<p>Dane klienta: imie: ${list.user.imie} nazwisko:
							${list.user.imie} adres: ${list.user.adres} email:
							${list.user.email}</p>
						</br>
						<h4>Zamówione przedmioty:</h4>

						<c:forEach items="${list.orderItem}" var="item">
					  Tytul książki: ${item.book.tytul} </br>
					 autor: ${item.book.imieautora} ${item.book.nazwiskoautora} </br>
					 ilosc sztuk: ${item.ilosc} </br>
					 cena za sztuke: ${item.book.cena} zł </br>

						</c:forEach>

						uwagi: ${list.uwagi} </br>

						<form action="/ksiegarnia/admin/order/updateStatus/uwagi" method="post">
						
							<input  type="hidden" name="id" value="${list.id}" />
							<input type="text" name="uwagi" value="${list.uwagi}" />
							<input type="submit">
						</form>
						</br>
					</div>

				</c:forEach>

			</table>
		</div>



	</div>


</body>
</html>