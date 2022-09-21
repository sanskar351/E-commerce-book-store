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
 * Servlet implementation class updateuser
 */
public class updateuser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{   int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phone=request.getParameter("number");
			String password=request.getParameter("password");
			user user1=new user();
			user1.setId(id);
			user1.setName(name);
			user1.setEmail(email);
			user1.setPhone(phone);
			user1.setPassword(password);
			HttpSession session=request.getSession();
			userdaoimpl ud=new userdaoimpl(connection.getcon());
			boolean f=ud.update(user1);
			if(f)
			{ session.setAttribute("pu", "Profile Updated Succeessfully");
				System.out.println("updated");
				response.sendRedirect("editprofile.jsp");
			}
			else
			{ session.setAttribute("pnu", "Profile Not Updated");
				System.out.println("not updated");
			}
		}
		
		catch(Exception e)
		{
			
		}
		
	}

}
