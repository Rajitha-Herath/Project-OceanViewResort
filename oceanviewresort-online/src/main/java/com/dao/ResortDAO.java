package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Resort;

public class ResortDAO {

    public void addResort(Resort resort) throws SQLException {
        String query = "INSERT INTO reservation_table (guest_name, contact_no, address, room_type, in_date, out_date) VALUES (?, ?, ?, ?, ?, ?)";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            System.out.println("Attempting to get database connection...");
            connection = DBConnectionFactory.getConnection();

            if (connection == null) {
                throw new SQLException("Database connection is null. Check MySQL connection settings.");
            }

            System.out.println("Connection successful, preparing statement...");
            statement = connection.prepareStatement(query);

            statement.setString(1, resort.getGuestName());
            statement.setString(2, resort.getContactNo());
            statement.setString(3, resort.getAddress());
            statement.setString(4, resort.getRoomType());
            statement.setString(5, resort.getCheckInDate());
            statement.setString(6, resort.getCheckOutDate());

            System.out.println("Executing query: " + query);
            int rowsAffected = statement.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);

        } catch (SQLException e) {
            System.out.println("    SQL Error in addResort:");
            System.out.println("   Error Code: " + e.getErrorCode());
            System.out.println("   SQL State: " + e.getSQLState());
            System.out.println("   Message: " + e.getMessage());
            throw e; // Re-throw to be handled by service layer
        } finally {
            // Clean up resources
            if (statement != null) {
                try { statement.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            // Don't close connection here - let the connection pool manage it
        }
    }

    public List<Resort> getAllResorts() throws SQLException {
        List<Resort> resorts = new ArrayList<>();
        String query = "SELECT * FROM reservation_table";  // Changed table name

        Connection connection = DBConnectionFactory.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            int id = resultSet.getInt("id_reservation");        // Changed column name
            String guestName = resultSet.getString("guest_name");
            String address = resultSet.getString("address");
            String contactNo = resultSet.getString("contact_no");
            String roomType = resultSet.getString("room_type");
            String checkInDate = resultSet.getString("in_date");  // Changed column name
            String checkOutDate = resultSet.getString("out_date"); // Changed column name

            Resort resort = new Resort(id, guestName, address, contactNo, roomType, checkInDate, checkOutDate);
            resorts.add(resort);
        }

        return resorts;
    }

    public Resort getResortById(int resortId) throws SQLException {
        String query = "SELECT * FROM reservation_table WHERE id_reservation = ?";  // Changed
        Resort resort = null;

        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, resortId);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            int id = resultSet.getInt("id_reservation");
            String guestName = resultSet.getString("guest_name");
            String address = resultSet.getString("address");
            String contactNo = resultSet.getString("contact_no");
            String roomType = resultSet.getString("room_type");
            String checkInDate = resultSet.getString("in_date");
            String checkOutDate = resultSet.getString("out_date");

            resort = new Resort(id, guestName, address, contactNo, roomType, checkInDate, checkOutDate);
        }

        return resort;
    }

    public void updateResort(Resort resort) throws SQLException {
        String query = "UPDATE reservation_table SET guest_name = ?, contact_no = ?, address = ?, room_type = ?, in_date = ?, out_date = ? WHERE id_reservation = ?";  // Changed

        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, resort.getGuestName());
        statement.setString(2, resort.getContactNo());
        statement.setString(3, resort.getAddress());
        statement.setString(4, resort.getRoomType());
        statement.setString(5, resort.getCheckInDate());
        statement.setString(6, resort.getCheckOutDate());
        statement.setInt(7, resort.getId());
        statement.executeUpdate();
    }

    public void deleteResort(int resortId) throws SQLException {
        String query = "DELETE FROM reservation_table WHERE id_reservation = ?";  // Changed

        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, resortId);
        statement.executeUpdate();
    }

    // Add this temporary test method
    public void testDatabaseConnection() {
        try {
            Connection conn = DBConnectionFactory.getConnection();
            if (conn != null) {
                System.out.println(" Database connection successful!");

                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT COUNT(*) as count FROM reservation_table");
                if (rs.next()) {
                    System.out.println("Total records in table: " + rs.getInt("count"));
                }

                // Test query to see all data
                rs = stmt.executeQuery("SELECT * FROM reservation_table");
                System.out.println("=== All Records in Database ===");
                while (rs.next()) {
                    System.out.println("ID: " + rs.getInt("id_reservation") +
                            ", Name: " + rs.getString("guest_name"));
                }
            } else {
                System.out.println(" Database connection failed!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}