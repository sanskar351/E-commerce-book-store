<%@page import="com.entity.user"%>
<div class="a" style="background-color:#303f9f; height: 6px;"></div>
<div class="container-fluid p-3" style="background-color: #faf8f7;">
	<div class="row">
		<div class="col-md-3">
			<h3 style="font-family: cursive;">
				<i class="fa-solid fa-book"></i> Ebooks
			</h3>
		</div>


		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" style="font-family: cursive;" type="search"
					placeholder="Search Here" aria-label="Search">
				<button class="btn btn-success my-2 my-sm-0" style="font-family: cursive;" type="submit">
					<i class="fas fa-magnifying-glass"></i> Search
				</button>
			</form>
		</div>

		<div class="col-md-3">
		<% user a=(user)session.getAttribute("login");
if(a!=null)
{%>
	<a data-toggle="modal" data-target="#exampleModalCente" class="btn btn-warning" style="font-family: cursive;"><i
			class="fas fa-user"></i>Hi,<%=a.getName() %></a> 
			<a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary" style="font-family: cursive;"><i
								class="fas fa-sign-out"></i>Logout</a> 
			
<%}
else
{%>
<a href="../login.jsp"
				class="btn btn-danger"><i class="fas fa-users"></i> Login</a>
<a href="../register.jsp"
				class="btn btn-danger"><i class="fas fa-users"></i> Register</a>	
<%}
%>	
	
		
			
				
		</div>
	</div>
</div>
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #abeeff;">
       
        <h4 style="font-family: cursive; margin-left: 97px;">Do You Want To Logout </h4>
        
      </div>
      <div class="modal-body text-center">
                
      </div>
      <div class="container text-center " style="margin-bottom: 6px;">
        <button type="button" class="btn btn-success" style="font-family: cursive;" data-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-warning" style="font-family: cursive;">Logout</a>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalCente" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #abeeff;" >
        <h4 class="modal-title" id="exampleModalLongTitle" style="font-family: cursive; margin-left: 150px;">Admin Details</h4>
        
      </div>
      <div class="modal-body text-center">
        
         <h6 style="font-family: cursive;">Admin email: admin@gmail.com</h6>
        <h6 style="font-family: cursive;">Admin name: Admin </h6>
       
      </div>
      <div class="container text-center " style="margin-bottom: 6px;">
        <button type="button" class="btn btn-info" style="font-family: cursive;" data-dismiss="modal">Close</button>
       
      </div>
    </div>
  </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="admin.jsp" style="font-family: cursive;"><i
					class="fas fa-home"></i>  Home <span class="sr-only">(current)</span></a>
			</li>
			
	
		
			<li class="nav-item active"><a class="nav-link" href="addbooks.jsp" style="font-family: cursive; align-items:inherit; ;"><i
					class="fas fa-book"></i> Add Book <span class="sr-only">(current)</span></a>
			</li>
			
		
		
			<li class="nav-item active"><a class="nav-link" href="allbooks.jsp" style="font-family: cursive;"><i
					class="fas fa-book-open"></i>  View Books <span class="sr-only">(current)</span></a>
			</li>
			
		
		
			<li class="nav-item active"><a class="nav-link" href="order.jsp" style="font-family: cursive;"><i
					class="fas fa-eye"></i>  View Orders <span class="sr-only">(current)</span></a>
			</li>
			
		</ul>
		<form class="form-inline my-2 my-lg-0">


			<button  class="btn btn-danger my-2 my-lg-0" style="margin-right: 6px; font-family: cursive; "
				type="submit"  >
				<i class="fas fa-gear"></i> Settings
			</button>
			<a href="admincontact.jsp" class="btn btn-info my-2 my-sm-0"  style="font-family: cursive;">
				<i class="fas fa-phone"></i> Contact Us
			</a>
		</form>
	</div>
</nav>