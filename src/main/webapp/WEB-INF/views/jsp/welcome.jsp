<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>





<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">

<title></title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet" />
	
	
</head>
<body>



<div class="container">

<div class = "page-header">Ksiegarnia

<div class="pull-right">

<a href="/ksiegarnia/cart"> Koszyk zakupów
<span class="glyphicon glyphicon-shopping-cart"></span></a>

</div>
</div>
<div>

<div class="pull-right">

<c:choose>
<c:when test="${not empty sessionScope.user}">
  siema ${user.imie} 
<a href="/ksiegarnia/user/logout">Wyloguj sie</a>
</c:when>
<c:otherwise>

<form method="post" action="\ksiegarnia\user\login">
  <div class="form-group">
    <label for="exampleInputEmail1">Email</label>
    <input type="email" class="form-control" id="exampleInputEmail1" name="mail">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Hasło</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="haslo">
  </div>
  <div class="checkbox">
    <label>
      <input type="checkbox"> Zapamietaj mnie
    </label>
  </div>
  <button type="submit" class="btn btn-default"  value="Login">Submit</button>
</form>
	<td colspan="2">Nie masz konta? <a href="/ksiegarnia/user/reg">Zarejestruj
									sie</a></td>
</div>
</c:otherwise>
</c:choose>
</div>
</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</body>
</html>