<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is logged in
    if(session.getAttribute("loggedIn") == null || !(Boolean)session.getAttribute("loggedIn")) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Get user information from session
    String userEmail = (String) session.getAttribute("userEmail");
    String userName = (String) session.getAttribute("userName");
    String loginTime = (String) session.getAttribute("loginTime");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background: #448AFF !important;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .navbar-brand {
            color: white !important;
            font-weight: 600 ;
        }
        .nav-link {
            color: rgba(255,255,255,0.9) !important;
        }
        .nav-link:hover {
            color: white !important;
        }
        .container {
            margin-top: 50px;
        }
        .welcome-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            padding: 30px;
            margin-bottom: 30px;
        }
        .logout-btn {
            background: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 20px;
            transition: all 0.3s ease;
        }
        .logout-btn:hover {
            background: #c82333;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(220,53,69,0.3);
        }
        
        .logout-card{
        	background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            padding: 30px;
            margin-bottom: 30px;}
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#"><h3>Ocean View Resort Reservation System</h3></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="AddReservations.jsp">Add Room Reservations </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="DisplayReservations.jsp">Display Reservations </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Bill.jsp">Print Bill </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="help.jsp">Help</a>
                    </li>
                    <li class="nav-item">
                    	<a href="logout.jsp" class="btn logout-btn">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container">
        <div class="welcome-card">
            <h2>Welcome, <%= userName %>!</h2>
            <p class="lead">You have successfully logged in to Ocean View Resort Reservation System.</p>
        </div>
        
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Add New Room Reservation</h5>
                        <p class="card-text">Add new room reservations using guest details.</p>
                        <a href="AddReservations.jsp" class="btn btn-primary">Go to Reservations</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Display Reservation Details</h5>
                        <p class="card-text">Display complete booking information of reservation</p>
                        <a href="DisplayReservations.jsp" class="btn btn-primary">View Reservations</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Print Bill</h5>
                        <p class="card-text">Calculate the final bill and print it. </p>
                        <a href="Bill.jsp" class="btn btn-primary">View Bill</a>
                    </div>
                </div>
            </div>
        </div>
        
    	<br>
    	<div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <p><strong>Login Time:</strong> <%= loginTime %></p>
                        <a href="logout.jsp" class="btn logout-btn">Logout</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Help</h5>
                        <p class="card-text">Providing guidelines on how to use the Reservation System</p>
                        <a href="#" class="btn btn-primary">View Instructions</a>
                        <br>
                    </div>
                </div>
            </div>
         </div>
        
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>