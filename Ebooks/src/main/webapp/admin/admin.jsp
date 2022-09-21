<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Pannel</title>
<%@include file="allcss.jsp"%>
<style>
.card-body:hover {
	background-color:#beeefa;
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
	
	<div class="img"
		style="background-image: url('back3.jpg'); background-repeat: no-repeat; background-size: cover; ">
		
			
	    <h3 class="text-center" style="font-family: cursive;">Welcome,Admin</h3>
		<hr>
		
		<div class="container ">
		
			<div class="row" style="margin-top: 100px; margin-bottom: 240px;">
				<div class="col-md-3">

					<div class="card" style="width: 250px;">
						<div class="card-body text-center">
							<a href="addbooks.jsp"><i
								class="fas fa-plus-square fa-3x text-primary"></i></a>

							<h2 style="font-family: cursive;">Add Books</h2>

							<p>--------</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card" style="width: 250px;">
						<div class="card-body text-center">
							<a href="allbooks.jsp"><i
								class="fas fa-book-open fa-3x text-danger"></i></a>

							<h2 style="font-family: cursive;">All Books</h2>
							<p>--------</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card" style="width: 250px;">
						<div class="card-body text-center">
							<a href="order.jsp"><i
								class="fas fa-box-open fa-3x text-warning"></i></a>

							<h2 style="font-family: cursive;">Order</h2>
							<p>--------</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card" style="width: 250px;">
						<div class="card-body text-center">
							<a data-toggle="modal" data-target="#exampleModalCenter"><i
								class="fas fa-sign-out fa-3x text-success"></i></a>

							<h2 style="font-family: cursive;">Logout</h2>
							<p>--------</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #abeeff;">
        <h4>Do You Want To Logout </h4>
      </div>
      <div class="modal-body text-center">
       
        
      </div>
      <div class="container text-center " style="margin-bottom: 6px;">
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
        <a href="../logout"  type="button" class="btn btn-warning">Logout</a>
      </div>
    </div>
  </div>
</div>
		<%@include file="footer.jsp"%>
</body>
</html>