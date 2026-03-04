<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bill Summary</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
            max-width: 800px;
        }
        .table {
            margin: auto;
            width: 100%;
        }
        .table td {
            padding: 12px;
            vertical-align: middle;
        }
        .table td:first-child {
            font-weight: bold;
            background-color: #f8f9fa;
            width: 40%;
        }
        .table td:last-child {
            width: 60%;
        }
        .btn-primary {
            margin-top: 20px;
            padding: 10px 30px;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            border-radius: 5px 5px 0 0;
            margin-bottom: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center header">Bill Summary</h1>
        
        <c:if test="${not empty product}">
            <table class="table table-bordered">
                <tr>
                    <td>Reservation ID</td>
                    <td>${product.productId}</td>
                </tr>
                <tr>
                    <td>Guest Name</td>
                    <td>${product.name}</td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>${product.address}</td>
                </tr>
                <tr>
                    <td>Contact No</td>
                    <td>${product.contact}</td>
                </tr>
                <tr>
                    <td>Room Type</td>
                    <td>${product.roomtype}</td>
                </tr>
                <tr>
                    <td>Check In Date</td>
                    <td>${product.indate}</td>
                </tr>
                <tr>
                    <td>Check Out Date</td>
                    <td>${product.outdate}</td>
                </tr>
                <tr>
                    <td>Stayed Days</td>
                    <td>${product.outdate}</td>
                </tr>
                <tr>
                    <td>Total Amount</td>
                    <td>${product.outdate}</td>
                </tr>
            </table>
        </c:if>
        
        <c:if test="${empty product}">
            <div class="alert alert-info text-center">
                No reservation details available.
            </div>
        </c:if>
        
        <div class="text-center">
            <a href="product?action=add" class="btn btn-primary">Add New Reservation</a>
            <a href="product?action=list" class="btn btn-secondary ml-2">View All Reservations</a>
        </div>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>