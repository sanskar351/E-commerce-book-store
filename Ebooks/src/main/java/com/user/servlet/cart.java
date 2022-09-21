package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.connection;
import com.dao.bookDaoImpl;
import com.dao.cartdaoimpl;
import com.entity.bookdtl;
import com.entity.cartt;
import com.mysql.cj.xdevapi.DbDoc;

/**
 * Servlet implementation class cart
 */
public class cart extends HttpServlet {
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
		bookDaoImpl c=new bookDaoImpl(connection.getcon());
		bookdtl b=c.getbook(bid);
		cartt c1=new cartt();
		c1.setBid(bid);
		c1.setUid(uid);
		c1.setBookname(b.getBookname());
		c1.setAuthor(b.getAuthor());
		c1.setPrice(b.getPrice());
		c1.setTotalp(b.getPrice());
			cartdaoimpl c2=new cartdaoimpl(connection.getcon());
			boolean f=c2.addcart(c1);
			HttpSession session=request.getSession();
			if(f)
			{
				System.out.println("added");
				
				session.setAttribute("addcart", "Book Added To Cart");
			 response.sendRedirect("newbook.jsp");
			}
			else
			{
				System.out.println("not added");
				session.setAttribute("notadd", "Book Not Added To Cart");
				response.sendRedirect("error.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
