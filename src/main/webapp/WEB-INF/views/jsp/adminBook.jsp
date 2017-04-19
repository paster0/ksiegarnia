<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>





<!DOCTYPE html>
<html>
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
						<li><a href=/ksiegarnia/admin/product>zarządzanie książkami</a></li>
						<li><a href=/ksiegarnia/admin/order>zarządzanie zamowieniami</a></li>
						<li><a href=/ksiegarnia/admin/user>zarzadznie uzytkownikami</a></li>
					</ul>
				</div>
			</nav>
		</div>
	
	<a href = "/ksiegarnia/admin/product/addBook">Dodaj ksiazke</a>
	<div class="row">
		<c:forEach items="${lista}" var="list">
			<div class="col-xs-6 col-md-2" style="float: left; margin-left: 20px;">
				<h3>${list.nazwiskoautora}</h3>
				<p>${list.tytul}</p>
				<img style="width: 120px; height: 150px;"
					src='<c:url value="/resources/img/${list.idksiazki}.jpg"></c:url>' />
				<p>${list.cena}PLN</p>
				<p>ilosc: ${list.ilosc}</p>
				<form action="/ksiegarnia/admin/product/update" method="post">
					<input type="hidden" name="id" value="${list.idksiazki}" /> <input
						type="submit" value="zmien dane"></input>
				</form>
				<form action="/ksiegarnia/admin/drop" method="post">
					<input type="hidden" name="id" value="${list.idksiazki}" /> <input
						type="submit" value="zmien obrazek"></input>
				</form>
				<form action="/ksiegarnia/admin/drop" method="post">
					<input type="hidden" name="id" value="${list.idksiazki}" /> <input
						type="submit" value="usun"></input>
				</form>
			</div>
		</c:forEach>
	</div>


	</div>



</body>
</html>