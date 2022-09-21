<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<%@include file="allcontent/allcss.jsp"%>
</head>
<body style="background-color: #faf8f7">
	<%@include file="allcontent/navbar.jsp"%>
	<div class="img"
		style="background-image: url('allcontent/img/back3.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center;">
		<div class="container ">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card mt-4">


						<div class="card-body">

							<h4 class="text-center mt-1">
								<i class="fas fa-users"></i> Registration
							</h4>
							<hr>
							<% String s=(String)session.getAttribute("yes");
							if(s!=null)
							{%> <div class="alert alert-primary" role="alert" style=" font-family:cursive; width: 240px; margin-left: 32px;" >
                         <%=s%></div>
							
								 
						<% }
						session.removeAttribute("yes");
						%>
						<% String s1=(String)session.getAttribute("no");
						if(s1!=null)
						{%>
						<div class="alert alert-info" role="alert" style=" width: 210px; margin-left:40px; font-family:cursive" >
                         <%=s1%></div>
						
							
						<% }
						session.removeAttribute("no");
						%>
							<form action="register" method="post">
							<div class="form-group">
									<label for="exampleInputEmail1" style="font-family: cursive;">Enter Full Name</label> <input
										type="text" style="font-family: cursive;" required="required" name="name" class="form-control"
										
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter name">

								</div>
								<div class="form-group">
									<label for="exampleInputEmail1" style="font-family: cursive;">Enter email</label> <input
										type="text" style="font-family: cursive;" required="required" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email" name="email" > <small id="emailHelp"
										class="form-text text-muted" style="font-family: cursive;">We'll never share your
										email with anyone else.</small>

								</div>
								
								<div class="form-group">
									<label for="exampleInputEmail1" style="font-family: cursive;">Enter Contact No</label> <input
										type="number" style="font-family: cursive;" required="required" name="number" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter contact">

								</div>
								<div class="form-group">
									<label for="exampleInputPassword1" style="font-family: cursive;">Password</label> <input
										type="password"   style="font-family: cursive;" required="required" name="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input" name="check"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1" style="font-family: cursive;">Agree Terms & Conditions</label>
								</div>
								<div class="container " style="margin-left: 60px;">
									<button type="submit" class="btn btn-danger" style="font-family: cursive;">Submit</button>
									<button type="reset" class="btn btn-success" style="font-family: cursive;">Reset</button>
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