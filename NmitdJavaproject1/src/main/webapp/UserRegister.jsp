<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration | OCMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #6366f1;
            --primary-hover: #4f46e5;
            --bg-gradient: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            --card-bg: #ffffff;
            --text-main: #1f2937;
            --text-muted: #6b7280;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: var(--bg-gradient);
            min-height: 100vh;
            color: var(--text-main);
        }

        /* Navbar Styling */
        .navbar {
            background: rgba(31, 41, 55, 0.95) !important;
            backdrop-filter: blur(10px);
            padding: 1rem 0;
        }

        .navbar-brand {
            letter-spacing: 1px;
            font-size: 1.5rem;
        }

        /* Card Styling */
        .registration-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 60px 15px;
        }

        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            background: var(--card-bg);
            transition: transform 0.3s ease;
        }

        .card-header-custom {
            background: var(--primary-color);
            padding: 30px;
            text-align: center;
            color: white;
        }

        .card-header-custom h3 {
            margin: 0;
            font-weight: 700;
            font-size: 1.5rem;
        }

        .card-body {
            padding: 40px;
        }

        /* Form Controls */
        label {
            font-weight: 600;
            font-size: 0.875rem;
            margin-bottom: 8px;
            color: var(--text-main);
        }

        .form-control {
            padding: 12px 16px;
            border-radius: 12px;
            border: 1px solid #e5e7eb;
            background-color: #f9fafb;
            font-size: 0.95rem;
            transition: all 0.2s ease;
        }

        .form-control:focus {
            background-color: #fff;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
            outline: none;
        }

        textarea.form-control {
            min-height: 100px;
        }

        /* Buttons */
        .btn-primary {
            background-color: var(--primary-color);
            border: none;
            padding: 12px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            margin-top: 10px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.3);
        }

        /* Alert Styling */
        .alert {
            border-radius: 12px;
            border: none;
            font-weight: 500;
        }

        /* Links */
        .login-link {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s;
        }

        .login-link:hover {
            color: var(--primary-hover);
            text-decoration: underline;
        }

        /* Animation */
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card {
            animation: fadeInUp 0.6s ease-out;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
  <div class="container">
    <a class="navbar-brand fw-bold" href="#">OCMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navBar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navBar">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="UserLogin.jsp">Login</a></li>
        <li class="nav-item"><a class="nav-link active" href="UserRegister.jsp">Register</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container registration-container">
    <div class="card mx-auto" style="max-width: 550px; width: 100%;">
        <div class="card-header-custom">
            <h3>Create Account</h3>
            <p class="mb-0 opacity-75">Join our community today</p>
        </div>

        <div class="card-body">
            <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger text-center">
                    Registration failed. Please check your details and try again.
                </div>
            <% } %>

            <form action="UserRegisterServlet" method="post">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Full Name</label>
                        <input type="text" name="name" class="form-control" placeholder="John Doe" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Phone Number</label>
                        <input type="text" name="phone" class="form-control" placeholder="+1 234..." required>
                    </div>
                </div>

                <div class="mb-3">
                    <label>Email Address</label>
                    <input type="email" name="email" class="form-control" placeholder="name@example.com" required>
                </div>

                <div class="mb-3">
                    <label>Residential Address</label>
                    <textarea name="address" class="form-control" placeholder="Enter your full address" required></textarea>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" placeholder="••••••••" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Confirm Password</label>
                        <input type="password" name="confirmPassword" class="form-control" placeholder="••••••••" required>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary w-100 shadow-sm">
                    Create Account
                </button>
            </form>

            <div class="text-center mt-4">
                <p class="text-muted small">Already have an account? <a href="UserLogin.jsp" class="login-link">Sign In</a></p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>