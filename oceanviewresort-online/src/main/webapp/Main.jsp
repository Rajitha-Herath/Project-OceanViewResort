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
    <title>Main Page - Ocean View Resort</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background: linear-gradient(135deg, #448AFF 0%, #764ba2 100%);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .navbar-brand {
            color: white !important;
            font-weight: 600;
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
            background: linear-gradient(135deg, #448AFF 0%, white 100%);
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

        /* Card styles for equal sizing */
        .row.equal-height {
            display: flex;
            flex-wrap: wrap;
        }

        .row.equal-height > [class*='col-'] {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        .card {
            flex: 1;
            height: 100%;
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 25px 20px;
        }

        .card-title {
            color: #343a40;
            font-weight: 600;
            font-size: 1.3rem;
            margin-bottom: 15px;
            position: relative;
            padding-bottom: 10px;
        }

        .card-title:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: #448AFF;
            border-radius: 2px;
        }

        .card-text {
            color: #6c757d;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 20px;
            flex-grow: 1;
            min-height: 60px;
        }

        .card .btn {
            align-self: center;
            width: 80%;
            border-radius: 25px;
            padding: 10px 20px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.85rem;
            transition: all 0.3s ease;
            background: #448AFF;
            border: none;
        }

        .card .btn:hover {
            background: #2979FF;
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(68,138,255,0.3);
        }

        /* Different card colors for each section */
        .card.reservation-card {
            background: linear-gradient(135deg, #448AFF 0%, #764ba2 100%);
        }

        .card.display-card {
            background: linear-gradient(135deg, #448AFF 0%, #764ba2 100%);
        }

        .card.bill-card {
            background: linear-gradient(135deg, #448AFF 0%, #764ba2 100%);
        }

        .card.help-card {
            background: linear-gradient(135deg, #448AFF 0%, #764ba2 100%);
        }

        .card.reservation-card .card-title,
        .card.display-card .card-title,
        .card.bill-card .card-title,
        .card.help-card .card-title,
        .card.reservation-card .card-text,
        .card.display-card .card-text,
        .card.bill-card .card-text,
        .card.help-card .card-text,
        .card.reservation-card .btn,
        .card.display-card .btn,
        .card.bill-card .btn,
        .card.help-card .btn {
            color: white;
        }

        .card.reservation-card .card-title:after,
        .card.display-card .card-title:after,
        .card.bill-card .card-title:after,
        .card.help-card .card-title:after {
            background: white;
        }

        .card.reservation-card .btn {
            background: rgba(255,255,255,0.2);
            border: 2px solid white;
        }

        .card.display-card .btn {
            background: rgba(255,255,255,0.2);
            border: 2px solid white;
        }

        .card.bill-card .btn {
            background: rgba(255,255,255,0.2);
            border: 2px solid white;
        }

        .card.help-card .btn {
            background: rgba(255,255,255,0.2);
            border: 2px solid white;
        }

        .card.reservation-card .btn:hover,
        .card.display-card .btn:hover,
        .card.bill-card .btn:hover,
        .card.help-card .btn:hover {
            background: rgba(255,255,255,0.3);
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
        .row.equal-height > [class*='col-'] {
            margin-bottom: 20px;
        }

        .card-text {
            min-height: auto;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#"><h2>Ocean View Resort</h2></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="addReservations.jsp">Add Reservations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="resort?action=list">Display Reservations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="bill">Bill Printing</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="help.jsp">Help</a>
                    </li>
                    <li class="nav-item">
                        <a href="login.jsp" class="btn logout-btn ml-2">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="welcome-card text-center">
            <h2>Welcome, <%= userName %>!</h2>
            <p class="lead">You have successfully logged in to Ocean View Resort Management System.</p>
        </div>

        <div class="row equal-height">
            <!-- Add Reservations Card -->
            <div class="col-lg-3 col-md-6">
                <div class="card reservation-card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Add Reservations</h5>
                        <p class="card-text">Create new reservations with guest details, room preferences, and check-in/out dates.</p>
                        <a href="addReservations.jsp" class="btn">Add Reservation</a>
                    </div>
                </div>
            </div>

            <!-- Display Reservations Card -->
            <div class="col-lg-3 col-md-6">
                <div class="card display-card">
                    <div class="card-body text-center">
                        <h5 class="card-title">View Reservations</h5>
                        <p class="card-text">View, search, and manage all existing reservations with complete details.</p>
                        <a href="resort?action=list" class="btn">View All</a>
                    </div>
                </div>
            </div>

            <!-- Bill Printing Card -->
            <div class="col-lg-3 col-md-6">
                <div class="card bill-card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Bill Printing</h5>
                        <p class="card-text">Generate and print bills for guests with automatic calculation of charges.</p>
                        <a href="bill" class="btn">Print Bill</a>
                    </div>
                </div>
            </div>

            <!-- Help Card -->
            <div class="col-lg-3 col-md-6">
                <div class="card help-card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Help & Support</h5>
                        <p class="card-text">Get assistance, user guides, and system documentation for all features.</p>
                        <a href="help.jsp" class="btn">Get Help</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="welcome-card">
            <div class="row">
                <div class="col-md-6">
                    <p><strong>Email:</strong> <%= userEmail %></p>
                    <p><strong>Login Time:</strong> <%= loginTime %></p>
                </div>
                <div class="col-md-6 text-right">
                    <a href="login.jsp" class="btn logout-btn">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>