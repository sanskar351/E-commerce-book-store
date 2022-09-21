<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.entity.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Pannel</title>
</head>
<body>
<% user s=(user)session.getAttribute("login");


%>
<h3>Welcome,<%=s.getName() %></h3>
</body>
</html>