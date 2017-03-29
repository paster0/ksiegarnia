<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>





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

	<form:form method="POST" action="/ksiegarnia/admin/product/addBook"
		modelAttribute="book">
		<table>
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








</body>
</html>