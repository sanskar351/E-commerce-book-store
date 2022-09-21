<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Add-Books</title>
<%@include file="allcss.jsp"%>
<style>
.card-body:hover {
	background-color: #edfafc;
	border-radius: 10px;
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
	
	<div class="img"
		style="background-image: url('back5.jpg'); background-repeat: no-repeat; background-size: cover;">
		
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4" style="border-radius: 10px;">
					<div class="card-body ">
						<h4 class="text-center " style="font-family: cursive;" >Add Books</h4>
						<hr>
						<% String q=(String)session.getAttribute("yes");
						if(q!=null)
						{%>
								<div class="alert alert-primary" role="alert" style=" width: 230px; margin-left: 40px;" >
                        <%=q%></div>	
						<%
						session.removeAttribute("yes");
						}%>
						<% String w=(String)session.getAttribute("no");
						if(w!=null)
						{%>
								<div class="alert alert-primary" role="alert" style=" width: 225px; margin-left: 40px;" >
                         <%=w%></div>	
						<%
						session.removeAttribute("no");
						}%>
						
						<form action="../bookadd" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1" style="font-family: cursive;">Book Name</label> <input
									type="text" required="required" name="bname"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" style="font-family: cursive;" placeholder="Enter book name">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1" style="font-family: cursive;">Author Name </label> <input
									type="text" required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									 style="font-family: cursive;" placeholder="Enter author name" name="author">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" style="font-family: cursive;">Price</label> <input
									type="number" required="required" name="price"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" style="font-family: cursive;" placeholder="Enter Price">

							</div>
							<div class="form-group">
								<label for="inputState" style="font-family: cursive;">Categories</label> <select
									id="inputState" required="required" name="cat"
									class="form-control" style="font-family: cursive;">

									<option selected style="font-family: cursive;">---select---</option>
									<option value="New" style="font-family: cursive;">New Book</option>
									
								</select>


							</div>
							<div class="form-group">
								<label for="inputState" style="font-family: cursive;">Book Status</label> <select
									id="inputState" required="required" name="status"
									class="form-control" style="font-family: cursive;">

									<option selected style="font-family: cursive;">---select---</option>
									<option value="Active" style="font-family: cursive;">Active</option>
									<option value="Inactive" style="font-family: cursive;">Inactive</option>
								</select>


							</div>
							<div class="form-group">
								<label for="exampleFormControlField" style="font-family: cursive;">Upload Photo</label> <input
									name="img" type="file" class="form-control-file"
									id="exampleFormControlField">



							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1" style="font-family: cursive;">Agree Terms & Conditions</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-danger text-center" style="font-family: cursive;">Add
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