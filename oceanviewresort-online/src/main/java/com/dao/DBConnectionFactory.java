package com.dao;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConnectionFactory {

	public static Connection getConnection() {
		try {
			Connection conn = DBConnection.getInstance().getConnection();
			if (conn == null) {
				System.out.println(" Warning: Connection is null in DBConnectionFactory");
			} else {
				System.out.println("Connection obtained successfully from factory");
			}
			return conn;
		} catch (Exception e) {
			System.out.println(" Error getting connection from factory: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
}