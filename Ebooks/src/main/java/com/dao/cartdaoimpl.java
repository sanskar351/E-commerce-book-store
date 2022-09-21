package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.entity.bookdtl;
import com.entity.cartt;

public class cartdaoimpl implements cartdao {

	private Connection conn;

	
	
	public cartdaoimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addcart(cartt c) {
		// TODO Auto-generated method stub
		boolean f=false;
		try
		{
			String s="insert into cart(bid,uid,bookname,author,price,totalp) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getBookname());
			ps.setString(4, c.getAuthor());
			ps.setString(5, c.getPrice());
			ps.setString(6, c.getTotalp());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}

	public List<cartt> getbook(int userid) {
		// TODO Auto-generated method stub
		List<cartt> l=new ArrayList<cartt>();
		cartt c=null;
		try {
			String s="select * from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setInt(1, userid);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				c=new cartt();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setBookname(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getString(6));
			
				
		
			
				l.add(c);
				
			}
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return l;
	}

	public boolean removebook(int uid, int bid) {
		boolean f=false;
		int i;
		try
		{
		String s="delete from cart where uid=? and bid=?";
		PreparedStatement ps=conn.prepareStatement(s);
		ps.setInt(1, uid);
		ps.setInt(2, bid);
		i=ps.executeUpdate();
		if(i==1)
		{
			f=true;
		}
		}
		catch(Exception e)
		{
		e.printStackTrace();	
		}
		return f;
	}
	public List<cartt> getCartByUserId(int userId)
	{
		//Connection con=DBUtility.getConnection();
		
		
		cartt cart=null;
		List<cartt> li=new ArrayList();
		
		try
    	{
			String query="select * from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
    	    while(rs.next())
    	    {
    	        cart=new cartt();
    	        cart.setUid(rs.getInt(1));
    	        cart.setBid(rs.getInt(2));
    	        cart.setCid(rs.getInt(3));
    	        cart.setBookname(rs.getString(4));
    	        cart.setAuthor(rs.getString(5));
    	        cart.setPrice(rs.getString(6));
    	        cart.setTotalp(rs.getString(7));
    	        li.add(cart);
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return li;
	}
//	public bookdtl getProductById(int productId) 
//	{
//		bookdtl bt=null;
//		List<bookdtl> li=new ArrayList();
//				try
//    	{
//					String query="select * from bookdetails where bookid=?";
//
//    	  PreparedStatement ps=conn.prepareStatement(query);
//    	  ps.setInt(1,productId);
//    	  ResultSet rs=ps.executeQuery();
//    	    while(rs.next())
//    	    {
//    	        bt=new bookdtl();
//    	        bt.setId(rs.getInt(1));
//				bt.setBookname(rs.getString(2));
//				bt.setAuthor(rs.getString(3));
//				bt.setPrice(rs.getString(4));
//				bt.setCategory(rs.getString(5));
//				bt.setStatus(rs.getString(6));
//				bt.setPhoto(rs.getString(7));
//				bt.setEmail(rs.getString(8));
//				li.add(bt);
//    	       
//    	    }
//    	}
//    	
//    	catch(SQLException e)
//    	{
//    		System.out.println(e);
//    	}
//    	
//    	return bt;
//	}
	public String totalPriceFromCart(int userId)
	{
		   
		String price="1";
			try
			{
				String query="select price from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(query);
		ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			
				while(rs.next())
				{
					String p=rs.getString(5);
					price=price+p;
				}
			}
			
			catch(SQLException e)
	      	{
	      		e.printStackTrace();
	      	}
			return price;
		
	}
}
