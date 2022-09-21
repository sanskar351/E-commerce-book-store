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
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" style="font-family: cursive;" type="search"
					placeholder="Search Here" name="ch" aria-label="Search">
				<button class="btn btn-warning my-2 my-sm-0" style="font-family: cursive;" type="submit">
					<i class="fas fa-magnifying-glass"></i> Search</button>
			</form>
		</div>
		<%user user1=(user)session.getAttribute("login"); 
		
		if(user1!=null)
			{%>
			
		<div class="col-md-3">
		<a href="cart.jsp" style="padding-right: 5px; padding-top: 5px;" ><i class="fa-solid fa-cart-plus fa-2x "></i></a> 
		
			<a data-toggle="modal" data-target="#exampleModal" class="btn btn-danger" style="font-family: cursive; color: white;"><i
				class="fas fa-user"></i> 
				 Hi,<%=user1.getName() %></a> 
				<a  data-toggle="modal" data-target="#exampleModalCenter"  
				class="btn btn-warning" style="font-family: cursive;" ><i class="fas fa-sign-out"></i> Logout</a>
				<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content text-center">
      <div class="modal-header text-center" style="background-color: #abeeff;">
       <h4 class="text-center" style="font-family: cursive; margin-left: 97px;" >Do You Want To Logout </h4>
    </div>
      <div class="modal-body text-center">
       
      </div>
      <div class="container text-center " style="margin-bottom: 6px;">
        <button type="button" class="btn btn-success" style="font-family: cursive;" data-dismiss="modal">Close</button>
        <a href="logout" type="button" class="btn btn-warning" style="font-family: cursive;">Logout</a>
      </div>
    </div>
  </div>
</div>
				
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog" role="document">
    <div class="modal-content" style=" width: 330px; margin-left: 532px; ">
      <div class="modal-header" style="border-radius:px; background-color: #abeeff;">
        <h4 class="modal-title text-center" style="font-family: cursive; margin-left: 75px;" id="exampleModalLongTitle">User Details</h4>
        
        
      </div>
      <div class="modal-body" style="border-radius: 20px;" >
      <table class="table" style="font-family: cursive;">
                                 <tbody style="font-family: cursive;">
                       <tr>
                          <th style="font-family: cursive;">User Id:</th>
                          <td style="font-family: cursive;"><%=user1.getId()%>
                          </td>
                          
                      </tr>
                      <tr >
                          <th style="font-family: cursive;">Name:</th>
                          <td style="font-family: cursive;"><%=user1.getName()%>
                          </td>
                          
                      </tr>
                      <tr>
                          <th style="font-family: cursive;">Email:</th>
                          <td style="font-family: cursive;"><%=user1.getEmail()%>
                          </td>
                          
                      </tr>
                        <tr>
                          <th style="font-family: cursive;">Contact:</th>
                          <td style="font-family: cursive;"><%=user1.getPhone()%>
                          </td>
                          
                      </tr>
                     </tbody>
              </table>
    
            
        
        
      </div>
      <div class="container text-center " style="margin-bottom: 6px;">
        <button type="button" class="btn btn-info" style="font-family: cursive;" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
		
			<%
			
			
			} 
		else
		{%>
		<div class="col-md-3">
			<a href="login.jsp" class="btn btn-success" style="font-family: cursive;"><i
				class="fas fa-user"></i> 
				Login</a> <a href="register.jsp"
				class="btn btn-danger" style="font-family: cursive;"><i class="fas fa-users"></i> Register</a>
		</div>		
		<% }
			%>
			<!-- Button trigger modal -->


		
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom" style="font-family: cursive;">
	<a class="navbar-brand" style="font-family: cursive;" href="index.jsp">E Books</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		
		
		
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" style="font-family: cursive;" href="index.jsp"><i
					class="fas fa-home"></i> Home<span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item active"><a class="nav-link" style="font-family: cursive;" href="recentbook.jsp"><i
					class="fas fa-book"></i> Recent Books</a></li>
			<li class="nav-item active"><a class="nav-link disabled" style="font-family: cursive;"
				href="newbook.jsp"><i class="fas fa-book-open"></i> New Books</a></li>
			<li class="nav-item active"><a class="nav-link disabled" style="font-family: cursive;"
				href="oldbook.jsp"><i class="fas fa-book-bookmark"></i> Old Books</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">


			<a href="setting.jsp" class="btn btn-light" style="margin-right: 6px; font-family: cursive; "
				>
				<i class="fas fa-gear"></i> Settings
			</a>
			<a href="contact.jsp" class="btn btn-light" style="font-family: cursive;">
				<i class="fas fa-phone"></i> Contact Us
			</a>
		</form>
	</div>
</nav>