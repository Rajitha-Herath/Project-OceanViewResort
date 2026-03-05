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
            cursor: pointer;
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

        /* Custom Modal Styles */
        .modal-custom {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            align-items: center;
            justify-content: center;
        }

        .modal-content-custom {
            background: white;
            border-radius: 15px;
            padding: 30px;
            max-width: 400px;
            width: 90%;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            animation: slideIn 0.3s ease;
        }

        @keyframes slideIn {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .modal-header-custom {
            text-align: center;
            margin-bottom: 20px;
        }

        .modal-header-custom i {
            font-size: 50px;
            color: #dc3545;
            margin-bottom: 10px;
        }

        .modal-header-custom h3 {
            color: #333;
            font-weight: 600;
        }

        .modal-body-custom {
            text-align: center;
            margin-bottom: 25px;
            color: #6c757d;
        }

        .modal-footer-custom {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .modal-btn {
            padding: 10px 30px;
            border: none;
            border-radius: 25px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .modal-btn-yes {
            background: #dc3545;
            color: white;
        }

        .modal-btn-yes:hover {
            background: #c82333;
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(220,53,69,0.3);
        }

        .modal-btn-no {
            background: #6c757d;
            color: white;
        }

        .modal-btn-no:hover {
            background: #5a6268;
            transform: scale(1.05);
        }

        /* Success Message Toast */
        .toast-message {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #28a745;
            color: white;
            padding: 15px 25px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(40,167,69,0.3);
            z-index: 10000;
            display: none;
            animation: slideInRight 0.3s ease;
        }

        @keyframes slideInRight {
            from {
                transform: translateX(100px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        .toast-message i {
            margin-right: 10px;
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
                        <a href="javascript:void(0);" class="btn logout-btn ml-2" onclick="showLogoutModal()">Logout</a>
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
                    <a href="javascript:void(0);" class="btn logout-btn" onclick="showLogoutModal()">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Logout Confirmation Modal -->
    <div id="logoutModal" class="modal-custom">
        <div class="modal-content-custom">
            <div class="modal-header-custom">
                <i class="fas fa-sign-out-alt"></i>
                <h3>Confirm Logout</h3>
            </div>
            <div class="modal-body-custom">
                <p>Are you sure you want to logout?</p>
            </div>
            <div class="modal-footer-custom">
                <button class="modal-btn modal-btn-yes" onclick="logout()">Yes, Logout</button>
                <button class="modal-btn modal-btn-no" onclick="hideLogoutModal()">No, Stay</button>
            </div>
        </div>
    </div>

    <!-- Success Toast Message -->
    <div id="successToast" class="toast-message">
        <i class="fas fa-check-circle"></i>
        <span>Successfully logged out! Your data has been saved.</span>
    </div>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Show logout confirmation modal
        function showLogoutModal() {
            document.getElementById('logoutModal').style.display = 'flex';
        }

        // Hide logout confirmation modal
        function hideLogoutModal() {
            document.getElementById('logoutModal').style.display = 'none';
        }

        // Show success toast message
        function showSuccessToast() {
            var toast = document.getElementById('successToast');
            toast.style.display = 'block';

            // Hide toast after 3 seconds
            setTimeout(function() {
                toast.style.display = 'none';
            }, 3000);
        }

        // Logout function - redirect to login.jsp after showing success message
        function logout() {
            // Hide the modal
            hideLogoutModal();

            // Show success message
            showSuccessToast();

            // Redirect to login page after 1.5 seconds
            setTimeout(function() {
                window.location.href = 'login.jsp';
            }, 1500);
        }

        // Close modal if user clicks outside
        window.onclick = function(event) {
            var modal = document.getElementById('logoutModal');
            if (event.target == modal) {
                hideLogoutModal();
            }
        }
    </script>
</body>
</html>