<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>





<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />


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
						<li><a href=/ksiegarnia/admin/product>zarządzanie książkami</a></li>
						<li><a href=/ksiegarnia>zarządzanie zamowieniami</a></li>
						<li><a href=/ksiegarnia/product>zarzadznie uzytkownikami</a></li>
					</ul>
				</div>
			</nav>
		</div>


		<form:form method="POST" action="/ksiegarnia/admin/product/addBook"
			modelAttribute="book">
			<table class="table table-hover">
				<tr>
					<td><form:label path="tytul">tytul</form:label></td>
					<td><form:input path="tytul" /></td>
					<td><form:errors path="tytul" cssStyle="color: red;"></form:errors></td>
				</tr>
				<tr>
					<td><form:label path="imieautora">imieautora</form:label></td>
					<td><form:input path="imieautora" /></td>
					<td><form:errors path="imieautora" cssStyle="color: red;"></form:errors></td>
				</tr>
				<tr>
					<td><form:label path="nazwiskoautora">nazwiskoautora</form:label></td>
					<td><form:input path="nazwiskoautora" /></td>
					<td><form:errors path="nazwiskoautora" cssStyle="color: red;"></form:errors></td>

				</tr>

				<tr>
					<td><form:label path="cena">cena</form:label></td>
					<td><form:input path="cena" /></td>
					<td><form:errors path="cena" cssStyle="color: red;"></form:errors></td>
				</tr>
				<tr>
					<td><form:label path="ilosc">ilosc</form:label></td>
					<td><form:input path="ilosc" /></td>
					<td><form:errors path="ilosc" cssStyle="color: red;"></form:errors></td>


					<td><input type="submit" value="Submit" /></td>
				</tr>
			</table>
		</form:form>






	</div>

</body>
</html>