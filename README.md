# Bookshop
My very first java web application that allows to order books, user login/registration and management of service on admin side. Application uses a MySQL database that stores orders, products, customers informations and relations between them.


The application is WAR type, so it should be run on a server, eg Apache Tomcat. It also need proper database named "ksiegarnia" to work. Example database file is in folder Ksiegarnia\src\main\resources\ksiegarnia.sql

To get into admin panel, you should type in Web Adress, "localhost:8080/ksiegarnia/admin" 
login and password in Spring Security:
name="admin" password="123" 
This admin login and password are only for demonstration purposes.

Used technologies: Spring MVC, Spring Security,  Hibernate, JSP, AngularJS, Bootstrap
