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

	

	<form:form method="POST" action="/ksiegarnia/user/reg"
		modelAttribute="User">
		<table>
			<tr>
				<td><form:label path="email">email</form:label></td>
				<td><form:input path="email" /></td>
				<td><form:errors path="email" cssStyle="color: red;"></form:errors></td>
			</tr>
			<tr>
				<td><form:label  path="haslo">haslo</form:label></td>
				<td><form:password   path="haslo" /></td>
				<td><form:errors path="haslo" cssStyle="color: red;"></form:errors></td>
			</tr>
				<tr>
				<td><form:label  path="retypeHaslo">powtorz haslo</form:label></td>
				<td><form:password   path="retypeHaslo" /></td>
				<td><form:errors path="retypeHaslo" cssStyle="color: red;"></form:errors></td>
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




</body>
</html>