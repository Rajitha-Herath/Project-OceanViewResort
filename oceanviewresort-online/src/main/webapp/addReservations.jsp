<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Reservations</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
            max-width: 600px;
            background: linear-gradient(135deg, #448AFF 0%, #764ba2 100%);
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            padding: 30px;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-primary {
            width: 100%;
            background: rgba(255,255,255,0.2);
            border: 2px solid white;
        }
        .btn:hover {
            background: rgba(255,255,255,0.3);
            transform: scale(1.05);
        }
        .error-message {
            color: #dc3545;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Add Reservations</h1>
        <!-- Updated form action -->
        <form action="${pageContext.request.contextPath}/resort?action=add" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="name">Guest Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="contact">Contact No:</label>
                <input type="tel" class="form-control" id="contact" name="contact"  pattern="[0-9]{10}" maxlength="10" title="Please enter exactly 10 digits" required>
                <div class="error-message" id="contactError">Contact number must be exactly 10 digits</div>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>

            <div class="form-group">
                <label for="roomtype">Room Type:</label>
                <select class="form-control" id="roomtype" name="roomtype" required>
                    <option value="">Select Room Type</option>
                    <option value="Deluxe Room">Deluxe Room</option>
                    <option value="Ocean View Room">Ocean View Room</option>
                    <option value="Family Room">Family Room</option>
                    <option value="Standard Room">Standard Room</option>
                </select>
            </div>
            <div class="form-group">
                <label for="indate">Check In Date:</label>
                <input type="date" class="form-control" id="indate" name="indate" 
                       value="2026-03-04" required>
            </div>
            <div class="form-group">
                <label for="outdate">Check Out Date:</label>
                <input type="date" class="form-control" id="outdate" name="outdate" 
                       value="2026-03-05" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Reservation</button>
            <span class="navbar-toggler-icon"></span>
        </form>
    </div>

    <!-- Your existing scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        // Your existing validation scripts
        document.getElementById('contact').addEventListener('input', function(e) {
            var contact = this.value;
            var errorElement = document.getElementById('contactError');
            
            this.value = this.value.replace(/[^0-9]/g, '');
            
            if (this.value.length === 10) {
                errorElement.style.display = 'none';
                this.setCustomValidity('');
            } else {
                errorElement.style.display = 'block';
                this.setCustomValidity('Contact number must be exactly 10 digits');
            }
        });
        
        function validateForm() {
            var contact = document.getElementById('contact').value;
            if (contact.length !== 10) {
                alert('Contact number must be exactly 10 digits');
                return false;
            }
            return true;
        }
        
        var today = new Date().toISOString().split('T')[0];
        document.getElementById('indate').setAttribute('min', today);
        
        document.getElementById('indate').addEventListener('change', function() {
            var checkIn = this.value;
            document.getElementById('outdate').setAttribute('min', checkIn);
            
            var checkOut = document.getElementById('outdate').value;
            if (checkOut < checkIn) {
                document.getElementById('outdate').value = checkIn;
            }
        });
    </script>
</body>
</html>