package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.connection;
import com.dao.bookDaoImpl;
import com.entity.bookdtl;

/**
 * Servlet implementation class bookadd
 */
@MultipartConfig
public class bookadd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
	    
		String bookname=request.getParameter("bname");
		String author=request.getParameter("author");
		String price=request.getParameter("price");
		String cat=request.getParameter("cat");
		String status=request.getParameter("status");
		String check=request.getParameter("check");
		Part part=request.getPart("img");
		String filename=part.getSubmittedFileName();
		HttpSession session=request.getSession();
		
		bookdtl bt=new bookdtl(bookname,author,price,cat,status,filename,"admin@gmail.com");
		System.out.println(bt);
		
		
	   
		bookDaoImpl b=new bookDaoImpl(connection.getcon());
		boolean bol=b.addbooks(bt);
		
		if(check!=null)
		{
			if(bol)
			{    String path=getServletContext().getRealPath("")+"book";
		    System.out.println(path);
		    File f=new File(path);
		    part.write(path + File.separator + filename);
				session.setAttribute("yes", "Book Added Successfully");
				response.sendRedirect("admin/addbooks.jsp");
				System.out.println("added");
			
			}
			else
			{  session.setAttribute("no",   "Something Went Wrong !");
			response.sendRedirect("admin/addbooks.jsp");
				
			}
		}
		else
		{
			 session.setAttribute("no", "Something went wrong");
				response.sendRedirect("admin/addbooks.jsp");
		}
		
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
