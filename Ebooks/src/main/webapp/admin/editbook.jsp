<%@page import="com.entity.bookdtl"%>
<%@page import="com.dao.bookDaoImpl"%>
<%@page import="com.DB.connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allcss.jsp"%>
<style>
.card-body:hover {
	background-color: #edfafc;
	border-radius: 10px;
}

</style>
</head>
<body>

<%@include file="navbar.jsp"%>
	<div class="img"
		style="background-image: url('back5.jpg'); background-repeat: no-repeat; background-size: cover;">
		
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4" style="border-radius: 10px;">
					<div class="card-body ">
						<h4 class="text-center" style="font-family: cursive;">Edit Book</h4>
						<hr>
						<% String t=(String)session.getAttribute("y");
						if(t!=null)
						{%>
								<div class="alert alert-primary" role="alert" style=" width: 250px; margin-left: 30px;" >
                        <%=t%></div>	
						<%
						session.removeAttribute("y");
						}%>
						<% String y=(String)session.getAttribute("n");
						if(y!=null)
						{%>
								<div class="alert alert-primary" role="alert" style=" width: 225px; margin-left: 40px;" >
                         <%=y%></div>	
						<%
						session.removeAttribute("n");
						}%>
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						bookDaoImpl bl=new bookDaoImpl(connection.getcon());
						bookdtl bt=bl.getbook(id);
					    %>
						<form action="../editbook" method="post" >
						<input type="hidden" name="id" value="<%=bt.getId() %>">
							<div class="form-group">
								<label for="exampleInputEmail1" style="font-family: cursive;">Book Name</label> <input
									type="text" style="font-family: cursive;" required="required" name="bname" value="<%=bt.getBookname() %>"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter book name">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1" style="font-family: cursive;">Author Name </label> <input
									type="text" style="font-family: cursive;" required="required" class="form-control" value="<%=bt.getAuthor() %>"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter author name" name="author">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" style="font-family: cursive;">Price</label> <input
									type="number" style="font-family: cursive;" required="required" name="price" value="<%=bt.getPrice() %>"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Price">

							</div>
							
							<div class="form-group" style="font-family: cursive;">
								<label for="inputState" style="font-family: cursive;">Book Status</label> <select
									id="inputState" style="font-family: cursive;" required="required" name="status"
									class="form-control">
									
<% if("Active".equals(bt.getStatus()))
	{%>
	<option value="Inactive">Active</option>
	<option value="Active">Inactive</option>
	
	<% }
else
{%>
	<option value="Inactive">Inactive</option>
	<option value="Active">Active</option>
<%}
	
	
	%>
	
	
							
									
									
								</select>


							</div>
														<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1" style="font-family: cursive;">Agree Terms & Conditions</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-warning text-center" style="font-family: cursive;">Update 
									Book</button>
							</div>
                        </form>
					</div>
				</div>
			</div>
		</div>


	</div>
	<%@include file="footer.jsp"%>
</body>
</html>