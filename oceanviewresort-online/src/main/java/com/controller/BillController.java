package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Resort;
import com.service.ResortService;

@WebServlet("/bill")
public class BillController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ResortService resortService;

    public void init() throws ServletException {
        resortService = ResortService.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("=== BillController doGet called ===");

        try {
            // Get ALL reservations for the dropdown
            List<Resort> allReservations = resortService.getAllResorts();
            System.out.println("Number of reservations fetched: " + allReservations.size());

            // Print each reservation for debugging
            for (Resort r : allReservations) {
                System.out.println("Reservation ID: " + r.getId() + " - " + r.getGuestName());
            }

            // IMPORTANT: Set the reservations list in request scope
            request.setAttribute("reservations", allReservations);

            // Check if a specific reservation ID is selected
            String reservationIdParam = request.getParameter("reservationId");
            System.out.println("Selected reservation ID: " + reservationIdParam);

            if (reservationIdParam != null && !reservationIdParam.isEmpty()) {
                try {
                    int reservationId = Integer.parseInt(reservationIdParam);
                    Resort reservation = resortService.getResortById(reservationId);
                    request.setAttribute("reservation", reservation);

                    if (reservation != null) {
                        System.out.println("Found reservation: " + reservation.getGuestName());
                    } else {
                        System.out.println("No reservation found with ID: " + reservationId);
                    }
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }

            // Forward to bill.jsp
            request.getRequestDispatcher("/bill.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}