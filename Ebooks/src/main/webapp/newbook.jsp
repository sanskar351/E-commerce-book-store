<%@page import="com.entity.user"%>
<%@page import="com.DB.connection"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.bookdtl"%>
<%@page import="com.dao.bookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%user w=(user)session.getAttribute("login");
    if(w==null)
    {
    	response.sendRedirect("login.jsp");
    }
    
    %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Books</title>
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
		<h3 class="text-center" style="font-family: cursive;">New Books</h3>
		<hr>
<%String s=(String)session.getAttribute("addcart");
if(s!=null)
{%>
	<div class="alert alert-primary" role="alert" style=" width: 195px; margin-left: 460px; font-family:cursive;" >
    <%=s%></div>	
<% 
session.removeAttribute("addcart");
}

%>

		<div class="row">
			<%
				bookDaoImpl b = new bookDaoImpl(connection.getcon());
			List<bookdtl> l = b.allnewbook();
			for (bookdtl d : l) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 16rem; margin-bottom: 15px; border-color: black;">
					<div class="card-body text-center">
						<img class="card-img-top img-thumbl in"
							src="book/<%=d.getPhoto()%>" style="width: 200px; height: 200px"
							alt="Card image cap">

						<h5><%=d.getBookname()%></h5>
						<p><%=d.getAuthor()%></p>
						<p>
							Category:<%=d.getCategory()%></p>
						
						<% if(u==null)
							{%>
								<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							<% }
							else
							{%>
								<a href="cart?bid=<%=d.getId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							<%}
							%>
						 
							<a href="viewbook.jsp?id=<%=d.getId() %>"
							class="btn btn-success btn-sm ml-1"><i
							class="fa-solid fa-eye"></i> View Details</a> <a href="#"
							class="btn btn-primary btn-sm ml-1 mt-1"><i
							class="fa-solid fa-indian-rupee-sign"></i><%=d.getPrice()%></a>
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