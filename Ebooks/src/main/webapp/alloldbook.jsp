<%@page import="com.entity.bookdtl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DB.connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.bookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Old Book</title>
<%@include file="allcontent/allcss.jsp"%>
</head>
<body>
	<%@include file="allcontent/navbar.jsp"%>
	<div class="img"
		style="background-image: url('set1.webp'); background-repeat: no-repeat; background-size: cover;">
<div class="container">

<h4 class="text-center p-2" style="font-family: cursive; margin-bottom: 30px;">Old Books</h4>
<% String g=(String)session.getAttribute("old");
						if(g!=null)
						{%>
								<div class="alert alert-success" role="alert" style="font-family:cursive; width: 150px; margin-left: 490px;" >
                        <%=g%></div>	
						<%
						session.removeAttribute("old");
						}%>
<table class="table  p-2">
  <thead class="table-dark text-center" style="border-radius: 2px">
    <tr>
      <th style="font-family: cursive; scope="col">Id</th>
       <th style="font-family: cursive; scope="col">Photo</th>
      
      <th style="font-family: cursive; scope="col">Book Name</th>
      <th style="font-family: cursive; scope="col">Author</th>
      <th style="font-family: cursive; scope="col">Price</th>
      <th style="font-family: cursive; scope="col">Action</th>
    </tr>
  </thead>
   <tbody class="text-center" >
  <%user u=(user)session.getAttribute("login"); %>
  <% bookDaoImpl b=new bookDaoImpl(connection.getcon());
  List<bookdtl> l=b.getoldbooks(u.getEmail(), "Old");
  for(bookdtl c:l)
  {%>
	  <tr  >
      <th scope="row"><%=c.getId() %></th>
      <td><img src="book/<%=c.getPhoto()%>"
					style="width: 60px; height: 60px;"></td>
      <td><%=c.getBookname() %></td>
      <td><%=c.getAuthor() %></td>
      <td><%=c.getPrice() %></td>
      <td><a href="removeold?id=<%=c.getId() %>" class="btn btn-sl btn-warning">Remove</a></td>
      
      
    </tr>
  <%}
  
  %>
 
    
 
 
  </tbody>
</table>
</div>
<h6 class="text-center " style="font-family: cursive;">You have reached the end</h6>
<%@include file="allcontent/footer.jsp"%>
</body>
</html>