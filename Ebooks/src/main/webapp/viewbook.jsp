<%@page import="com.entity.bookdtl"%>
<%@page import="com.dao.bookDaoImpl"%>
<%@page import="com.DB.connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<% user h=(user)session.getAttribute("login");
	if(h==null)
	{
		response.sendRedirect("login.jsp");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
			int ids = Integer.parseInt(request.getParameter("id"));
		 
		bookDaoImpl bb = new bookDaoImpl(connection.getcon());
		bookdtl bbb = bb.viewbook(ids);
		%>
<title><%=bbb.getBookname() %></title>
<%@include file="allcontent/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<div class="img"
		style="background-image: url('allcontent/img/back3.jpg'); background-repeat: no-repeat; background-size: cover;">
		<%@include file="allcontent/navbar.jsp"%>
		<% user o=(user)session.getAttribute("login"); %>
		<%
			int id = Integer.parseInt(request.getParameter("id"));
		 
		bookDaoImpl b = new bookDaoImpl(connection.getcon());
		bookdtl b1 = b.viewbook(id);
		%>
		<div class="container p-3">
			<div class="row">

				<div class="col-md-6 text-center p-5 border "
					style="background-color:  #ffffff;  border-radius: 10px;">
					<img src="book/<%=b1.getPhoto()%>"
						style="height: 150px; width: 150px"> <br>
					<hr>
					<h5 class="mt-3">
						Book Name:<span class="text-success"><%=b1.getBookname()%></span>
					</h5>
					<h5>
						Author Name:<span class="text-success"><%=b1.getAuthor()%></span>
					</h5>
					<h5>
						Category:<span class="text-success"><%=b1.getCategory()%></span>
					</h5>
					<h5 style="text-align: left;">Description:-</h5>
					<p>The book aims to get you up to speed fast enough and have
						you writing real programs in no time at all. This book is also for
						programmers who have a vague understanding of the language and
						wish to brush up their knowledge before trying their hands-on
						Python programming.</p>
				</div>
				<div class="col-md-6 text-center p-5 border"
					style="background-color:#ffffff; border-radius: 10px; border-color: black;">
					<h3  style="margin-top: 54px">
						<span><%=b1.getBookname()%></span>
					</h3>
					<h5>Contact To Seller</h5>
				<%String name=request.getParameter("name"); %>	
					<h6>
						<i class="fa-solid fa-envelope"></i>
				<%=b1.getEmail() %></h6>
					<hr>
					<%
						if (b1.getCategory().equals("Old"))

					{
					%>

					<div class="row mt-2">
						<div class="col-md-4 text-center p-2">
							<i class="fa-solid fa-money-bill-1-wave fa-3x text-danger"></i>
							<h6>Cash On Delivery</h6>
						</div>
						<div class="col-md-4 text-center p-2">
							<i class="fa-solid fa-arrow-right-arrow-left  fa-3x text-warning"></i>
							<h6>Return Available</h6>
						</div>
						<div class="col-md-4 text-center p-2">
							<i class="fa-solid fa-truck  fa-3x text-success"></i>
							<h6>Free Delivery</h6>
						</div>
					</div>
					<div class="row text-center">


						<a href="index.jsp" class="btn btn-warning"
							style="margin-left: 120px; margin-top: 10px;">
							<i class="fa-solid fa-cart-plus"></i> Continue Shopping
						</a>
						<button type="submit" class="btn btn-danger"
							style="margin-top: 10px; margin-left: 5px;">
							<i class="fa-solid fa-indian-rupee-sign"></i>
							<%=b1.getPrice()%></button>
					</div>
					
					<%
						}

					else {
					%>
					<div class="row mt-2">
						<div class="col-md-4 text-center p-2">
							<i class="fa-solid fa-money-bill-1-wave fa-3x text-danger"></i>
							<h6>Cash On Delivery</h6>
						</div>
						<div class="col-md-4 text-center p-2">
							<i class="fa-solid fa-arrow-right-arrow-left  fa-3x text-warning"></i>
							<h6>Return Available</h6>
						</div>
						<div class="col-md-4 text-center p-2">
							<i class="fa-solid fa-truck  fa-3x text-success"></i>
							<h6>Free Delivery</h6>
						</div>
					</div>
					
					<div class="row text-center">
						<button type="submit" class="btn btn-warning"
							style="margin-left: 150px; margin-top: 10px;">
							<i class="fa-solid fa-cart-plus"></i> Add Cart
						</button>
						<button type="submit" class="btn btn-danger"
							style="margin-top: 10px; margin-left: 3px;">
							<i class="fa-solid fa-indian-rupee-sign"></i>
							<%=b1.getPrice()%></button>
					</div>
		
					<%
						}
					%>



				</div>

			</div>
		</div>
		<%@include file="allcontent/footer.jsp"%>
</body>
</html>