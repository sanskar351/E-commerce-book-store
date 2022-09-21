<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allcontent/allcss.jsp"%>
</head>
<body>
<%@include file="allcontent/navbar.jsp"%>

<%user i=(user)session.getAttribute("login"); %>
<div class="img"
		style="background-image: url('allcontent/img/set1.webp'); background-repeat: no-repeat; background-size: cover;">
<div class="container">
<div class="row p-2">
<div class="col-md-4 offset-md-4">
<div class="card " style="margin-top: 25px; border-radius: 10px">
<div class="card-body">
<%String pu=(String)session.getAttribute("pu");
if(pu!=null)
{%>
<div class="alert alert-primary" role="alert" style=" width: 275px; margin-left: 15px; font-family:cursive" >
                         <%=pu%></div>	
<% }
session.removeAttribute("pu");
%>

<h5 class="text-center p-1" style="font-family: cursive">Edit Profile</h5>
<form action="updateuser" method="post">
<input type="hidden" value="<%=i.getId() %>" name="id">
							<div class="form-group">
									<label for="exampleInputEmail1" style="font-family: cursive;">Enter Full Name</label> <input
										type="text" required="required" name="name" class="form-control"
										value="<%=i.getName() %>"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										style="font-family: cursive;" placeholder="Enter name">

								</div>
								<div class="form-group">
									<label for="exampleInputEmail1" style="font-family: cursive;">Enter email</label> <input
										type="text" required="required" class="form-control" value="<%=i.getEmail() %>"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email" name="email" style="font-family: cursive;"> <small id="emailHelp"
										class="form-text text-muted" style="font-family: cursive;" >We'll never share your
										email with anyone else.</small>

								</div>
						
						
								
								<div class="form-group">
									<label for="exampleInputEmail1" style="font-family: cursive;">Enter Contact No</label> <input
										type="number" required="required" name="number" class="form-control" value="<%=i.getPhone() %>"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										style="font-family: cursive;" placeholder="Enter contact">

								</div>
								<div class="form-group">
									<label for="exampleInputPassword1" style="font-family: cursive;">Password</label> <input
										type="password" required="required" name="password" class="form-control" value=""
										id="exampleInputPassword1" style="font-family: cursive;" placeholder="Password">
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input" name="check"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1" style="font-family: cursive;">Agree Terms & Conditions</label>
								</div>
								<div class="container " style="margin-left: 90px;">
									<button type="submit" class="btn btn-danger" style="font-family: cursive;">Update</button>
									
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