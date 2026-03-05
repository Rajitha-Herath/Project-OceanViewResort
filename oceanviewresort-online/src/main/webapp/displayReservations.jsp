<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservations Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            margin-top: 30px;
            margin-bottom: 30px;
            max-width: 1400px;  /* Increased to accommodate full table */
        }

        /* Main card container */
        .reservation-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 30px;
            margin: 20px auto;
            border: none;
        }

        /* Header styling */
        .card-header-custom {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 15px 15px 0 0;
            margin: -30px -30px 30px -30px;
            text-align: center;
        }

        .card-header-custom h1 {
            margin: 0;
            font-size: 2.2em;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .card-header-custom p {
            margin: 10px 0 0;
            opacity: 0.9;
            font-size: 1.1em;
        }

        /* Table styling */
        .table-responsive {
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 25px;
        }

        .table {
            margin: 0;
            width: 100%;
            background: white;
        }

        .table thead th {
            background: #343a40;
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.9em;
            letter-spacing: 0.5px;
            border: none;
            padding: 15px;
            white-space: nowrap;
        }

        .table tbody td {
            padding: 12px 15px;
            vertical-align: middle;
            border-bottom: 1px solid #dee2e6;
            color: #495057;
            font-size: 0.95em;
        }

        .table tbody tr:hover {
            background-color: #f8f9fa;
            transition: all 0.3s ease;
        }

        /* Status badge for room type */
        .room-type-badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 500;
            color: white;
        }

        .room-type-badge.deluxe {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .room-type-badge.ocean {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }

        .room-type-badge.family {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }

        .room-type-badge.standard {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
        }

        /* Stats section */
        .stats-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 25px 0;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
        }

        .stat-box {
            text-align: center;
            flex: 1;
        }

        .stat-label {
            font-size: 0.9em;
            color: #6c757d;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .stat-value {
            font-size: 1.8em;
            font-weight: 600;
            color: #343a40;
        }

        /* Button styling */
        .btn-custom {
            padding: 12px 40px;
            font-size: 1.1em;
            font-weight: 500;
            border-radius: 30px;
            border: none;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
            margin: 10px;
            min-width: 200px;
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

        /* Footer section */
        .card-footer-custom {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px dashed #dee2e6;
        }

        .last-updated {
            color: #6c757d;
            font-size: 0.9em;
            margin-top: 15px;
        }

        /* Empty state styling */
        .empty-state {
            text-align: center;
            padding: 50px;
            background: #f8f9fa;
            border-radius: 10px;
        }

        .empty-state i {
            font-size: 4em;
            color: #dee2e6;
            margin-bottom: 20px;
        }

        .empty-state h3 {
            color: #6c757d;
            margin-bottom: 15px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            .reservation-card {
                padding: 15px;
            }

            .card-header-custom {
                margin: -15px -15px 20px -15px;
                padding: 15px;
            }

            .card-header-custom h1 {
                font-size: 1.8em;
            }

            .stats-row {
                flex-direction: column;
                gap: 15px;
            }

            .btn-custom {
                display: block;
                width: 100%;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="reservation-card">
            <!-- Card Header -->
            <div class="card-header-custom">
                <h1>Reservations Details</h1>
                <p>View and manage all guest reservations</p>
            </div>

            <!-- Stats Row (optional) -->
            <div class="stats-row">
                <div class="stat-box">
                    <div class="stat-label">Total Reservations</div>
                    <div class="stat-value">
                        <c:out value="${resorts.size()}" default="0" />
                    </div>
                </div>
                <div class="stat-box">
                    <div class="stat-label">Available Rooms</div>
                    <div class="stat-value">25</div>
                </div>
                <div class="stat-box">
                    <div class="stat-label">Occupied</div>
                    <div class="stat-value">
                        <c:out value="${resorts.size()}" default="0" />
                    </div>
                </div>
            </div>

            <!-- Table Section -->
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Guest Name</th>
                            <th>Contact No</th>
                            <th>Address</th>
                            <th>Room Type</th>
                            <th>Check In</th>
                            <th>Check Out</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty resorts}">
                                <tr>
                                    <td colspan="7" class="empty-state">
                                        <i class="fa fa-calendar-times" aria-hidden="true"></i>
                                        <h3>No reservations found</h3>
                                        <p>Click "Add New Reservation" to create one.</p>
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="resort" items="${resorts}">
                                    <tr>
                                        <td><strong>#${resort.id}</strong></td>
                                        <td>${resort.guestName}</td>
                                        <td>${resort.contactNo}</td>
                                        <td>${resort.address}</td>
                                        <td>
                                            <span class="room-type-badge
                                                <c:choose>
                                                    <c:when test="${resort.roomType == 'Deluxe Room'}">deluxe</c:when>
                                                    <c:when test="${resort.roomType == 'Ocean View Room'}">ocean</c:when>
                                                    <c:when test="${resort.roomType == 'Family Room'}">family</c:when>
                                                    <c:otherwise>standard</c:otherwise>
                                                </c:choose>">
                                                ${resort.roomType}
                                            </span>
                                        </td>
                                        <td>${resort.checkInDate}</td>
                                        <td>${resort.checkOutDate}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <!-- Footer with Button -->
            <div class="card-footer-custom">
                <a href="resort?action=add" class="btn-custom">
                   Add New Reservation
                </a>
                <a href="Main.jsp" class="btn-custom btn-secondary-custom">
                   Back to Main
                </a>

                <div class="last-updated">
                    Last updated: <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <script>
        // Optional: Add any custom JavaScript here
        $(document).ready(function() {
            // Add tooltips if needed
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</body>
</html>