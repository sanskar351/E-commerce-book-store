package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.connection;
import com.dao.userdaoimpl;
import com.entity.user;

/**
 * Servlet implementation class register
 */
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try
		 {
			 String email=request.getParameter("email");
			 String name=request.getParameter("name");
			 String number=request.getParameter("number");
			 String password=request.getParameter("password");
			 String check=request.getParameter("check");
			 //System.out.println("name"+name+"email"+email+"password"+password+"number"+number+"check"+check);
			 user u=new user();
			 u.setEmail(email);
			 u.setName(name);
			 u.setPhone(number);
			 u.setPassword(password);
			 
			 HttpSession session=request.getSession();
			 
			 
			 if(check!=null)
			 {
			 userdaoimpl udi=new userdaoimpl(connection.getcon());
			 
			 boolean f1=udi.checkuser(email);
			 if(f1)
			 { 
				 boolean f=udi.usereguster(u);
				 if(f)
				 {  response.sendRedirect("register.jsp");
				 session.setAttribute("yes", "Registered Successfully");
					 System.out.println("user registered succesfully");
				 }
				 else
				 { session.setAttribute("no", "Not Registered");

				 response.sendRedirect("error.jsp");
					 System.out.println("not registered");
				 } 
			 }
			 else
			 {session.setAttribute("no", "User Already Exist's");

			 response.sendRedirect("register.jsp");
				 
			 }
			 
			 }
			 else
			 { session.setAttribute("no", "Not Registered");

				 response.sendRedirect("error.jsp");
				
			 }
			 
		 }
		catch(Exception e)
		 {
			e.printStackTrace();
		 }
		
		
		
	}

}
