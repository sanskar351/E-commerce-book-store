<%@page import="com.entity.bookdtl"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.connection"%>
<%@page import="com.dao.bookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:All-Books</title>
<%@include file="allcss.jsp"%>
<style>
.card-body:hover {
	background-color: #ebedf0;
	border-radius: 10px;
}

.card {
	border-radius: 10px;
	border-color: black;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<hr>
	<h5 class="text-center" style="font-family: cursive;">Welcome,Admin</h5>
	<hr>
	<%
		String y = (String) session.getAttribute("a");
	if (y != null) {
	%>
	<div class="alert alert-primary" role="alert"
		style="width: 240px; margin-left: 642px;">
		<%=y%></div>
	<%
		session.removeAttribute("a");
	}
	%>
	<%
		String n = (String) session.getAttribute("b");
	if (n != null) {
	%>
	<div class="alert alert-primary" role="alert"
		style="width: 225px; margin-left: 40px;">
		<%=n%></div>
	<%
		session.removeAttribute("b");
	}
	%>
	<table class="table text-center">
		<thead class="thead-dark">
			<tr >
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author's Name</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>

		<tbody>
			<%
				bookDaoImpl bt = new bookDaoImpl(connection.getcon());
			List<bookdtl> list = bt.getbooks();
			for (bookdtl b : list) {
			%>
			<%
				int i = b.getId();
			if (i % 2 == 0) {
			%>
			<tr class="table-success">
				<th><%=b.getId()%></th>
				<th><img src="../book/<%=b.getPhoto()%>"
					style="width: 60px; height: 60px;"></th>
				<th><%=b.getBookname()%></th>
				<th><%=b.getAuthor()%></th>
				<th><%=b.getPrice()%></th>
				<th><%=b.getCategory()%></th>
				<th><%=b.getStatus()%></th>
				<th><a href="editbook.jsp?id=<%=b.getId()%>"
					class="btn btn-warning btn-sm"><i class="fas fa-pen-to-square"></i>
						Edit</a> <a href="../delete?id=<%=b.getId()%>"
					class="btn btn-success btn-sm"><i class="fas fa-trash"></i>
						Delete</a></th>
			</tr>


			<%
				} 
			else {
			%>
			<tr class="table-warning">
				<th><%=b.getId()%></th>
				<th><img src="../book/<%=b.getPhoto()%>"
					style="width: 60px; height: 60px;"></th>
				<th><%=b.getBookname()%></th>
				<th><%=b.getAuthor()%></th>
				<th><%=b.getPrice()%></th>
				<th><%=b.getCategory()%></th>
				<th><%=b.getStatus()%></th>
				<th><a href="editbook.jsp?id=<%=b.getId()%>"
					class="btn btn-warning btn-sm"><i class="fas fa-pen-to-square"></i> Edit</a> 
					<a href="../delete?id=<%=b.getId()%>"
					class="btn btn-success btn-sm"><i class="fas fa-trash"></i>
						Delete</a></th>
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