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
						<li><a href="#">O nas</a></li>
					</ul>
				</div>
			</nav>

			<div class="pull-right">
				<c:choose>
					<c:when test="${not empty sessionScope.user}">
  siema ${user.imie} 
<a href="/ksiegarnia/user/logout">Wyloguj sie</a>
					</c:when>
					<c:otherwise>

						<form method="post" action="\ksiegarnia\user\login">
							<div class="form-group">
								<label for="exampleInputEmail1">Email</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									name="mail">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Hasło</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="haslo">
							</div>
							<div class="checkbox">
								<label> <input type="checkbox"> Zapamietaj mnie
								</label>
							</div>
							<button type="submit" class="btn btn-default" value="Login">Submit</button>
						</form>
						<td colspan="2">Nie masz konta? <a
							href="/ksiegarnia/user/reg">Zarejestruj sie</a></td>
			</div>
			</c:otherwise>
			</c:choose>
		</div>
		
		<div class="col-md-6 col-md-offset-3">
		<h5> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisi nisl, cursus in lacus id, vestibulum tempus odio. </h3>
		<p>
		Suspendisse potenti. Integer sit amet dapibus leo. Vivamus vitae ex quis magna feugiat suscipit vel eu enim. Quisque eros neque, bibendum sit amet congue ut, feugiat tristique orci. Maecenas nec metus augue. Sed ultrices a dui nec placerat. Donec blandit sapien urna, eu fermentum erat scelerisque et. Duis scelerisque justo vel ultrices dapibus. Nulla hendrerit ultrices pulvinar. Fusce id metus sed turpis posuere condimentum nec sed mauris. Duis imperdiet odio a lobortis tincidunt.

Curabitur pellentesque orci nisl, ut auctor enim fermentum ac. Nunc diam turpis, hendrerit ut odio non, mollis porta dolor. Sed egestas lacinia mauris quis cursus. Aliquam orci dui, mollis in volutpat non, molestie vitae neque. Maecenas ullamcorper volutpat enim, a pellentesque lorem cursus suscipit. Proin scelerisque egestas consequat. Proin sed justo sed ante porta volutpat at vel urna. Sed sapien erat, hendrerit sit amet diam in, convallis tempus nulla. Quisque imperdiet elementum convallis. Proin sit amet ligula libero. Suspendisse quis interdum ex. Vestibulum semper dui non nibh posuere, ac tincidunt eros viverra. Maecenas metus urna, porta sit amet pulvinar ac, vehicula vel eros.

Integer non leo ut dui imperdiet ultrices in et massa. Cras venenatis facilisis ligula. Proin at cursus felis. Vestibulum porttitor ligula a arcu sodales maximus. Aliquam erat volutpat. Donec interdum erat ex, eu efficitur mi convallis at. Donec interdum maximus justo vitae fermentum. Fusce sit amet risus pharetra arcu auctor rutrum sit amet ultricies turpis. In molestie lectus at ipsum porta, quis semper metus euismod. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin id commodo neque. Proin id dui et eros dapibus viverra. Nulla urna ante, tincidunt ac maximus feugiat, rutrum sit amet mauris. Pellentesque pretium lobortis convallis. Maecenas sit amet est at urna sagittis dignissim.
		
		</p>
		
		</div>
		
		
		
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</body>
</html>