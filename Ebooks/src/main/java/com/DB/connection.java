package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class connection {
	private static Connection con = null;

	public static Connection getcon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "root");

		} catch (Exception e) {

			e.printStackTrace();
		}

	   return con;
	   
	}
}
