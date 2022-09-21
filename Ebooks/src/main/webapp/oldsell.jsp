<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Old Book</title>

<%@include file="allcontent/allcss.jsp"%>
</head>
<body>
<%@include file="allcontent/navbar.jsp"%>
<%user s=(user)session.getAttribute("login");
%>
<div class="img"
		style="background-image: url('allcontent/img/set1.webp'); background-repeat: no-repeat; background-size: cover;">
<div class="container">
<div class="row p-2">
<div class="col-md-4 offset-md-4">

<div class="card" style="margin-top: 30px; border-radius: 10px">
<div class="card-body">
<% String q=(String)session.getAttribute("yes");
						if(q!=null)
						{%>
								<div class="alert alert-primary" role="alert" style="font-family:cursive; width: 225px; margin-left: 40px;" >
                        <%=q%></div>	
						<%
						session.removeAttribute("yes");
						}%>
<h5 class="text-center p-1" style="font-family: cursive">Sell Old Book</h5>
<form action="oldbook" method="post" enctype="multipart/form-data">
<input type="hidden" value="<%=s.getEmail() %>" name="name">

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
								<button type="submit" class="btn btn-danger text-center" style="font-family: cursive;">Sell
									Book</button>
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