package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.connection;
import com.dao.cartdaoimpl;
import com.entity.cartt;
import com.paypal.PaymentServices;
import com.paypal.base.rest.PayPalRESTException;

/**
 * Servlet implementation class AuthorizePaymentServlet
 */
public class AuthorizePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=(String)request.getParameter("userId");
    	System.out.println("User Id : "+userId);
    	List<cartt> listOfproductInCart=new cartdaoimpl(connection.getcon()).getCartByUserId(Integer.parseInt(userId));
         
   //     OrderDetail orderDetail = new OrderDetail(product, subtotal, shipping, tax, total);
 
        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(listOfproductInCart);
 
            response.sendRedirect(approvalLink);
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

	}


