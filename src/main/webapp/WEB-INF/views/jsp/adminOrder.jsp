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
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
<script>
$(document).ready(function(){
    $("#hide").click(function(){
        $("#dane").hide();
    });
    $("#show").click(function(){
        $("#dane").show();
    });
});
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
		<table class="table table-striped">
			<tr>
				<th>Id zamowienia</th>
				<th>adres</th>
				<th>cena</th>
				<th>status</th>
				<th>pokaz szczegóły</th>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
					<th>${list.id}</th>
					<td>${list.adres}</td>
					<td>${list.cena}</td>
					<td>${list.status}</td>
					<td><button id="hide">pokaz/ukryj szczegóły</button></td>
				</tr>

				<table id="details">
					<div id = "dane">
						<ul>
							<li class="list-group-item">Uzytkownik: ${list.user.imie}</li>
						</ul>
					</div>
				</table>



			</c:forEach>

		</table>




	</div>
	

</body>
</html>