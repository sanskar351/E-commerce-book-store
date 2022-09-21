<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allcontent/allcss.jsp"%>
</head>
<body>
<%@include file="allcontent/navbar.jsp"%>
<%String s=(String)session.getAttribute("op");
if(s!=null)
{%>
	<div class="alert alert-info mt-2" role="alert" style=" width: 250px; margin-left: 670px; font-family:cursive" >
                         <%=s%></div>
<% }
session.removeAttribute("op");
%>
<div class="container text-center " style="margin-top: 140px;">
<i class="fas fa-check-circle fa-5x text-warning"></i>
<h1 style="font-family: cursive;">Thank You</h1>
<h2 style="font-family: cursive;">Your Order Placed Successfully</h2>
<h5 style="font-family: cursive;">With in 7 days your product will be delivered at your door step</h5>
<a href="index.jsp" class="btn btn-primary mt-3" style="font-family: cursive;">Home</a>
<a href="order.jsp" class="btn btn-danger mt-3" style="font-family: cursive;">Track Your Order</a>

</div>
<%@include file="allcontent/footer.jsp"%>
</body>
</html>