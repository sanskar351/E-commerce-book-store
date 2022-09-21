<%@page import="com.entity.user"%>
<%@page import="com.entity.bookdtl"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.bookDaoImpl"%>
<%@page import="com.dao.userdaoimpl" %>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Index</title>
<style type="text/css">
.back-img {
	font-style: italic;
}

#slider {
	overflow: hidden;
}

#slider figure {
	position: relative;
	width: 500%;
	height: 20vh;
	margin: 0;
	left: 0;
	animation: 20s slider infinite;
}

#slider figure img {
	width: 20%;
	height: 430px;;
	float: left;
}

@keyframes slider{
0% {
	left: 0;
}

20% {
left:0;
}
15% {
left:0;
}
25%
{
left:-100%;
}
45%
{
left:-100%;
}
50%{
left:-200%;
}
70%
{
left:-200%;
}
75%{
left:-300%;
}
95%{
left:-300%
}
}
.crd-ho:hover {
	background-color:#beeefa;
}
</style>

<%@include file="allcontent/allcss.jsp"%>

</head>

<body style="background-color:#FAF9F6;">

	<%@include file="allcontent/navbar.jsp"%>
	
	<div>
		
		<h4 class="text-center" style=" font-family: cursive; margin-top: 25px;">Welcome,
			E-book Management System</h4>
		<hr>
	</div>
	 <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" style="height: 400px;">
    <div class="carousel-item active">
      <img class="d-block w-100" style="height: 400px;" src="allcontent/img/l.jpg" alt="First slide">
    <div class="carousel-caption d-none d-md-block" style="padding-top: 40px;">
    
    <h2 style="font-family: cursive;">Ecommerce isn't the cherry on the cake its the new cake</h2>
    <p style="font-family: cursive;">There is no friend as loyal as book</p>
  </div>
    </div>
    <div class="carousel-item ">
      <img class="d-block w-100" style="height: 400px;" src="allcontent/img/b8.jpeg" alt="Second slide">
    <div class="carousel-caption d-none d-md-block" style="padding-top: 40px;">
    <h3 style="font-family: cursive;  ">Ecommerce isn't the cherry on the cake its the new cake</h3>
    <h4 style="font-family: cursive; color: black; text-shadow: black; text-transform: inherit;">Book is a dream that you can hold in a hand</h4>
  </div>
    </div>
    <div class="carousel-item ">
      <img class="d-block w-100" style="height: 430px;" src="allcontent/img/b9.jpg" alt="Third slide">
    <div class="carousel-caption d-none d-md-block">
    
  </div>
    </div>
      <div class="carousel-item ">
      <img class="d-block w-100" style="height: 430px;" src="allcontent/img/globe.jpg" alt="Third slide">
    <div class="carousel-caption d-none d-md-block">
   
  </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
	<%user u=(user)session.getAttribute("login"); %>
	
	<div class="container ">
