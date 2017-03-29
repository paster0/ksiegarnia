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
	<div class="row">
		<c:forEach items="${lista}" var="list">
			<div class="product">
				<h3>${list.nazwiskoautora}</h3>
				<p>${list.tytul}</p>
				<img style ="width: 120px; height: 150px; " src='<c:url value="resources/img/${list.idksiazki}.jpg"></c:url>'/>		
				<p>${list.cena}PLN</p>
				<p>ilosc: ${list.ilosc}</p>
				<form action="/ksiegarnia/admin/drop" method="post">
					<input type="hidden" name="id" value="${list.idksiazki}" />  <input type="submit" value="usun"></input>
				</form>
			</div>
		</c:forEach>
	</div>
	
	


</body>
</html>