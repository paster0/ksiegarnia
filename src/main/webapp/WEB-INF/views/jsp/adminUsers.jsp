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
<title>użytkownicy</title>
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
						<li><a href=/ksiegarnia/admin/user>zarządzanie użytkownikami</a></li>
					</ul>
				</div>
			</nav>
		</div>
		<div>
			<table>
			</table>
			<div>
				<table class="table table-striped">
					<tr>
						<th>Id klienta</th>
						<th>imie</th>
						<th>nazwisko</th>
						<th>adres</th>
						<th>email</th>
					</tr>
					<c:forEach items="${list}" var="list">
						<tr>
							<th>${list.id}</th>
							<td>${list.imie}</td>
							<td>${list.nazwisko}</td>
							<td>${list.adres}</td>
							<td>${list.email}</td>
							<td>
								<form method="post" action="/ksiegarnia/admin/user/update">
									<input type="hidden" value="${list.id}" name="id" />
									<button type="submit">zmien dane użytkownika</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
</body>
</html>