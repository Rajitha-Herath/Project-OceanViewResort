<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Check if user is logged in
    if(session.getAttribute("loggedIn") == null || !(Boolean)session.getAttribute("loggedIn")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get user information from session
    String userName = (String) session.getAttribute("userName");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Help & User Manual - Ocean View Resort</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            margin-top: 30px;
            margin-bottom: 30px;
            max-width: 1200px;
        }

        /* Main card container */
        .help-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 30px;
            margin: 20px auto;
            border: none;
        }

        /* Card Header with gradient */
        .card-header-custom {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 25px;
            border-radius: 15px 15px 0 0;
            margin: -30px -30px 30px -30px;
            text-align: center;
        }

        .card-header-custom h1 {
            margin: 0;
            font-size: 2.2em;
            font-weight: 600;
        }

        .card-header-custom p {
            margin: 10px 0 0;
            opacity: 0.9;
            font-size: 1.1em;
        }

        /* Section styling */
        .section-title {
            color: #495057;
            font-weight: 600;
            font-size: 1.5em;
            margin: 30px 0 20px;
            padding-bottom: 10px;
            border-bottom: 3px solid #667eea;
            position: relative;
        }

        .section-title i {
            color: #667eea;
            margin-right: 10px;
        }

        /* Feature cards */
        .feature-card {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
            border-left: 5px solid #667eea;
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.2);
        }

        .feature-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .feature-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }

        .feature-icon i {
            font-size: 24px;
            color: white;
        }

        .feature-title {
            font-size: 1.3em;
            font-weight: 600;
            color: #495057;
            margin: 0;
        }

        .feature-subtitle {
            color: #6c757d;
            font-size: 0.9em;
        }

        /* Screenshot placeholder */
        .screenshot-box {
            background: white;
            border-radius: 10px;
            padding: 15px;
            margin: 15px 0;
            border: 2px dashed #dee2e6;
            text-align: center;
        }

        .screenshot-box img {
            max-width: 100%;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .screenshot-caption {
            margin-top: 10px;
            color: #6c757d;
            font-size: 0.9em;
            font-style: italic;
        }

        /* Step by step guide */
        .step-guide {
            background: white;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #e9ecef;
            position: relative;
        }

        .step-number {
            position: absolute;
            top: -10px;
            left: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 0.9em;
        }

        .step-title {
            font-weight: 600;
            color: #495057;
            margin-bottom: 10px;
            padding-left: 20px;
        }

        .step-desc {
            color: #6c757d;
            margin-left: 20px;
            font-size: 0.95em;
        }

        /* Table styles for quick reference */
        .quick-ref-table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }

        .quick-ref-table th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px;
            font-weight: 500;
        }

        .quick-ref-table td {
            padding: 10px;
            border: 1px solid #dee2e6;
        }

        .quick-ref-table tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        /* Tip box */
        .tip-box {
            background: #d4edda;
            border-radius: 10px;
            padding: 15px;
            margin: 20px 0;
            border-left: 5px solid #28a745;
        }

        .tip-box i {
            color: #28a745;
            margin-right: 10px;
            font-size: 1.2em;
        }

        .warning-box {
            background: #fff3cd;
            border-radius: 10px;
            padding: 15px;
            margin: 20px 0;
            border-left: 5px solid #ffc107;
        }

        .warning-box i {
            color: #ffc107;
            margin-right: 10px;
            font-size: 1.2em;
        }

        /* Button styling */
        .btn-custom {
            padding: 10px 30px;
            font-size: 1em;
            font-weight: 500;
            border-radius: 25px;
            border: none;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
            margin: 5px 10px;
            display: inline-block;
            text-decoration: none;
        }

        .btn-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
            color: white;
            text-decoration: none;
        }

        .btn-custom i {
            margin-right: 8px;
        }

        .btn-secondary-custom {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            box-shadow: 0 4px 15px rgba(108, 117, 125, 0.3);
        }

        .action-buttons {
            margin-top: 30px;
            text-align: center;
        }

        /* FAQ section */
        .faq-item {
            margin-bottom: 15px;
            border-bottom: 1px solid #e9ecef;
            padding-bottom: 15px;
        }

        .faq-question {
            font-weight: 600;
            color: #495057;
            cursor: pointer;
        }

        .faq-question i {
            color: #667eea;
            margin-right: 10px;
            transition: transform 0.3s ease;
        }

        .faq-answer {
            color: #6c757d;
            margin-top: 10px;
            padding-left: 25px;
        }

        /* Stats cards */
        .stat-card {
            text-align: center;
            padding: 20px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .stat-value {
            font-size: 2em;
            font-weight: 600;
            color: #667eea;
        }

        .stat-label {
            color: #6c757d;
            font-size: 0.9em;
            text-transform: uppercase;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            .help-card {
                padding: 20px;
            }

            .card-header-custom {
                margin: -20px -20px 20px -20px;
                padding: 15px;
            }

            .card-header-custom h1 {
                font-size: 1.8em;
            }

            .feature-card {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="help-card">
            <!-- Card Header -->
            <div class="card-header-custom">
                <h1><i class="fas fa-life-ring"></i> Help & User Manual</h1>
                <p>Complete guide to using Ocean View Resort Management System</p>
            </div>

            <!-- Quick Stats -->
            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="stat-card">
                        <div class="stat-value">5+</div>
                        <div class="stat-label">Core Features</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="stat-card">
                        <div class="stat-value">24/7</div>
                        <div class="stat-label">System Availability</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="stat-card">
                        <div class="stat-value">100%</div>
                        <div class="stat-label">Satisfaction</div>
                    </div>
                </div>
            </div>

            <!-- Welcome Section -->
            <div class="tip-box">
                <i class="fas fa-smile"></i>
                <strong>Welcome, <%= userName %>!</strong> This guide will help you navigate through all features of the Ocean View Resort Management System.
            </div>

            <!-- Section 1: System Overview -->
            <h2 class="section-title">
                <i class="fas fa-compass"></i> System Overview
            </h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <i class="fas fa-tachometer-alt"></i>
                            </div>
                            <div>
                                <h3 class="feature-title">Dashboard</h3>
                                <div class="feature-subtitle">Main control panel</div>
                            </div>
                        </div>
                        <p>The main dashboard displays your name, login time, and provides quick access to all system features through beautifully designed cards.</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <i class="fas fa-sign-out-alt"></i>
                            </div>
                            <div>
                                <h3 class="feature-title">Logout</h3>
                                <div class="feature-subtitle">Secure exit</div>
                            </div>
                        </div>
                        <p>Always click the Logout button when finished to ensure your session is securely terminated.</p>
                    </div>
                </div>
            </div>

            <!-- Section 2: Main Features -->
            <h2 class="section-title">
                <i class="fas fa-star"></i> Core Features
            </h2>

            <div class="row">
                <!-- Add Reservations -->
                <div class="col-lg-6">
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <i class="fas fa-plus-circle"></i>
                            </div>
                            <div>
                                <h3 class="feature-title">Add Reservations</h3>
                                <div class="feature-subtitle">Create new bookings</div>
                            </div>
                        </div>

                        <div class="step-guide">
                            <div class="step-number">1</div>
                            <div class="step-title">Fill Guest Details</div>
                            <div class="step-desc">Enter guest name, contact number, and address in the provided fields.</div>
                        </div>

                        <div class="step-guide">
                            <div class="step-number">2</div>
                            <div class="step-title">Select Room Type</div>
                            <div class="step-desc">Choose from Deluxe Room, Ocean View Room, Family Room, or Standard Room.</div>
                        </div>

                        <div class="step-guide">
                            <div class="step-number">3</div>
                            <div class="step-title">Choose Dates</div>
                            <div class="step-desc">Select check-in and check-out dates. Check-out must be after check-in.</div>
                        </div>

                        <div class="step-guide">
                            <div class="step-number">4</div>
                            <div class="step-title">Submit</div>
                            <div class="step-desc">Click "Add Reservation" to save the booking.</div>
                        </div>

                        <div class="tip-box">
                            <i class="fas fa-check-circle"></i>
                            <strong>Contact validation:</strong> Phone numbers must be exactly 10 digits.
                        </div>
                    </div>
                </div>

                <!-- Display Reservations -->
                <div class="col-lg-6">
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <i class="fas fa-table"></i>
                            </div>
                            <div>
                                <h3 class="feature-title">Display Reservations</h3>
                                <div class="feature-subtitle">View all bookings</div>
                            </div>
                        </div>

                        <p>View all reservations in a clean, organized table with the following columns:</p>

                        <table class="quick-ref-table">
                            <tr>
                                <th>Column</th>
                                <th>Description</th>
                            </tr>
                            <tr><td>ID</td><td>Unique reservation number</td></tr>
                            <tr><td>Guest Name</td><td>Guest's full name</td></tr>
                            <tr><td>Contact No</td><td>Phone number</td></tr>
                            <tr><td>Address</td><td>Guest address</td></tr>
                            <tr><td>Room Type</td><td>Type of room booked</td></tr>
                            <tr><td>Check In</td><td>Arrival date</td></tr>
                            <tr><td>Check Out</td><td>Departure date</td></tr>
                        </table>

                        <div class="stat-card mt-3">
                            <div class="stat-value">5</div>
                            <div class="stat-label">Total Reservations Shown</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <!-- Bill Printing -->
                <div class="col-lg-6">
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <i class="fas fa-file-invoice"></i>
                            </div>
                            <div>
                                <h3 class="feature-title">Bill Printing</h3>
                                <div class="feature-subtitle">Generate guest invoices</div>
                            </div>
                        </div>

                        <div class="step-guide">
                            <div class="step-number">1</div>
                            <div class="step-title">Select Reservation</div>
                            <div class="step-desc">Choose a reservation ID from the dropdown menu.</div>
                        </div>

                        <div class="step-guide">
                            <div class="step-number">2</div>
                            <div class="step-title">Review Bill</div>
                            <div class="step-desc">View reservation details and automatic charge calculations.</div>
                        </div>

                        <div class="step-guide">
                            <div class="step-number">3</div>
                            <div class="step-title">Print</div>
                            <div class="step-desc">Click "Print Bill" to generate a clean, printer-friendly version.</div>
                        </div>

                        <h6 class="font-weight-bold mt-3">Charge Breakdown:</h6>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-bed text-primary"></i> Room Rate: LKR 10,000 - 25,000/night</li>
                            <li><i class="fas fa-concierge-bell text-success"></i> Service Charge: 10%</li>
                            <li><i class="fas fa-file-invoice text-warning"></i> Tax: 5%</li>
                        </ul>

                        <div class="screenshot-box">
                            <strong>Sample Calculation:</strong><br>
                            1 night × LKR 20,000 = LKR 20,000<br>
                            + Service (10%): LKR 2,000<br>
                            + Tax (5%): LKR 1,000<br>
                            <strong>Total: LKR 23,000</strong>
                        </div>
                    </div>
                </div>

                <!-- Help Section (Current Page) -->
                <div class="col-lg-6">
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <i class="fas fa-question-circle"></i>
                            </div>
                            <div>
                                <h3 class="feature-title">Help & Support</h3>
                                <div class="feature-subtitle">User manual and assistance</div>
                            </div>
                        </div>

                        <p>You're currently viewing the help section! Here you'll find:</p>
                        <ul>
                            <li>Step-by-step guides for all features</li>
                            <li>Room rate information</li>
                            <li>FAQ and troubleshooting</li>
                            <li>System overview</li>
                        </ul>

                        <div class="tip-box">
                            <i class="fas fa-lightbulb"></i>
                            <strong>Quick Tip:</strong> Use the navigation bar at the top to quickly switch between features.
                        </div>
                    </div>
                </div>
            </div>

            <!-- Section 3: Room Rates -->
            <h2 class="section-title">
                <i class="fas fa-tags"></i> Room Rates
            </h2>

            <div class="row">
                <div class="col-md-3">
                    <div class="stat-card">
                        <div class="stat-value">LKR 10,000</div>
                        <div class="stat-label">Standard Room</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card">
                        <div class="stat-value">LKR 15,000</div>
                        <div class="stat-label">Deluxe Room</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card">
                        <div class="stat-value">LKR 20,000</div>
                        <div class="stat-label">Ocean View</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card">
                        <div class="stat-value">LKR 25,000</div>
                        <div class="stat-label">Family Room</div>
                    </div>
                </div>
            </div>

            <!-- Section 4: FAQ -->
            <h2 class="section-title">
                <i class="fas fa-question"></i> Frequently Asked Questions
            </h2>

            <div class="faq-item">
                <div class="faq-question">
                    <i class="fas fa-chevron-right"></i>
                    How do I add a new reservation?
                </div>
                <div class="faq-answer">
                    Click "Add Reservations" from the main menu or dashboard, fill in the guest details, select room type and dates, then click "Add Reservation".
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">
                    <i class="fas fa-chevron-right"></i>
                    Why can't I see my reservation in the list?
                </div>
                <div class="faq-answer">
                    Make sure you've successfully added the reservation (check for success message). Then click "Display Reservations" to view all bookings. The table should show your new entry.
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">
                    <i class="fas fa-chevron-right"></i>
                    How are bills calculated?
                </div>
                <div class="faq-answer">
                    Bill = (Number of nights × Room Rate) + Service Charge (10%) + Tax (5%). The system automatically calculates this when you select a reservation in the Bill Printing page.
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">
                    <i class="fas fa-chevron-right"></i>
                    What if I enter the wrong information?
                </div>
                <div class="faq-answer">
                    Currently, you'll need to create a new reservation with correct details. Future updates will include edit functionality.
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">
                    <i class="fas fa-chevron-right"></i>
                    How do I print only the bill without buttons?
                </div>
                <div class="faq-answer">
                    After selecting a reservation in Bill Printing, click the "Print Bill" button. The print preview will show only the bill table with reservation details and charges.
                </div>
            </div>

            <!-- Section 5: Troubleshooting -->
            <h2 class="section-title">
                <i class="fas fa-exclamation-triangle"></i> Troubleshooting
            </h2>

            <div class="warning-box">
                <i class="fas fa-exclamation-circle"></i>
                <strong>No reservations showing?</strong> Make sure you've added reservations first. Check your database connection if problems persist.
            </div>

            <div class="warning-box">
                <i class="fas fa-exclamation-circle"></i>
                <strong>Bill not calculating correctly?</strong> Verify check-in and check-out dates are correct. Check-out must be after check-in.
            </div>

            <div class="warning-box">
                <i class="fas fa-exclamation-circle"></i>
                <strong>Can't select reservation in bill page?</strong> Ensure there are reservations in the system. The dropdown will be empty if no reservations exist.
            </div>

            <!-- Section 6: Contact Support -->
            <h2 class="section-title">
                <i class="fas fa-headset"></i> Need More Help?
            </h2>

            <div class="row">
                <div class="col-md-4 text-center">
                    <i class="fas fa-envelope fa-3x" style="color: #667eea;"></i>
                    <h5 class="mt-2">Email Support</h5>
                    <p>support@oceanviewresort.com</p>
                </div>
                <div class="col-md-4 text-center">
                    <i class="fas fa-phone fa-3x" style="color: #667eea;"></i>
                    <h5 class="mt-2">Phone Support</h5>
                    <p>+94 11 234 5678</p>
                </div>
                <div class="col-md-4 text-center">
                    <i class="fas fa-clock fa-3x" style="color: #667eea;"></i>
                    <h5 class="mt-2">Hours</h5>
                    <p>Mon-Fri: 9am - 6pm</p>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="action-buttons">
                <a href="Main.jsp" class="btn-custom">
                    <i class="fas fa-home"></i> Back to Main
                </a>
                <a href="addReservations.jsp" class="btn-custom">
                    <i class="fas fa-plus-circle"></i> Add Reservation
                </a>
                <a href="resort?action=list" class="btn-custom">
                    <i class="fas fa-list"></i> View All
                </a>
                <a href="bill" class="btn-custom btn-secondary-custom">
                    <i class="fas fa-file-invoice"></i> Bill Printing
                </a>
            </div>

            <!-- Footer -->
            <div class="text-center mt-4 text-muted">
                <small>Ocean View Resort Management System v1.0 | &copy; 2026 All Rights Reserved</small>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Toggle FAQ answers
        $(document).ready(function() {
            $(".faq-answer").hide();

            $(".faq-question").click(function() {
                $(this).find("i").toggleClass("fa-chevron-right fa-chevron-down");
                $(this).next(".faq-answer").slideToggle();
            });
        });
    </script>
</body>
</html>