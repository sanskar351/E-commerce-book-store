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
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String check = request.getParameter("check");
			HttpSession session = request.getSession();
			userdaoimpl udi = new userdaoimpl(connection.getcon());
			if (check != null) {
				if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
					user us = new user();
					us.setName("Admin");
					session.setAttribute("login", us);
					response.sendRedirect("admin/admin.jsp");
				} else {
					user us = udi.login(email, password);
					if (us != null) {
						response.sendRedirect("index.jsp");
						session.setAttribute("login", us);
					} 
					else {
						response.sendRedirect("login.jsp");
						session.setAttribute("no login", "Invalid Credentials");
						System.out.println("error");
					}

				}
			} else {

				response.sendRedirect("login.jsp");
				session.setAttribute("nlogin", "Something Went Wrong ");
				System.out.println("error");
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

	}

}