<hr>
		<h4 class="text-center" style="font-family: cursive;">Recent
			Books</h4>
		<hr style="color: black;">
		<div class="row">

			<%
				bookDaoImpl b2 = new bookDaoImpl(connection.getcon());
			List<bookdtl> l2 = b2.recent();
			for (bookdtl d2: l2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 16rem; border-color: black;">
					<div class="card-body text-center">
						<img class="card-img-top img-thumbl in"
							src="book/<%=d2.getPhoto()%>" style="width: 200px; height: 200px"
							alt="Card image cap">

						<h5 style="font-family: cursive;"><%=d2.getBookname()%></h5>
						<p style="font-family: cursive;"><%=d2.getAuthor()%></p>
						<p>
							<%
								if (d2.getCategory().equals("Old")) {
							%>
						
						<p style="font-family: cursive;">
							Category:<%=d2.getCategory()%></p>

						<a href="viewbook.jsp?id=<%=d2.getId() %>
						" class="btn btn-success btn-sm ml-1"><i
							class="fa-solid fa-eye"></i> View Details</a> 
							<a href="#" class="btn btn-primary btn-sm ml-1 mt-1"><i
							class="fa-solid fa-indian-rupee-sign"></i><%=d2.getPrice()%></a>
						<%
								}

						else {
						%><p style="font-family: cursive;">
							Category:<%=d2.getCategory()%></p>
							<% if(u==null)
							{%>
								<a href="login.jsp" class="btn btn-danger btn-sm ml-1" style="font-family: cursive;"><i class="fa-solid fa-cart-shopping" ></i> Add Cart</a> 
							<% }
							else
							{%>
								<a href="cart?bid=<%=d2.getId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-1" style="font-family: cursive;"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							<%}
							%>
						
						 <a href="viewbook.jsp?id=<%=d2.getId() %>"
							class="btn btn-success btn-sm ml-1" style="font-family: cursive;"><i
							class="fa-solid fa-eye"></i> View Details</a> 
							<a href="#" class="btn btn-primary btn-sm ml-1 mt-1" style="font-family: cursive;"><i
							class="fa-solid fa-indian-rupee-sign"></i><%=d2.getPrice()%></a>
							
							
						<%
							}
						%>
						</p>


					</div>
				</div>
			</div>
			<%
				}
			%>





		</div>




	</div>
	<div class=text-center>
		<a href="recentbook.jsp" class="btn btn-info  text-dark"
			style="margin-top: 5px; margin-left: 10px; font-family: cursive;"><i class="fa-solid fa-eye"></i> View All</a>
	</div>

	<hr>
	
	<div class="container">

		<h4 class="text-center" style="font-family: cursive;">New Books</h4>
		<hr>

		<div class="row">
			<%
				bookDaoImpl b = new bookDaoImpl(connection.getcon());
			List<bookdtl> l = b.newbook();
			for (bookdtl d : l) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 16rem; border-color: black;">
					<div class="card-body text-center">
						<img class="card-img-top img-thumbl in"
							src="book/<%=d.getPhoto()%>" style="width: 200px; height: 200px"
							alt="Card image cap">

						<h5 style="font-family: cursive;"><%=d.getBookname()%></h5>
						<p style="font-family: cursive;"><%=d.getAuthor()%></p>
						<p style="font-family: cursive;">
							Category:<%=d.getCategory()%></p>
							<% if(u==null)
							{%>
								<a href="login.jsp" class="btn btn-danger btn-sm ml-1" style="font-family: cursive;"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							<% }
							else
							{%>
								<a href="cart?bid=<%=d.getId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-1" style="font-family: cursive;"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							<%}
							%>
						
						
						<a href="viewbook.jsp?id=<%=d.getId() %>"
							class="btn btn-success btn-sm ml-1" style="font-family: cursive;"><i
							class="fa-solid fa-eye"></i> View Details</a> <a href="#"
							class="btn btn-primary btn-sm ml-1 mt-1" style="font-family: cursive;"><i
							class="fa-solid fa-indian-rupee-sign"></i><%=d.getPrice()%></a>
					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>

		<div class=text-center>
			<a href="newbook.jsp" class="btn btn-info  text-dark"
				style="margin-top: 5px; margin-left: 10px;"><i class="fa-solid fa-eye"></i> View All</a>
		</div>
	</div>

	<hr>
	<div class="container">

		<h4 class="text-center" style="font-family: cursive;">Old Books</h4>
		<hr>
		<div class="row">
			<%
				bookDaoImpl b1 = new bookDaoImpl(connection.getcon());
			List<bookdtl> l1 = b1.oldbook();
			for (bookdtl d1 : l1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 16rem; border-color: black;">
					<div class="card-body text-center">
						<img class="card-img-top img-thumbl in"
							src="book/<%=d1.getPhoto()%>" style="width: 200px; height: 200px"
							alt="Card image cap">

						<h5 style="font-family: cursive;"><%=d1.getBookname()%></h5>
						<p style="font-family: cursive;"><%=d1.getAuthor()%></p>
						<p style="font-family: cursive;">
							Category:<%=d1.getCategory()%></p>
						<a href="viewbook.jsp?id=<%=d1.getId()%>" class="btn btn-success btn-sm ml-1" style="font-family: cursive;"><i
							class="fa-solid fa-eye"></i> View Details</a> <a href="#"
							class="btn btn-primary btn-sm ml-1 mt-1" style="font-family: cursive;"><i
							class="fa-solid fa-indian-rupee-sign" ></i><%=d1.getPrice()%></a>
					</div>
				</div>
			</div>
			<%
				}
			%>



		</div>
	</div>
	<div class=text-center>
		<a href="oldbook.jsp" class="btn btn-info  text-dark"
	    style="margin-top: 5px; margin-left: 10px; font-family: cursive;"><i class="fa-solid fa-eye" ></i> View All</a>
	</div>
	<hr>
	<%@include file="allcontent/footer.jsp"%>
</body>
</html>