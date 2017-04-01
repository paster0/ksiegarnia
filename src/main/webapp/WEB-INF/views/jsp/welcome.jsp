<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>





<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<link href="<c:url value="/resources/css/welcome.css" />"
	rel="stylesheet" />
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
		<div id="cont">tu jest content</div>


<c:choose>
<c:when test="${not empty sessionScope.user}">
  siema ${user.imie} 
<a href="/ksiegarnia/user/logout">Wyloguj sie</a>
</c:when>
<c:otherwise>
		<div id="logging">
			<form method="post" action="\ksiegarnia\user\login">
				<table>
					<thead>
						<tr>
							<th colspan="2">Zaloguj sie</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Email</td>
							<td><input type="text" name="mail" value="" /></td>
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
							<td colspan="2">Nie masz konta? <a href="/ksiegarnia/user/reg">Zarejestruj
									sie</a></td>
						</tr>
					</tbody>
				</table>
			</form>	
</div>

</c:otherwise>
</c:choose>
	</div>


</body>
</html>