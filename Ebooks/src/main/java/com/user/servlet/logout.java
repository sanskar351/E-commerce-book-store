package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logout
 */
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try
		{
			HttpSession session =request.getSession();
			session.removeAttribute("login");
			HttpSession session1=request.getSession();
			session.setAttribute("success","Logout Successfully");
			response.sendRedirect("login.jsp");
			
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
		
		
	}

}
