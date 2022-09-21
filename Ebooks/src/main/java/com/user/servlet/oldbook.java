package com.user.servlet;

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
@MultipartConfig
/**
 * Servlet implementation class oldbook
 */
public class oldbook extends HttpServlet {
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
		String cat="Old";
		String status="Active";
		String check=request.getParameter("check");
		
		String name=request.getParameter("name");
		
		Part part=request.getPart("img");
		String filename=part.getSubmittedFileName();
		HttpSession session=request.getSession();
		
		bookdtl bt=new bookdtl(bookname,author,price,cat,status,filename,name);
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
				session.setAttribute("yes", "Book Sold Successfully");
				response.sendRedirect("oldsell.jsp");
				System.out.println("added");
			
			}
			else
			{  session.setAttribute("no",   "Something Went Wrong !");
			response.sendRedirect("oldsell.jsp");
				
			}
		}
		else
		{
			 session.setAttribute("no", "Something went wrong");
				response.sendRedirect("oldsell.jsp");
		}
		
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	}


