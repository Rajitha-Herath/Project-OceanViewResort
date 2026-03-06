package com.service;

import java.sql.SQLException;
import java.util.List;

import com.dao.ResortDAO;
import com.model.Resort;

public class ResortService {

    private static ResortService instance;
    private ResortDAO resortDAO;

    private ResortService() {
        this.resortDAO = new ResortDAO();
    }

    public static ResortService getInstance() {
        if (instance == null) {
            synchronized (ResortService.class) {
                if (instance == null) {
                    instance = new ResortService();
                }
            }
        }
        return instance;
    }

    public void addResort(Resort resort) {
        try {
            resortDAO.addResort(resort);
        } catch (Exception e) {
            e.printStackTrace();
            // You might want to throw a runtime exception here or handle it appropriately
            throw new RuntimeException("Error adding resort: " + e.getMessage());
        }
    }

    public List<Resort> getAllResorts() throws SQLException {
        return resortDAO.getAllResorts();
    }
    
    public Resort getResortById(int resortId) throws SQLException {
        return resortDAO.getResortById(resortId);
    }
    
    public void updateResort(Resort resort) throws SQLException {
        resortDAO.updateResort(resort);
    }
    
    public void deleteResort(int resortId) throws SQLException {
        resortDAO.deleteResort(resortId);
    }


}