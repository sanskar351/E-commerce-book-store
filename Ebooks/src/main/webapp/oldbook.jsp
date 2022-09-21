<%@page import="com.entity.bookdtl"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.connection"%>
<%@page import="com.dao.bookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%user v=(user)session.getAttribute("login");
    if(v==null)
    {
    	response.sendRedirect("login.jsp");
    }
    
    %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Books</title>
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

<div class="container">
<hr>
		<h3 class="text-center" style="font-family: cursive;">Old Books</h3>
		<hr>
		<div class="row">
			<%
				bookDaoImpl b1 = new bookDaoImpl(connection.getcon());
			List<bookdtl> l1 = b1.alloldbook();
			for (bookdtl d1 : l1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 16rem; margin-bottom: 15px; border-color: black;">
					<div class="card-body text-center">
						<img class="card-img-top img-thumbl in"
							src="book/<%=d1.getPhoto()%>" style="width: 200px; height: 200px"
							alt="Card image cap">

						<h5><%=d1.getBookname()%></h5>
						<p><%=d1.getAuthor()%></p>
						<p>
							Category:<%=d1.getCategory()%></p>
						<a href="viewbook.jsp?id=<%=d1.getId() %>" class="btn btn-success btn-sm ml-1"><i
							class="fa-solid fa-eye"></i> View Details</a> <a href="#"
							class="btn btn-primary btn-sm ml-1 mt-1"><i
							class="fa-solid fa-indian-rupee-sign"></i><%=d1.getPrice()%></a>
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