package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Resort;
import com.service.ResortService;

@WebServlet("/resort")
public class ResortController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ResortService resortService;
     
    public void init() throws ServletException {
        resortService = ResortService.getInstance();
    }
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        System.out.println("Action: " + action); // Debug line
        
        if (action == null || action.equals("list")) {
            listResorts(request, response);
        } else if (action.equals("add")) {
            showAddForm(request, response);
        } else {
            // Default to list if action not recognized
            listResorts(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        System.out.println("POST Action: " + action); // Debug line
        
        if (action != null && action.equals("add")) {
            addResort(request, response);
        } else {
            response.sendRedirect("resort?action=list");
        }
    }

    private void listResorts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Resort> resortList = resortService.getAllResorts();
            System.out.println("=== DEBUG ===");
            System.out.println("Number of resorts found: " + resortList.size());
            for (Resort r : resortList) {
                System.out.println("Resort: " + r.getId() + " - " + r.getGuestName());
            }
            request.setAttribute("resorts", resortList);
            request.getRequestDispatcher("/displayReservations.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/addReservations.jsp").forward(request, response);
    }

    private void addResort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String contact = request.getParameter("contact");
            String roomtype = request.getParameter("roomtype");
            String indate = request.getParameter("indate");
            String outdate = request.getParameter("outdate");

            // Debug print all parameters
            System.out.println("=== Adding Resort ===");
            System.out.println("Name: " + name);
            System.out.println("Address: " + address);
            System.out.println("Contact: " + contact);
            System.out.println("Room Type: " + roomtype);
            System.out.println("Check In: " + indate);
            System.out.println("Check Out: " + outdate);

            Resort resort = new Resort();
            resort.setGuestName(name);
            resort.setAddress(address);
            resort.setContactNo(contact);
            resort.setRoomType(roomtype);
            resort.setCheckInDate(indate);
            resort.setCheckOutDate(outdate);

            resortService.addResort(resort);
            System.out.println("Resort added successfully!");
            response.sendRedirect("resort?action=list");

        } catch (Exception e) {
            e.printStackTrace(); // This will print the full error in IntelliJ console
            System.out.println("ERROR: " + e.getMessage());
            System.out.println("ERROR Type: " + e.getClass().getName());

            request.setAttribute("errorMessage", "Error adding reservation: " + e.getMessage() + " - " + e.getClass().getSimpleName());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    }