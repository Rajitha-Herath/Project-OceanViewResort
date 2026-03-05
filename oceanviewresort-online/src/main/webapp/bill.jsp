<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bill Summary - Ocean View Resort</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            margin-top: 20px;
            margin-bottom: 20px;
            max-width: 900px;
        }

        /* Main card container - more compact */
        .bill-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            padding: 20px;
            margin: 10px auto;
            border: none;
        }

        /* Card Header with gradient - smaller */
        .card-header-custom {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px 20px;
            border-radius: 12px 12px 0 0;
            margin: -20px -20px 20px -20px;
            text-align: center;
        }

        .card-header-custom h1 {
            margin: 0;
            font-size: 1.8em;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .card-header-custom p {
            margin: 5px 0 0;
            opacity: 0.9;
            font-size: 0.9em;
        }

        /* Dropdown section styling - more compact */
        .dropdown-section {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            border: 1px solid #dee2e6;
        }

        .dropdown-section label {
            color: #495057;
            font-weight: 600;
            font-size: 0.9em;
        }

        /* Fix for dropdown visibility */
        .dropdown-section select {
            border-radius: 20px;
            padding: 8px 15px;
            border: 2px solid #dee2e6;
            font-size: 0.95em;
            background-color: white;  /* Changed from gradient to solid white */
            color: #333;              /* Dark text color for better visibility */
            font-weight: 500;
            cursor: pointer;
            appearance: none;         /* Remove default styling */
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23667eea' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><polyline points='6 9 12 15 18 9'/></svg>");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 16px;
        }

        .dropdown-section select option {
            background-color: white;
            color: #333;
            padding: 10px;
            font-size: 0.95em;
        }

        .dropdown-section select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        /* Hover effect */
        .dropdown-section select:hover {
            border-color: #764ba2;
        }

        /* Style for the selected option */
        .dropdown-section select option:checked {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        /* For the dropdown when opened */
        .dropdown-section select:active,
        .dropdown-section select:focus-within {
            border-color: #667eea;
        }

        /* Table styling - more compact */
        .table-responsive {
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 15px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .table {
            margin: 0;
            width: 100%;
            background: white;
            font-size: 0.9em;
        }

        .table th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            font-weight: 500;
            font-size: 0.9em;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border: none;
            padding: 10px;
        }

        .table td {
            padding: 10px;
            vertical-align: middle;
            border: 1px solid #dee2e6;
            color: #495057;
        }

        .table td:first-child {
            font-weight: 600;
            background-color: #f8f9fa;
            width: 40%;
        }

        .table td:last-child {
            width: 60%;
            font-size: 1em;
        }

        /* Amount styling - smaller */
        .total-amount {
            font-size: 1.4em;
            color: #28a745;
            font-weight: bold;
        }

        .room-rate, .stay-days {
            font-weight: 600;
            font-size: 1em;
        }

        .room-rate {
            color: #667eea;
        }

        .stay-days {
            color: #764ba2;
        }

        /* Print button styling - smaller */
        .print-btn {
            margin-top: 15px;
            padding: 8px 35px;
            font-size: 1em;
            font-weight: 500;
            border-radius: 25px;
            border: none;
            background: linear-gradient(135deg, #17a2b8 0%, #138496 100%);
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 3px 10px rgba(23, 162, 184, 0.3);
        }

        .print-btn i {
            margin-right: 6px;
            font-size: 0.9em;
        }

        /* Bill footer - smaller */
        .bill-footer {
            margin-top: 20px;
            padding: 12px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 10px;
            text-align: center;
            font-size: 0.85em;
            color: #6c757d;
            border: 1px solid #dee2e6;
        }

        /* Action buttons - smaller */
        .action-buttons {
            margin-top: 25px;
            margin-bottom: 10px;
            text-align: center;
        }

        .btn-custom {
            padding: 8px 20px;
            font-size: 0.95em;
            font-weight: 500;
            border-radius: 25px;
            border: none;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 3px 10px rgba(102, 126, 234, 0.3);
            margin: 5px 8px;
            min-width: 160px;
            display: inline-block;
            text-decoration: none;
        }

        .btn-custom i {
            margin-right: 5px;
            font-size: 0.9em;
        }

        .btn-secondary-custom {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            box-shadow: 0 3px 10px rgba(108, 117, 125, 0.3);
        }

        /* Alert styling - smaller */
        .alert-custom {
            border-radius: 10px;
            padding: 12px;
            border: none;
            font-size: 0.9em;
        }

        /* Stats row - optional, smaller */
        .stats-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 15px 0;
            padding: 12px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 10px;
        }

        .stat-box {
            text-align: center;
            flex: 1;
        }

        .stat-label {
            font-size: 0.8em;
            color: #6c757d;
            text-transform: uppercase;
            letter-spacing: 0.3px;
        }

        .stat-value {
            font-size: 1.2em;
            font-weight: 600;
            color: #667eea;
        }

        /* Badge styling */
        .badge-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 5px 10px;
            font-size: 0.85em;
        }

        /* Print styles */
        @media print {
            body * {
                visibility: hidden;
            }

            .print-area, .print-area * {
                visibility: visible;
            }

            .print-area {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                margin: 0;
                padding: 15px;
            }

            .table {
                font-size: 0.9em;
            }

            .dropdown-section,
            .action-buttons,
            .print-btn,
            .btn-custom,
            .alert-custom,
            .bill-footer,
            .stats-row {
                display: none !important;
            }

            .print-header {
                display: block !important;
                text-align: center;
                margin-bottom: 20px;
            }

            .print-header h1 {
                font-size: 22px;
                font-weight: bold;
            }

            .print-header p {
                font-size: 14px;
            }

            .screen-header {
                display: none !important;
            }
        }

        .print-header {
            display: none;
        }

        .print-header h1 {
            margin: 0;
            font-size: 22px;
        }

        .print-header p {
            margin: 3px 0 0;
            font-size: 14px;
            color: #666;
        }

        .bottom-spacer {
            height: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="bill-card">
            <!-- Card Header with gradient - smaller -->
            <div class="card-header-custom screen-header">
                <h1><i class="fas fa-file-invoice"></i> Bill Summary</h1>
                <p>Generate and print guest bills</p>
            </div>

            <!-- Print Header (visible only in print) -->
            <div class="print-header">
                <h1>Ocean View Resort</h1>
                <p>Bill Summary - Official Receipt</p>
                <hr style="margin: 5px 0;">
            </div>

            <!-- Dropdown Section (visible only on screen) -->
            <div class="dropdown-section">
                <form action="bill" method="get" class="form-inline justify-content-center">
                    <label for="reservationId" class="mr-2 font-weight-bold">
                        <i class="fas fa-search"></i> Select:
                    </label>
                    <select name="reservationId" id="reservationId" class="form-control mr-2" style="width: 300px;" onchange="this.form.submit()">
                        <option value="">-- Choose Reservation --</option>

                        <c:forEach var="res" items="${reservations}">
                            <option value="${res.id}" ${param.reservationId == res.id ? 'selected' : ''}>
                                ID: ${res.id} - ${res.guestName} (${res.roomType})
                            </option>
                        </c:forEach>
                    </select>
                    <noscript>
                        <button type="submit" class="btn btn-primary btn-sm">View</button>
                    </noscript>
                </form>

                <%-- Show message if no reservations --%>
                <c:if test="${empty reservations}">
                    <div class="alert alert-warning mt-2 text-center alert-custom">
                        <i class="fas fa-exclamation-triangle"></i>
                        <strong>No reservations found!</strong>
                    </div>
                </c:if>
            </div>

            <%-- Display reservation details if selected --%>
            <c:if test="${not empty reservation}">
                <%-- Calculate stayed days --%>
                <fmt:parseDate value="${reservation.checkInDate}" pattern="yyyy-MM-dd" var="parsedCheckIn" />
                <fmt:parseDate value="${reservation.checkOutDate}" pattern="yyyy-MM-dd" var="parsedCheckOut" />

                <c:set var="checkInMillis" value="${parsedCheckIn.time}" />
                <c:set var="checkOutMillis" value="${parsedCheckOut.time}" />
                <c:set var="daysDiff" value="${(checkOutMillis - checkInMillis) / (1000 * 60 * 60 * 24)}" />

                <%-- Room rates based on room type --%>
                <c:set var="roomRate" value="0" />
                <c:choose>
                    <c:when test="${reservation.roomType == 'Deluxe Room'}">
                        <c:set var="roomRate" value="15000" />
                    </c:when>
                    <c:when test="${reservation.roomType == 'Ocean View Room'}">
                        <c:set var="roomRate" value="20000" />
                    </c:when>
                    <c:when test="${reservation.roomType == 'Family Room'}">
                        <c:set var="roomRate" value="25000" />
                    </c:when>
                    <c:when test="${reservation.roomType == 'Standard Room'}">
                        <c:set var="roomRate" value="10000" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="roomRate" value="12000" />
                    </c:otherwise>
                </c:choose>

                <%-- Calculate totals --%>
                <c:set var="totalAmount" value="${daysDiff * roomRate}" />
                <c:set var="serviceCharge" value="${totalAmount * 0.10}" />
                <c:set var="tax" value="${totalAmount * 0.05}" />
                <c:set var="grandTotal" value="${totalAmount + serviceCharge + tax}" />

                <!-- Stats Row - compact summary -->
                <div class="stats-row">
                    <div class="stat-box">
                        <div class="stat-label">Reservation</div>
                        <div class="stat-value">#${reservation.id}</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-label">Guest</div>
                        <div class="stat-value">${reservation.guestName}</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-label">Room</div>
                        <div class="stat-value">${reservation.roomType}</div>
                    </div>
                </div>

                <!-- This div will be the only thing printed -->
                <div class="print-area">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan="2" class="text-center">
                                        <i class="fas fa-hotel"></i> Reservation Details
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><i class="fas fa-hashtag"></i> Reservation ID</td>
                                    <td><strong>#${reservation.id}</strong></td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-user"></i> Guest Name</td>
                                    <td>${reservation.guestName}</td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-map-marker-alt"></i> Address</td>
                                    <td>${reservation.address}</td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-phone"></i> Contact No</td>
                                    <td>${reservation.contactNo}</td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-bed"></i> Room Type</td>
                                    <td><span class="badge badge-primary">${reservation.roomType}</span></td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-calendar-check"></i> Check In</td>
                                    <td>${reservation.checkInDate}</td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-calendar-times"></i> Check Out</td>
                                    <td>${reservation.checkOutDate}</td>
                                </tr>

                                <tr class="bg-light">
                                    <th colspan="2" class="text-center">
                                        <i class="fas fa-calculator"></i> Charge Calculations
                                    </th>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-clock"></i> Days Stayed</td>
                                    <td class="stay-days"><fmt:formatNumber value="${daysDiff}" type="number" pattern="#"/> days</td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-tag"></i> Rate per Night</td>
                                    <td class="room-rate">LKR <fmt:formatNumber value="${roomRate}" type="number" pattern="#,###"/></td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-bed"></i> Room Charges</td>
                                    <td>LKR <fmt:formatNumber value="${totalAmount}" type="number" pattern="#,###.00"/></td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-concierge-bell"></i> Service (10%)</td>
                                    <td>LKR <fmt:formatNumber value="${serviceCharge}" type="number" pattern="#,###.00"/></td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-file-invoice"></i> Tax (5%)</td>
                                    <td>LKR <fmt:formatNumber value="${tax}" type="number" pattern="#,###.00"/></td>
                                </tr>
                                <tr class="table-success">
                                    <td><strong> GRAND TOTAL</strong></td>
                                    <td class="total-amount">LKR <fmt:formatNumber value="${grandTotal}" type="number" pattern="#,###.00"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Print footer -->
                    <div class="print-footer" style="text-align: center; margin-top: 15px; font-size: 0.85em;">
                        <p><strong>Thank you for choosing Ocean View Resort!</strong></p>
                        <p>Bill generated on: <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %></p>
                    </div>
                </div>

                <!-- Print button -->
                <div class="text-center">
                    <button onclick="window.print()" class="print-btn">
                        <i class="fas fa-print"></i> Print Bill
                    </button>
                </div>
            </c:if>

            <c:if test="${empty reservation and not empty param.reservationId}">
                <div class="alert alert-danger text-center alert-custom">
                    <i class="fas fa-exclamation-circle"></i>
                    <strong>Reservation not found!</strong> ID: ${param.reservationId}
                </div>
            </c:if>

            <c:if test="${empty param.reservationId}">
                <div class="alert alert-info text-center alert-custom">
                    <i class="fas fa-hand-point-up"></i>
                    <strong>Select a reservation</strong> from the dropdown
                </div>
            </c:if>

            <!-- Action buttons - compact -->
            <div class="action-buttons">
                <a href="resort?action=add" class="btn-custom">
                    <i class="fas fa-plus-circle"></i> Add New Reservations
                </a>
                <a href="resort?action=list" class="btn-custom">
                    <i class="fas fa-list"></i> View All Reservations
                </a>
                <a href="Main.jsp" class="btn-custom btn-secondary-custom">
                    <i class="fas fa-arrow-left"></i> Back to Main Page
                </a>
            </div>

            <div class="bottom-spacer"></div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function previewPrint() {
            window.print();
        }
    </script>
</body>
</html>