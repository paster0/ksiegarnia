<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>

<html ng-app="app">
<head>
<meta charset="utf-8" />
<title>Angular</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script src="<c:url value="/resources/js/app.js" />"></script>
<script src="<c:url value="/resources/js/controllers.js" />"></script>
<link href="<c:url value="/resources/css/welcome.css" />"
	rel="stylesheet" />

</head>
<body>
	<div id="top">
		Bardzo fajna ksiegarnia <img
			src="<c:url value="/resources/img/books.png" />" width="400px"
			height="200px" style="float: left;">

	</div>
	<a href="/ksiegarnia/cart"><div">koszyk zakupów</div></a>
	<div style="clear: both;"></div>
	</a>
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

	<div id = "cont" ng-controller="PController as vm" ng-init="init('${cartId}')">
		<h1>Koszyk zakupów</h1>

		<table class="table table-hover">
			<tr>
				<th>Produkt</th>
				<th>Cena za sztukę</th>
				<th>Liczba sztuk</th>
				<th>Cena</th>
				<th>Akcja</th>
			</tr>
			<tr ng-repeat="item in cart.cartItems">
				<td>{{item.book.tytul}}</td>
				<td>{{item.book.cena}}</td>
				<td>{{item.quantity}}</td>
				<td>{{item.totalPrice}}</td>
				<td></td>
				<td><a href="#" ng-click="usun(item.book.idksiazki, '${cartId}')">usun</a></td>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th>Łączna cena</th>
				<th>{{cart.grandTotal}}</th>
				<th></th>
			</tr>
		</table>





		<button ng-click="ref('${cartId}')">Tutaj nie klikaj</button>
		<form action="/ksiegarnia/order" method="get">
			<input type="submit" value="Zamawiam" />
		</form>




	</div>

<c:choose>
<c:when test="${not empty sessionScope.user}">
siema ${user.imie} </br>
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

	<!--  
 <h1>Book Store</h1>
            <input type="text" placeholder="Title" ng-model="ctrl.Book.title"><br/>
            <input type="text" placeholder="Author" ng-model="ctrl.Book.author"><br/>
            <input type="text" placeholder="ISBN" ng-model="ctrl.Book.isbn"><br/>
            <button ng-click="ctrl.addBook(ctrl.Book)">Add Book</button>
            
           <ul>
                <li ng-repeat="b in ctrl.Books">{{b.title}} - {{b.author}} ({{b.isbn}})</li>
            </ul>
  
            
            {{2+2}}
            {{ctrl.v}}
        </div>


   <div ng-controller="RepeatController as ctrl">
            <h1 ng-style="ctrl.h1style">All names:</h1>
            <button ng-click="ctrl.changeH1Style()">Change H1 style</button>
            <ul>
                <li ng-repeat="p in ctrl.people">{{p.firstName}} : {{p.lastName}}</li>
            </ul>
        </div>        
        <div ng-controller="RepeatController as ctrl">
            <h1>All names:</h1>
            <ul>
                <li ng-repeat="p in ctrl.people"
                    ng-class-even="'parzyste'"
                    ng-class-odd="'nieparzyste'">{{p.firstName}} : {{p.lastName}}</li>
            </ul>
            <table border="1">
                <thead >
                    <tr>
                        <th>First name</th>
                        <th>Last Name</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="p in ctrl.people"
                        ng-class-even="ctrl.even"
                        ng-class-odd="ctrl.odd">
                        <td>{{p.firstName}}</td>
                        <td>{{p.lastName}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        
    <div ng-controller="ChangeController as change">
            <input type="checkbox" ng-model="change.checkbox" ng-change="change.changeState()">
            <h1>{{change.header}}</h1>
        </div>-->
</body>
</html>