package com.user.servlet;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.connection;
import com.dao.cartdaoimpl;
import com.dao.orderdaoimpl;
import com.entity.bookorder;
import com.entity.cartt;

/**
 * Servlet implementation class order
 */
public class order extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{ int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String number=request.getParameter("number");
		String address=request.getParameter("address");
		String landmark=request.getParameter("landmark");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String pincode=request.getParameter("pincode");
		String payment=request.getParameter("payment");
		String fulladd=address+","+landmark+","+city+","+state+","+pincode;
		System.out.print(name+" "+email+" "+number+" "+fulladd+" "+payment);
		cartdaoimpl c=new cartdaoimpl(connection.getcon());
			List<cartt> d=c.getbook(id);
			orderdaoimpl o=new orderdaoimpl(connection.getcon());
			HttpSession session =request.getSession();
			ArrayList<bookorder> list=new ArrayList<bookorder>();
			bookorder bo=null;
			boolean q=false;
			Random r=new Random();
			for(cartt f:d)
			{ bo= new bookorder();
				
				bo.setOrderid("Book-Ord-00"+r.nextInt(1000));
			bo.setName(name);
			bo.setEmail(email);
			bo.setPhone(number);
			bo.setFulladdress(fulladd);
            bo.setBookname(f.getBookname());
            bo.setAuthor(f.getAuthor());
            bo.setPrice(f.getPrice());
            bo.setPayment(payment);
				
				list.add(bo);
			}
		q=o.saveorder(list);
			if(q)
			{ session.setAttribute("onp", "Order Not Placed,Try Again");
			response.sendRedirect("cart.jsp");	
				System.out.println("added");
					
			}
			else
			{
				session.setAttribute("op", "Order Placed Successfully");
				response.sendRedirect("orderplaced.jsp");
			}
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
			
		}
	}

}
