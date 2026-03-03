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
    
    public void addResort(Resort resort) {
        String query = "INSERT INTO Resort (guest_name, address, contact_no, room_type, check_in_date, check_out_date) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            Connection connection = DBConnectionFactory.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, resort.getGuestName());
            statement.setString(2, resort.getAddress());
            statement.setString(3, resort.getContactNo());
            statement.setString(4, resort.getRoomType());
            statement.setString(5, resort.getCheckInDate());
            statement.setString(6, resort.getCheckOutDate());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Resort> getAllResorts() throws SQLException {
        List<Resort> resorts = new ArrayList<>();
        String query = "SELECT * FROM Resort";

        Connection connection = DBConnectionFactory.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            int id = resultSet.getInt("resort_id");
            String guestName = resultSet.getString("guest_name");
            String address = resultSet.getString("address");
            String contactNo = resultSet.getString("contact_no");
            String roomType = resultSet.getString("room_type");
            String checkInDate = resultSet.getString("check_in_date");
            String checkOutDate = resultSet.getString("check_out_date");
            
            Resort resort = new Resort(id, guestName, address, contactNo, roomType, checkInDate, checkOutDate);
            resorts.add(resort);
        }

        return resorts;
    }
    
    public Resort getResortById(int resortId) throws SQLException {
        String query = "SELECT * FROM Resort WHERE resort_id = ?";
        Resort resort = null;
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, resortId);
        ResultSet resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            int id = resultSet.getInt("resort_id");
            String guestName = resultSet.getString("guest_name");
            String address = resultSet.getString("address");
            String contactNo = resultSet.getString("contact_no");
            String roomType = resultSet.getString("room_type");
            String checkInDate = resultSet.getString("check_in_date");
            String checkOutDate = resultSet.getString("check_out_date");
            
            resort = new Resort(id, guestName, address, contactNo, roomType, checkInDate, checkOutDate);
        }
        
        return resort;
    }
    
    public void updateResort(Resort resort) throws SQLException {
        String query = "UPDATE Resort SET guest_name = ?, address = ?, contact_no = ?, room_type = ?, check_in_date = ?, check_out_date = ? WHERE resort_id = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, resort.getGuestName());
        statement.setString(2, resort.getAddress());
        statement.setString(3, resort.getContactNo());
        statement.setString(4, resort.getRoomType());
        statement.setString(5, resort.getCheckInDate());
        statement.setString(6, resort.getCheckOutDate());
        statement.setInt(7, resort.getId());
        statement.executeUpdate();
    }
    
    public void deleteResort(int resortId) throws SQLException {
        String query = "DELETE FROM Resort WHERE resort_id = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, resortId);
        statement.executeUpdate();
    }
}