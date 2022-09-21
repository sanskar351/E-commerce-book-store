<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% user q=(user)session.getAttribute("login");
if(q==null)
{
		response.sendRedirect("login.jsp");
}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings</title>
<%@include file="allcontent/allcss.jsp"%>
<style type="text/css">
.ho:hover
{
background-color: #abeeff;
border-color: black;
border-radius: 10px;
}

</style>
</head>
<body style="background-color: #beeefa">
<%@include file="allcontent/navbar.jsp"%>
<div class="container" style="margin-top: 90px">

<div class="row p-2">
<div class="col-md-4">
<div class="card ho" style="border-radius: 10px">
<div class="card-body text-center ho " >
<a href="oldsell.jsp"><i class="fa-solid fa-book-open text-info fa-3x "></i></a>
<h4 style="font-family: cursive;">Sell Old Book</h4>
<p class="text-center" style="font-family: cursive;">Fill detail's correctly</p>
</div>

</div>
</div>

<div class="col-md-4">
<div class="card ho" style="border-radius: 10px">
<div class="card-body text-center ho">
<a href="editprofile.jsp"><i class="fas fa-pen-to-square fa-3x text-primary"></i></a>
<h4 style="font-family: cursive;">Edit Profile</h4>
<p class="text-center" style="font-family: cursive;">Fill detail's correctly</p>

</div>

</div>
</div>
<div class="col-md-4">
<div class="card ho" style="border-radius: 10px">
<div class="card-body text-center ho " >
<a href="alloldbook.jsp"><i class="fa-solid fa-book-open text-warning fa-3x "></i></a>
<h4 style="font-family: cursive;">All Old Book</h4>
<p class="text-center" style="font-family: cursive;">Check Old Stuff</p>
</div>

</div>
</div>
</div>
</div>
<div class="container">


<div class="row">
<div class="col-md-6">
<div class="card ho" style="border-radius: 10px">
<div class="card-body text-center ho">
<a href="order.jsp">			<i class="fas fa-box-open fa-3x text-danger"></i></a>
<h4 style="font-family: cursive;">My Order</h4>
<p class="text-center" style="font-family: cursive;">Track your order</p>
</div>

</div>
</div>
<div class="col-md-6">
<div class="card ho" style="border-radius: 10px">
<div class="card-body text-center ho"> 
<a href="helpcenter.jsp"><i class="fa-solid fa-user-large fa-3x text-success"></i></a>
<h4 style="font-family: cursive;">Help Center</h4>
<p class="text-center" style="font-family: cursive;">24*7 service</p>
</div>
</div>
</div>
</div>
</div>


<%@include file="allcontent/footer.jsp"%>

</body>
</html>