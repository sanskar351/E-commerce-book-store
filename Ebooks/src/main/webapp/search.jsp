<%@page import="com.entity.user"%>
<%@page import="com.entity.bookdtl"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.connection"%>
<%@page import="com.dao.bookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%user x=(user)session.getAttribute("login");
    if(x==null)
    {
    	response.sendRedirect("login.jsp");
    }
    
    %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Books</title>
<style type="text/css">
.card-body:hover {
	background-color: #ebedf0;
	border-radius: 10px;
}

</style>
<%@include file="allcontent/allcss.jsp"%>
</head>
<body>
<%@include file="allcontent/navbar.jsp"%>
<%user u=(user)session.getAttribute("login"); %>

	<div class="container">
<hr>
		<h3 class="text-center" style="margin-top: 4px; font-family: cursive;">Related
			Books</h3>
		<hr>
		<div class="row">

			<%
			String ch=request.getParameter("ch");
				bookDaoImpl b2 = new bookDaoImpl(connection.getcon());
			List<bookdtl> l2 = b2.getbookbysearch(ch);
			for (bookdtl d2 : l2) {
			%>
			<div class="col-md-3">
				<div class="card" style="width: 16rem; margin-bottom: 15px;border-color: black; ">
					<div class="card-body text-center ">
						<img class="card-img-top img-thumbl in"
							src="book/<%=d2.getPhoto()%>" style="width: 200px; height: 200px"
							alt="Card image cap">

						<h5><%=d2.getBookname()%></h5>
						<p><%=d2.getAuthor()%></p>
						<p>
							<%
								if (d2.getCategory().equals("Old")) {
							%>
						
						<p>
							Category:<%=d2.getCategory()%></p>

						<a href="viewbook.jsp?id=<%=d2.getId() %>" class="btn btn-success btn-sm ml-1"><i
							class="fa-solid fa-eye"></i> View Details</a> <a href="#"
							class="btn btn-primary btn-sm ml-1 mt-1"><i
							class="fa-solid fa-indian-rupee-sign"></i><%=d2.getPrice()%></a>
						<%
							}

						else {
						%><p>
							Category:<%=d2.getCategory()%></p>
					<% if(u!=null)
					{%>
					<a href="cart?bid=<%=d2.getId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-1"><i
							class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							 <a href="viewbook.jsp?id=<%=d2.getId() %>"
							class="btn btn-success btn-sm ml-1"><i
							class="fa-solid fa-eye"></i> View Details</a>
							 <a href="#" class="btn btn-primary btn-sm ml-1 mt-1"><i
							class="fa-solid fa-indian-rupee-sign"></i><%=d2.getPrice()%></a>
						
					<% }
						
						
						%>	
						
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
	<p class="text-center" style="font-family: cursive;">You have reached the end</p>
<%@include file="allcontent/footer.jsp"%>
</body>

</html>