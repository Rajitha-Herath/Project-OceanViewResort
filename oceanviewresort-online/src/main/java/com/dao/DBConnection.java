package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/ocean_view_resort?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "Mysql@12345";

	private static DBConnection instance;
	private Connection connection;

	private DBConnection() {
		try {
			// Load MySQL driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("MySQL JDBC Driver loaded successfully");

			// Create connection
			this.connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			System.out.println("Database connected successfully!");

		} catch (ClassNotFoundException e) {
			System.out.println("MySQL JDBC Driver not found!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connection failed! Check output console");
			System.out.println("SQL Error Code: " + e.getErrorCode());
			System.out.println("SQL State: " + e.getSQLState());
			e.printStackTrace();
		}

		// Add more detailed error logging in DBConnection constructor:
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("MySQL JDBC Driver loaded successfully");

				// Print connection details (without password)
				System.out.println("Attempting to connect to: " + DB_URL);
				System.out.println("Username: " + DB_USER);

				this.connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				System.out.println("Database connected successfully!");

			} catch (ClassNotFoundException e) {
				System.out.println("MySQL JDBC Driver not found! Check if MySQL connector JAR is in classpath");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("Connection failed! Check output console");
				System.out.println("SQL Error Code: " + e.getErrorCode());
				System.out.println("SQL State: " + e.getSQLState());
				System.out.println("Error Message: " + e.getMessage());
				e.printStackTrace();
			}

	}

	public static DBConnection getInstance() {
		if (instance == null) {
			synchronized (DBConnection.class) {
				if (instance == null) {
					instance = new DBConnection();
				}
			}
		}
		return instance;
	}

	public Connection getConnection() {
		try {
			// Check if connection is closed and reconnect if needed
			if (connection == null || connection.isClosed()) {
				System.out.println("Connection is closed. Reconnecting...");
				instance = new DBConnection();
				return instance.connection;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	// Test connection method
	public static void main(String[] args) {
		System.out.println("Testing database connection...");
		DBConnection dbConnection = DBConnection.getInstance();
		Connection conn = dbConnection.getConnection();

		if (conn != null) {
			System.out.println(" Connection successful!");
		} else {
			System.out.println("Connection failed!");
		}
	}
}