package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.entity.user;
import com.mysql.cj.xdevapi.Result;

public class userdaoimpl implements userDao {
	private Connection con;
	public userdaoimpl() {
		super();

	}
	public userdaoimpl(Connection con) {
		super();
		this.con = con;
	}

	public boolean usereguster(user us) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String s = "insert into user(name,email,phoneno,password) values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(s);
			
			
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getPassword());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return f;
	}

	public user login(String email, String password) {
		// TODO Auto-generated method stub
		user u=null;
		try
		{
		String s="select * from user where email=? and password=?";	
		PreparedStatement ps=con.prepareStatement(s);
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			u=new user();
			u.setId(rs.getInt(1));
			u.setName(rs.getString(2));
			u.setEmail(rs.getString(3));
			u.setPhone(rs.getString(4));
			u.setPassword(rs.getString(5));
			u.setAddress(rs.getString(6));
			u.setLandmark(rs.getString(7));
			u.setCity(rs.getString(8));
			u.setState(rs.getString(9));
			u.setPincode(rs.getString(10));
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return u;
	}

	public boolean update(user us) {
		// TODO Auto-generated method stub
		boolean f=false;
		try
		{
			String s="update  user set name=?,email=?,phoneno=?,password=? where id=?";
	        PreparedStatement ps=con.prepareStatement(s);
	        ps.setString(1, us.getName());
	        ps.setString(2, us.getEmail());
	        ps.setString(3, us.getPhone());
	        ps.setString(4, us.getPassword());
	        ps.setInt(5, us.getId());
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
		
		
		
		
		return f ;
	}

	public user getUserByUserId(int userId)
	{
		
		
		user user = null;
		try
    	{
			String query="select * from user where id=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			
			
    	   
    	    while(rs.next())
    	    {
    	        user=new user();
    	        user.setId(rs.getInt(1));
    	        user.setName(rs.getString(2));
    	        user.setEmail(rs.getString(3));
    	        user.setPhone(rs.getString(4));
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return user;
	}
	public boolean checkuser(String em) {
		// TODO Auto-generated method stub
		boolean f=true;
		try
		{
			String s="select * from user where email=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1, em);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
          {
				f=false;
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}

	
}
