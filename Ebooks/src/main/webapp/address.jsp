<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<%@include file="allcontent/allcss.jsp"%>
</head>
<body>
<%@include file="allcontent/navbar.jsp"%>
<div class="img"
		style="background-image: url('allcontent/img/set1.webp'); background-repeat: no-repeat; background-size: cover;">
<div class="container">
<div class="row p-2">
<div class="col-md-6 offset-md-3">
<div class="card " style="margin-top: 123px;  border-radius: 10px">
<div class="card-body">
<h4 class="text-center p-2" style="font-family: cursive">Add Address</h4>
<form action="">
<div class="form-row">
    
    <div class="col-md-6">
      <label for="inputAddress" style="font-family: cursive">Address</label>
      <input type="text" class="form-control" style="font-family: cursive" placeholder="">
    </div>
    <div class="col-md-6">
      <label for="inputAddress" style="font-family: cursive">Landmark</label>
      <input type="text" class="form-control" style="font-family: cursive" placeholder="">
    </div>
  </div>
  <div class="form-row">
    
    <div class="col-md-4">
      <label for="inputAddress" style="font-family: cursive">City</label>
      <input type="text" class="form-control" style="font-family: cursive" placeholder="">
    </div>

    <div class="col-md-4">
      <label for="inputAddress" style="font-family: cursive">State</label>
      <input type="text" class="form-control"  style="font-family: cursive" placeholder="">
    </div>
    <div class="col-md-4">
      <label for="inputAddress" style="font-family: cursive">Pincode</label>
      <input type="number" class="form-control" style="font-family: cursive" placeholder="">
    </div>
   
  </div>
  <div class="text-center">
  <button class="btn btn-info"  style="margin-top: 6px; font-family: cursive">Save</button>
  
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