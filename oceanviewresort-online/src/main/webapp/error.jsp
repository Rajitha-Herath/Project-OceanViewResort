<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error - Ocean View Resort</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="alert alert-danger">
            <h1>Error Occurred</h1>
            <p><strong>Error Details:</strong> ${errorMessage}</p>
            <%-- Display stack trace for debugging (remove in production) --%>
            <% if (request.getAttribute("errorMessage") == null) { %>
                <p>No error message available</p>
            <% } %>
            <a href="addReservations.jsp" class="btn btn-primary">Back to Reservations</a>
        </div>
    </div>
</body>
</html>