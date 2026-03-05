<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #f8f9fa;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .login-container {
            max-width: 450px;
            width: 90%;
            margin: 20px auto;
        }

        .login-card {
            background: linear-gradient(135deg, #448AFF 0%, #764ba2 100%);
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            padding: 40px 30px;
            color: white !important;
            border-radius: 15px;
        }

        h2 {
            color: #333;
            font-weight: 600;
            margin-bottom: 30px;
            font-size: 28px;
            color: white !important;
        }
        .form-control {
            height: 50px;
            border: 2px solid #e1e1e1;
            border-radius: 8px;
            padding: 10px 15px;
            font-size: 15px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102,126,234,0.1);
        }

        .forgot-password {
            text-align: right;
            margin-bottom: 20px;
        }

        /* Forgot password link in white */
        .forgot-password a {
            color: white !important;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .forgot-password a:hover {
            text-decoration: underline;
            opacity: 0.9;
        }

        .login-btn {
            color: white;
            border-radius: 8px;
            padding: 14px 30px;
            font-weight: 600;
            font-size: 16px;
            width: 100%;
            transition: all 0.3s ease;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255,255,255,0.2);
            border: 2px solid white;
            margin-right: 20px;
        }

        .login-btn:hover {
            background: rgba(255,255,255,0.3);
            transform: scale(1.05);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(68,138,255,0.3);
        }

        .login-btn:disabled {
            opacity: 0.7;
            cursor: not-allowed;
            transform: none;
        }

        .action-buttons {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }

        .action-buttons .reset-btn {
            margin-bottom: 0;
            flex: 0 0 auto;
        }

        .action-buttons .forgot-password {
            flex: 1;
            margin-bottom: 0;
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }

        hr {
            margin: 25px 0;
            border-top: 2px solid #e1e1e1;
        }

        .required-field {
            color: #dc3545;
            font-size: 14px;
            margin-left: 3px;
        }

        .alert {
            border-radius: 8px;
            padding: 15px 20px;
            margin-bottom: 25px;
            border: none;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border-left: 4px solid #28a745;
        }

        .alert-danger {
            background: #f8d7da;
            color: #721c24;
            border-left: 4px solid #dc3545;
        }

        /* Custom alert for forgot password message */
        .alert-info-custom {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border-left: 4px solid white;
            backdrop-filter: blur(5px);
        }

        .fade-out {
            animation: fadeOut 0.5s ease-in-out forwards;
            animation-delay: 3s;
        }

        @keyframes fadeOut {
            from {
                opacity: 1;
            }
            to {
                opacity: 0;
                display: none;
            }
        }

        .loading-spinner {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(255,255,255,.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
            margin-right: 10px;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        .btn-loading {
            opacity: 0.8;
            cursor: wait;
        }

    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-card">

            <h2>Welcome to Login Page</h2>

            <%
                // Get form parameters
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String message = "";
                String messageType = "";

                // Check if form is submitted
                if (email != null && password != null) {
                    // Hardcoded credentials (you can modify these)
                    String validEmail = "rajitha@gmail.com";
                    String validPassword = "qaz123";

                    if (email.equals(validEmail) && password.equals(validPassword)) {
                        // Set session attributes
                        session.setAttribute("userEmail", email);
                        session.setAttribute("userName", email.split("@")[0]); // Extract username from email
                        session.setAttribute("loggedIn", true);
                        session.setAttribute("loginTime", new java.util.Date().toString());

                        // Redirect to main.jsp
                        response.sendRedirect("Main.jsp");
                        return; // Important: Stop further processing
                    } else {
                        message = "Check your user email and password. Please try again.";
                        messageType = "danger";
                    }
                }
            %>

            <%-- Display message if exists --%>
            <% if (!message.isEmpty()) { %>
                <div class="alert alert-<%= messageType %> fade-out" role="alert">
                    <%= message %>
                </div>
            <% } %>

            <%-- Forgot password message container --%>
            <div id="forgotPasswordMessage" style="display: none;" class="alert alert-info-custom" role="alert">
                <i class="fas fa-info-circle"></i> Please contact the administrator to reset your password.
            </div>

            <form action="#" method="post" id="loginForm">
                <div class="form-group">
                    <label>User Email <span class="required-field">*</span></label>
                    <input type="email"
                           class="form-control"
                           name="email"
                           placeholder="Enter your email"
                           value="<%= email != null && messageType.equals("danger") ? email : "" %>"
                           required>
                </div>

                <div class="form-group">
                    <label>Password <span class="required-field">*</span></label>
                    <input type="password"
                           class="form-control"
                           name="password"
                           placeholder="Enter your password"
                           required>
                </div>

                <div class="action-buttons">
                    <div class="forgot-password">
                        <a href="#" onclick="showForgotPasswordMessage(); return false;">Forgot Password ?</a>
                    </div>
                </div>

                <button type="submit" class="login-btn" id="loginBtn">
                    <span class="btn-text">LOGIN</span>
                    <span class="loading-spinner" style="display: none;"></span>
                </button>
            </form>

            <div class="register-link text-center mt-3" style="font-size: 13px; color: #999;">
                Demo credentials: rajitha@gmail.com / qaz123
            </div>
        </div>
    </div>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- Optional Bootstrap JS for better interactivity -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Auto-hide alerts after 8 seconds
        setTimeout(function() {
            var alerts = document.getElementsByClassName('alert');
            for(var i = 0; i < alerts.length; i++) {
                alerts[i].style.display = 'none';
            }
        }, 8000);

        // Show loading spinner on form submit
        document.getElementById('loginForm').addEventListener('submit', function() {
            var btn = document.getElementById('loginBtn');
            var btnText = btn.querySelector('.btn-text');
            var spinner = btn.querySelector('.loading-spinner');

            btnText.style.display = 'none';
            spinner.style.display = 'inline-block';
            btn.classList.add('btn-loading');
            btn.disabled = true;
        });

        // Function to show forgot password message
        function showForgotPasswordMessage() {
            var messageDiv = document.getElementById('forgotPasswordMessage');
            messageDiv.style.display = 'block';

            // Auto hide after 5 seconds
            setTimeout(function() {
                messageDiv.style.display = 'none';
            }, 5000);
        }
    </script>
</body>
</html>