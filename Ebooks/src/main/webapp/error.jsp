<%-- 
    Document   : error
    Created on : 13 Feb, 2022, 3:32:26 PM
    Author     : Sanskar Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
         
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
         <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <style>
       .banner_background{
      background-color: 	#ADACAC	;
       clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0 100%, 0 0, 26% 0);
       }
       body
{
    background-image: url("allcontent/img/back3.jpg");
    background-repeat: no-repeat;
    background-size: cover;
}
   </style>
    
    </head>
    <body>
        <div class="container text-center" >
            
            <img src="error-404.png" style=" height: 150px; margin-top: 240px;" >
            <h4 class="text-center">Something Went Wrong !</h4> 
              <h5 class="text-center">Please Try Again</h5> 
              <a href="index.jsp" class="btn btn-danger">Home</a>
            
        </div>
         <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="js/myjs.js" type="text/javascript"></script>  
    </body>
</html>
