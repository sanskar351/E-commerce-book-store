package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.bookorder;

public class orderdaoimpl implements orderdao {
private Connection con;
public orderdaoimpl() {
	super();
}
	public orderdaoimpl(Connection con) {
	super();
	this.con = con;
}

	public boolean saveorder(List<bookorder> bo) {
		// TODO Auto-generated method stub
		boolean f=false;
		try
		{ 
		
			String s="insert into bookorder(order_id,username,email,address,phone,bookname,author,price,payment)  value(?,?,?,?,?,?,?,?,?)"; 
		con.setAutoCommit(false);
			PreparedStatement ps=con.prepareStatement(s);
		for(bookorder b:bo)
		{
		
		ps.setString(1, b.getOrderid());
		ps.setString(2, b.getName());
		ps.setString(3, b.getEmail());
		ps.setString(4, b.getFulladdress());
		ps.setString(5, b.getPhone());
		
		ps.setString(6, b.getBookname());
		ps.setString(7, b.getAuthor());
		ps.setString(8, b.getPrice());
		ps.setString(9,"Cash On Delivery");
		ps.addBatch();
		}
		int[] count=ps.executeBatch();
		con.commit();
		//f=true;
		con.setAutoCommit(true);
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}

	public List<bookorder> getbooks(String email) {
		// TODO Auto-generated method stub
		ArrayList<bookorder> bo=new ArrayList<bookorder>();
		bookorder b=null;
		try
		{
	String s="select * from bookorder where email=?";
	PreparedStatement ps=con.prepareStatement(s);
	ps.setString(1, email);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		b=new bookorder();
		b.setId(rs.getInt(1));
		b.setOrderid(rs.getString(2));
		b.setName(rs.getString(3));
		b.setEmail(rs.getString(4));
		b.setFulladdress(rs.getString(5));
		b.setPhone(rs.getString(6));
		b.setBookname(rs.getString(7));
		b.setAuthor(rs.getString(8));
		b.setPrice(rs.getString(9));
		b.setPayment(rs.getString(10));
		
		System.out.println(bo.add(b));
	}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return bo;
	}

	public List<bookorder> getbook() {
		// TODO Auto-generated method stub
		ArrayList<bookorder> b1=new ArrayList<bookorder>();
		bookorder b=null;
		try
		{
			String s="select * from bookorder";
			PreparedStatement ps=con.prepareStatement(s);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			b=new bookorder();

			b.setId(rs.getInt(1));
			b.setOrderid(rs.getString(2));
			b.setName(rs.getString(3));
			b.setEmail(rs.getString(4));
			b.setFulladdress(rs.getString(5));
			b.setPhone(rs.getString(6));
			b.setBookname(rs.getString(7));
			b.setAuthor(rs.getString(8));
			b.setPrice(rs.getString(9));
			b.setPayment(rs.getString(10));
			b1.add(b);
			
					
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return b1;
	}
	public List<bookorder> getuser(int id) {
		// TODO Auto-generated method stub
		ArrayList<bookorder> b1=new ArrayList<bookorder>();
		bookorder b=null;
		try
		{
			String s="select * from bookorder where uid=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			b=new bookorder();

			b.setId(rs.getInt(1));
			b.setOrderid(rs.getString(2));
			b.setName(rs.getString(3));
			b.setEmail(rs.getString(4));
			b.setFulladdress(rs.getString(5));
			b.setPhone(rs.getString(6));
			b.setBookname(rs.getString(7));
			b.setAuthor(rs.getString(8));
			b.setPrice(rs.getString(9));
			b.setPayment(rs.getString(10));
			b1.add(b);
			
					
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return b1;
	}

}
