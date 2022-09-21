<%@page import="com.entity.bookorder"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.connection"%>
<%@page import="com.dao.orderdaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Order</title>
<%@include file="allcontent/allcss.jsp"%>
</head>
<body>
<%@include file="allcontent/navbar.jsp"%>
<div class="img"
		style="background-image: url('allcontent/img/set1.webp'); background-repeat: no-repeat; background-size: cover;">
<div class="container">
<h4 class="text-center p-2" style="font-family: cursive; margin-bottom: 30px;">Your Order</h4>

<table class="table  p-2">
  <thead class="table-dark text-center" style="border-radius: 2px">
    <tr>
      <th style="font-family: cursive; scope="col">Id</th>
      <th style="font-family: cursive; scope="col">Order Id</th>
      <th style="font-family: cursive; scope="col">Name</th>
      <th style="font-family: cursive; scope="col">Book Name</th>
      <th style="font-family: cursive; scope="col">Author</th>
      <th style="font-family: cursive; scope="col">Price</th>
      <th style="font-family: cursive; scope="col">Payment Type</th>
    </tr>
  </thead>
  <%user u=(user)session.getAttribute("login"); %>
  
  <tbody class="text-center" >
  <%  orderdaoimpl p =new orderdaoimpl(connection.getcon());
  List<bookorder> l=p.getbooks(u.getEmail());
  for(bookorder b:l)
  {%>
	 
    <tr  >
      <th scope="row"><%=b.getId()%></th>
      <th><%=b.getOrderid() %></th>
       <th><%=u.getName() %></th>
       <th><%=b.getBookname() %></th>
       <th><%=b.getAuthor() %></th>
       <th><%=b.getPrice() %></th>
       <th><%=b.getPayment() %></th>
    </tr> 
  <%} %>
  

 
  </tbody>
</table>
</div>
<h6 class="text-center " style="font-family: cursive;">You have reached the end</h6>

<%@include file="allcontent/footer.jsp"%>
</body>
</html>