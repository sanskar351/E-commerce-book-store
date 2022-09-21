package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.connection;
import com.dao.bookDaoImpl;

/**
 * Servlet implementation class removeold
 */
public class removeold extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			int id=Integer.parseInt(request.getParameter("id"));
			bookDaoImpl b=new bookDaoImpl(connection.getcon()); 
			boolean f=b.removeold(id);
			HttpSession session=request.getSession();
			if(f)
			{ 
				response.sendRedirect("alloldbook.jsp");
				session.setAttribute("old", "Book Removed");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
