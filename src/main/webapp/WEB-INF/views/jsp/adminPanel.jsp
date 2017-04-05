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
<link href="<c:url value="/resources/css/welcome.css" />"
	rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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
				<li><a href=/ksiegarnia/admin/product>zarządzanie książkami</a></li>
				<li><a href=/ksiegarnia>zarządzanie zamowieniami</a></li>
				<li><a href=/ksiegarnia/product>zarzadznie uzytkownikami</a></li>
				
			</ol>
		</div>
</div>
<ol>


</ol>

	
	


</body>
</html>