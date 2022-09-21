package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.connection;
import com.dao.bookDaoImpl;
import com.entity.bookdtl;

/**
 * Servlet implementation class editbook
 */
public class editbook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{ 
			int id=Integer.parseInt(request.getParameter("id"));
		String bookname=request.getParameter("bname");
		String author=request.getParameter("author");
	String price=request.getParameter("price");
		String status=request.getParameter("status");
		String check=request.getParameter("check");
			bookdtl bt=new bookdtl();
			bt.setId(id);
			bt.setBookname(bookname);
			bt.setAuthor(author);
			bt.setPrice(price);
			bt.setStatus(status);
			HttpSession session=request.getSession();
			if(check!=null)
			{
				bookDaoImpl b=new bookDaoImpl(connection.getcon());	
				boolean f=	b.updatebook(bt);	
				
				if(f)
				{
					
					session.setAttribute("y", "Book Updated Successfully");
					response.sendRedirect("admin/allbooks.jsp");
					
					
				System.out.println("updated");	
				}
				else
				{  session.setAttribute("n", "Something Went Wrong");
				response.sendRedirect("admin/admin.jsp");
					System.out.println("no updation");
					}
				
			}
			else
			{session.setAttribute("n", "Something Went Wrong");
			response.sendRedirect("admin/editbook.jsp");
			System.out.println("no updation");
				
			}
		
	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}

}
