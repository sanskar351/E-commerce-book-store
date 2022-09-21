<%@page import="com.entity.cartt"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.cj.xdevapi.DbDoc"%>
<%@page import="com.dao.cartdaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@include file="allcontent/allcss.jsp"%>
</head>
<body>

<%@include file="allcontent/navbar.jsp"%>

<%String r=(String)session.getAttribute("remove");
if(r!=null)
{%>
	<div class="alert alert-primary" role="alert" style=" width: 240px; margin-left: 640px; margin-top: 5px; font-family:cursive" >
    <%=r%></div>	
<%}
session.removeAttribute("remove");
%>
<%String r1=(String)session.getAttribute("noremove");
if(r1!=null)
{%>
	<div class="alert alert-primary" role="alert" style=" width: 240px; margin-left: 640px; margin-top: 5px; font-family: cursive" >
    <%=r1%></div>	
<%}
session.removeAttribute("noremove");
%>
<%String j=(String)session.getAttribute("op");
if(j!=null)
{%>
	<div class="alert alert-info" role="alert" style=" width: 250px; margin-left: 670px; font-family:cursive" >
                         <%=j%></div>
<% }
session.removeAttribute("op");
%>
<div class="container">
<div class="row p-2">
<div class="col-md-6">
<div class="card bg-white" style="margin-top: 10px;">
<div class="card-body">
<h3 class="text-center text-success" style="font-family: cursive">Your Selected Item's</h3>
<table class="table">
  <thead class="thead-light">
    <tr>
    <th scope="col">Id</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
   <%user m=(user)session.getAttribute("login"); %>
  <%cartdaoimpl cl=new cartdaoimpl(connection.getcon());
  List<cartt> l=cl.getbook(m.getId());

  for(cartt p:l)
  { 
  %>
  
	 <tr>
      <th scope="row"><%=p.getBid() %></th>
      <td ><%=p.getBookname() %></td>
      <td><%=p.getAuthor() %></td>
      <td><%=p.getPrice() %></td>
      <td><a href="remove?bid=<%=p.getBid() %>&&uid=<%=m.getId() %>" class="text-center btn-sm btn-danger">Remove</a></td>
 
    </tr> 
    
     
  <%}
  %>
</tbody>

</table>
<p class="text-center" style="font-family: cursive;">You have reached the end</p>
</div>
</div>
</div>

<div class="col-md-6 ">
<div class="card bg-white"  style="margin-top: 10px;">
<div class="card-body">
<h3 class="text-center text-success " style="font-family: cursive">Your Details For Order</h3>

<form action="order" method="post">
<input type="hidden" name="id" value="<%=m.getId() %>">
  <div class="form-row">
    <div class="col">
      <label for="inputAddress">Name</label>
      <input type="text" class="form-control" name="name"  value="<%=m.getName()%>">
      
    </div>
    <div class="col">
      <label for="inputemail">Email</label>
      <input type="email" class="form-control" name="email" value="<%=m.getEmail()%>">
    </div>
  </div>
  <div class="form-row">
    <div class="col">
      <label for="inputAdd">Phone No</label>
      <input type="number" class="form-control" name="number" value="<%=m.getPhone()%>">
    </div>
    <div class="col">
      <label for="inputAddress">Address</label>
      <input type="text" class="form-control" name="address" placeholder="">
    </div>
  </div>
  <div class="form-row">
    <div class="col">
      <label for="inputAddress">Landmark</label>
      <input type="text" class="form-control" name="landmark" placeholder="">
    </div>
    <div class="col">
      <label for="inputAddress">City</label>
      <input type="text" class="form-control" name="city" placeholder="">
    </div>
  </div>
 <div class="form-row">
    <div class="col">
      <label for="inputAddress">State</label>
      <input type="text" class="form-control" name="state" placeholder="">
    </div>
    <div class="col">
      <label for="inputAddress">Pincode</label>
      <input type="number" class="form-control" name="pincode" placeholder="">
    </div>
  </div>
  <div class="form-row">
  
  <label>Payment Mode</label>
  <select class="form-control" name="payment">
  <option>--Select--</option>
  <option value="Cash On Delivery">Cash On Delivery</option>
  <option value="Online Payment">Online Payment</option>
  </select>
  </div>
 
 <div class="text-center" style="margin-top: 10px ">
 <input type="hidden" name="userId" value="<%=m.getId()%>">
  <button type="submit" class="btn btn-success">Order Now</button>
 

  <a href="index.jsp" class="btn btn-warning">Continue Shopping</a>
   
   </div>
</form>


 
 

</div>
</div>
</div>
</div>
</div>
<%@include file="allcontent/footer.jsp"%>
</body>
</html>