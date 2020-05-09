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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Dodanie ksiazki do bazy</title>
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
	<form:form action="/ksiegarnia/admin/product/addBook/addimg"
		enctype="multipart/form-data" method="POST">
     <p style="margin-bottom: 5px;"> Wybierz okładke książki:</p> 
      <input type="file" name="file" />
		<input style="margin-top: 5px;" type="submit" value="upload" />
	</form:form>
	<FORM style="form-group; margin-top: 5px;">
		<INPUT Type="button" VALUE="Wstecz"
			onClick="history.go(-1);return true;">
	</FORM>
</div>
</body>
</html>