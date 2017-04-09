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
						<li><a href=/ksiegarnia>zarządzanie zamowieniami</a></li>
						<li><a href=/ksiegarnia/product>zarzadznie uzytkownikami</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>











</body>
</html>