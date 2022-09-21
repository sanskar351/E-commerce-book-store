package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.entity.bookdtl;
import com.mysql.cj.xdevapi.Result;

public class bookDaoImpl implements bookDao {
	private Connection con;

	public bookDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	public bookDaoImpl(Connection con) {
		super();
		this.con = con;
	}

	public boolean addbooks(bookdtl btl) {
		boolean f = false;
		try {

			String s = "insert into bookdetails(bookname,author,price,category,status,photo,useremail) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(s);
			ps.setString(1, btl.getBookname());
			ps.setString(2, btl.getAuthor());
			ps.setString(3, btl.getPrice());
			ps.setString(4, btl.getCategory());
			ps.setString(5, btl.getStatus());
			ps.setString(6, btl.getPhoto());
			ps.setString(7, btl.getEmail());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<bookdtl> getbooks() {
		// TODO Auto-generated method stub
		List<bookdtl> list = new ArrayList<bookdtl>();
		bookdtl b = null;
		try {
			String s = "select * from bookdetails where category=?";
			PreparedStatement ps = con.prepareStatement(s);
			ps.setString(1, "New");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new bookdtl();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
e.printStackTrace();
		}

		return list;
	}

	public bookdtl getbook(int id) {
		// TODO Auto-generated method stub
		bookdtl b = null;
		try {
			String s = "select * from bookdetails where bookid=?";
			PreparedStatement ps = con.prepareStatement(s);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new bookdtl();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;

	}

	public boolean updatebook(bookdtl b) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String s = "update bookdetails set bookname=?,author=?,price=?,status=? where bookid=?";
			PreparedStatement ps = con.prepareStatement(s);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getId());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean delete(int id) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String s = "delete from bookdetails where bookid=?";
			PreparedStatement ps = con.prepareStatement(s);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<bookdtl> newbook() {
		// TODO Auto-generated method stub
		List<bookdtl> list = new ArrayList<bookdtl>();
		bookdtl b = null;
		try {
			String s = "select * from bookdetails where category=? and status=?";
			PreparedStatement ps = con.prepareStatement(s);
			ps.setString(1, "New");
			ps.setString(2 ,"Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new bookdtl();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;

			}

		} catch (Exception e) {
e.printStackTrace();
		}

		return list;
	}

	public List<bookdtl> oldbook() {
		// TODO Auto-generated method stub
		List<bookdtl> list1=new ArrayList<bookdtl>();
		bookdtl b1=null;
		try
		{
			String s="select * from bookdetails where category=? and status=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b1 = new bookdtl();
				b1.setId(rs.getInt(1));
				b1.setBookname(rs.getString(2));
				b1.setAuthor(rs.getString(3));
				b1.setPrice(rs.getString(4));
				b1.setCategory(rs.getString(5));
				b1.setStatus(rs.getString(6));
				b1.setPhoto(rs.getString(7));
				b1.setEmail(rs.getString(8));
				list1.add(b1);
				i++;

			}

			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list1;
	}

	public List<bookdtl> recent() {
		// TODO Auto-generated method stub
		List<bookdtl> list1=new ArrayList<bookdtl>();
		bookdtl b1=null;
		try
		{
		String s="select * from bookdetails where status=? order by bookid DESC";
		PreparedStatement ps=con.prepareStatement(s);
		ps.setString(1, "Active");
		ResultSet rs=ps.executeQuery();
		int i=1;
		while(rs.next() && i<=4)
		{
			b1 = new bookdtl();
			b1.setId(rs.getInt(1));
			b1.setBookname(rs.getString(2));
			b1.setAuthor(rs.getString(3));
			b1.setPrice(rs.getString(4));
			b1.setCategory(rs.getString(5));
			b1.setStatus(rs.getString(6));
			b1.setPhoto(rs.getString(7));
			b1.setEmail(rs.getString(8));
			list1.add(b1);
			i++;

	
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		return list1;
	}

	public List<bookdtl> allnewbook() {
		// TODO Auto-generated method stub
		List<bookdtl> list = new ArrayList<bookdtl>();
		bookdtl b = null;
		try {
			String s = "select * from bookdetails where category=? and status=?";
			PreparedStatement ps = con.prepareStatement(s);
			ps.setString(1, "New");
			ps.setString(2 ,"Active");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				b = new bookdtl();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			
			}

		} catch (Exception e) {
e.printStackTrace();
		}
		return list;
	}

	public List<bookdtl> alloldbook() {
		// TODO Auto-generated method stub
		List<bookdtl> list1=new ArrayList<bookdtl>();
		bookdtl b1=null;
		try
		{
			String s="select * from bookdetails where category=? and status=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
		
			while (rs.next()) {
				b1 = new bookdtl();
				b1.setId(rs.getInt(1));
				b1.setBookname(rs.getString(2));
				b1.setAuthor(rs.getString(3));
				b1.setPrice(rs.getString(4));
				b1.setCategory(rs.getString(5));
				b1.setStatus(rs.getString(6));
				b1.setPhoto(rs.getString(7));
				b1.setEmail(rs.getString(8));
				list1.add(b1);
				

			}

			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list1;
	}

	public List<bookdtl> allrecent() {
		// TODO Auto-generated method stub
		List<bookdtl> list1=new ArrayList<bookdtl>();
		bookdtl b1=null;
		try
		{
		String s="select * from bookdetails where status=? order by bookid ASC";
		PreparedStatement ps=con.prepareStatement(s);
		ps.setString(1, "Active");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			b1 = new bookdtl();
			b1.setId(rs.getInt(1));
			b1.setBookname(rs.getString(2));
			b1.setAuthor(rs.getString(3));
			b1.setPrice(rs.getString(4));
			b1.setCategory(rs.getString(5));
			b1.setStatus(rs.getString(6));
			b1.setPhoto(rs.getString(7));
			b1.setEmail(rs.getString(8));
			list1.add(b1);
		

	
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return list1;
	}

	public bookdtl viewbook(int id) {
		// TODO Auto-generated method stub
		bookdtl b=null;
		try
		{
			String s="select * from bookdetails where bookid=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new bookdtl();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				
			}
			
		}
		catch(Exception e)
		{
		e.printStackTrace();	
		}
		
		return b;
	}

	public List<bookdtl> getoldbooks(String email, String cat) {
		// TODO Auto-generated method stub
		List<bookdtl> list=new ArrayList<bookdtl>();
		bookdtl b=null;
		try
		{
			String s="select * from bookdetails where useremail=? and category=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1, email);
			ps.setString(2, cat);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new bookdtl();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	public boolean removeold(int id) {
		// TODO Auto-generated method stub
		boolean f=false;
		try
		{
			String s="delete from bookdetails where bookid=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
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
	public bookdtl getProductById(int productId) 
	{
		bookdtl bt=null;
		List<bookdtl> li=new ArrayList();
				try
    	{
					String query="select * from bookdetails where bookid=?";

    	  PreparedStatement ps=con.prepareStatement(query);
    	  ps.setInt(1,productId);
    	  ResultSet rs=ps.executeQuery();
    	    while(rs.next())
    	    {
    	        bt=new bookdtl();
    	        bt.setId(rs.getInt(1));
				bt.setBookname(rs.getString(2));
				bt.setAuthor(rs.getString(3));
				bt.setPrice(rs.getString(4));
				bt.setCategory(rs.getString(5));
				bt.setStatus(rs.getString(6));
				bt.setPhoto(rs.getString(7));
				bt.setEmail(rs.getString(8));
				li.add(bt);
    	       
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return bt;
	}
	public List<bookdtl> getbookbysearch(String ch)
	{ List<bookdtl> list=new ArrayList<bookdtl>();
	bookdtl b=null;
	
	try
	{
		String s="select * from bookdetails where bookname like? or author like ? or category like ? and status like ? ";
	    PreparedStatement ps=con.prepareStatement(s);
	    ps.setString(1, "%"+ch+"%");
	    ps.setString(2, "%"+ch+"%");
	    ps.setString(3, "%"+ch+"%");
	   ps.setString(4, "Active");
	    ResultSet rs=ps.executeQuery();
	    while(rs.next())
	    {
	    	b = new bookdtl();
			b.setId(rs.getInt(1));
			b.setBookname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setCategory(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setEmail(rs.getString(8));
			list.add(b);
			
	    }
	    
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		return list;
		
	}
}
