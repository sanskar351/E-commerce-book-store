<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="allcontent/allcss.jsp"%>
<style type="text/css">
</style>
</head>
<body style="background-color: #faf8f7">
	<%@include file="allcontent/navbar.jsp"%>
	<div class="img"
		style="background-image: url('allcontent/img/back3.jpg'); background-repeat: no-repeat; background-size: cover;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card mt-4">


						<div class="card-body">

							<h4 class="text-center mt-1" style="font-family: cursive;">
								<i class="fas fa-user"></i> Login
							</h4>
							<hr>
						
							<%String s1=(String)session.getAttribute("no login");
							if(s1!=null)
							{%>
							<div class="alert alert-info" role="alert" style=" width: 190px; margin-left: 60px; font-family:cursive" >
                         <%=s1%></div>	
							<% 
							
							}
							session.removeAttribute("no login");
							%>
							<%String s3=(String)session.getAttribute("nlogin");
							if(s3!=null)
							{%>
							<div class="alert alert-info" role="alert" style=" width: 230px; margin-left: 40px; font-family:cursive" >
                         <%=s3%></div>	
							<% 
							
							}
							session.removeAttribute("nlogin");
							%>
							
							<%String s2=(String)session.getAttribute("success");
							if(s2!=null)
							{%>
							<div class="alert alert-primary" role="alert" style=" width: 196px; margin-left: 55px; font-family:cursive " >
                         <%=s2%></div>	
							<% 
							
							}
							session.removeAttribute("success");
							%>
							
							<form action="login" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1" style="font-family: cursive;">Email address</label> <input
										type="email" style="font-family: cursive;" required="required" name="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email"> <small id="emailHelp"
										class="form-text text-muted" style="font-family: cursive;">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1" style="font-family: cursive;">Password</label> <input
										type="password" required="required"  style="font-family: cursive;" name="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>

								<div class="form-check">
									<input type="checkbox" class="form-check-input" name="check"
										id="exampleCheck1" style="font-family: cursive;"> <label class="form-check-label"
										for="exampleCheck1" style="font-family: cursive;">Agree Terms & Conditions</label>
								</div>
								<div class="container " style="margin-left: 60px;">
									<button type="submit" class="btn btn-danger" style="font-family: cursive;">Submit</button>
									<button type="reset" class="btn btn-success" style="font-family: cursive;">Reset</button>
								</div>


								<a href="register.jsp" class="text-center"
									style="margin-left: 90px; margin-top: 5px; font-family: cursive;">Create Account</a>
								<p class="text-center" style="font-family: cursive;">New User</p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>


<%@include file="allcontent/footer.jsp"%>
</body>
</html>