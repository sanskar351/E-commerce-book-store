<%@page import="com.entity.bookorder"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.orderdaoimpl"%>
<%@page import="com.DB.connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All-Orders</title>
<%@include file="allcss.jsp"%>
<style>
.card-body:hover {
	background-color: #e1ecea;
	border-radius: 10px;
}

.card {
	border-radius: 10px;
	border-color: black;
}
</style>
</head>
<body>


<% user u1=(user)session.getAttribute("login");
	if(u1==null)
	{
    response.sendRedirect("../login.jsp");
 	}
%>
<%@include file="navbar.jsp"%>
<hr>
<h5 class="text-center" style="font-family: cursive;">Welcome,Admin</h5>		
	<hr>
	
<table class="table text-center">
  <thead class="thead-dark">
    <tr>
    <th scope="col">Id</th>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Contact No</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment</th>
      
    </tr>
  </thead>
  <tbody >
<% orderdaoimpl od=new orderdaoimpl(connection.getcon());
List<bookorder> b=od.getbook();
for(bookorder d:b)
{%>
<%
int i=d.getId();
if(i%2==0)
{%>
	<tr class="table-warning" >
	<th><%=d.getId() %></th>
      <th scope="row"><%=d.getOrderid() %></th>
        <th><%=d.getName() %></th>
      <th><%=d.getEmail() %></th>
     
      <th><%=d.getFulladdress() %></th>
       <th><%=d.getPhone() %></th>
      <th><%=d.getBookname() %></th>
      <th><%=d.getAuthor() %></th>
       <th><%=d.getPrice() %></th>
      <th><%=d.getPayment() %></th>
      </tr>
   <% 
 
   }

else
{
%>
<tr class="table-success" >
	<th><%=d.getId() %></th>
      <th scope="row"><%=d.getOrderid() %></th>
        <th><%=d.getName() %></th>
      <th><%=d.getEmail() %></th>
     
      <th><%=d.getFulladdress() %></th>
       <th><%=d.getPhone() %></th>
      <th><%=d.getBookname() %></th>
      <th><%=d.getAuthor() %></th>
       <th><%=d.getPrice() %></th>
      <th><%=d.getPayment() %></th>
      
     
    </tr>
    <% 
    }
   %> 
   <%
}
   %> 


	






   
  </tbody>
</table>
<p class="text-center" style="font-family: cursive;">You have reached the end</p>
<%@include file="footer.jsp"%>
</body>
</html>