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
						<li><a href="/ksiegarnia">Strona główna</a></li>
						<li><a href="/ksiegarnia/product">Zobacz książki</a></li>
					</ul>
				</div>
			</nav>
		<form:form method="POST" action="/ksiegarnia/admin/user/update/exe"
			modelAttribute="uUser">
			<table class="table table-hover">
				<tr>
					<td><form:label path="email">email</form:label></td>
					<td><form:input path="email" /></td>
					<td><form:errors path="email" cssStyle="color: red;"></form:errors></td>
				</tr>
				<tr>
					<td><form:label path="imie">imie</form:label></td>
					<td><form:input path="imie" /></td>
					<td><form:errors path="imie" cssStyle="color: red;"></form:errors></td>

				</tr>

				<tr>
					<td><form:label path="nazwisko">nazwisko</form:label></td>
					<td><form:input path="nazwisko" /></td>
					<td><form:errors path="nazwisko" cssStyle="color: red;"></form:errors></td>
				</tr>
				<tr>
					<td><form:label path="adres">adres</form:label></td>
					<td><form:input path="adres" /></td>
					<td><form:errors path="adres" cssStyle="color: red;"></form:errors></td>

					<td><input type="submit" value="Submit" /></td>
				</tr>
			</table>
		</form:form>
</div>
	</div>
</body>
</html>