package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.connection;
import com.dao.cartdaoimpl;

/**
 * Servlet implementation class remove
 */
public class remove extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			int bid=Integer.parseInt(request.getParameter("bid"));
			int uid=Integer.parseInt(request.getParameter("uid"));
			cartdaoimpl c=new cartdaoimpl(connection.getcon());
			boolean f=c.removebook(uid, bid);
			HttpSession session=request.getSession();
			
			if(f)
			{
			session.setAttribute("remove", "Book Removed From Cart");
			response.sendRedirect("cart.jsp");
			}
			else
			{
				session.setAttribute("noremove", "Book Remove From Cart");
				response.sendRedirect("cart.jsp");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
