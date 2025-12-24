
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login | OCMS</title>
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
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background: rgba(31, 41, 55, 0.95) !important;
            backdrop-filter: blur(10px);
            padding: 1rem 0;
        }

        .page-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 15px;
        }

        .auth-card {
            background: var(--card-bg);
            width: 100%;
            max-width: 450px;
            padding: 50px 40px;
            border-radius: 28px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.6s ease-out;
        }

        .auth-card h2 {
            font-weight: 700;
            color: #111827;
            text-align: center;
            margin-bottom: 8px;
        }

        .auth-card p.subtitle {
            color: var(--text-muted);
            text-align: center;
            margin-bottom: 35px;
            font-size: 0.95rem;
        }

        label {
            font-weight: 600;
            font-size: 0.875rem;
            margin-bottom: 8px;
            display: block;
            color: #374151;
        }

        .form-control {
            padding: 14px 16px;
            border-radius: 14px;
            border: 1px solid #e5e7eb;
            background-color: #f1f5f9; /* Soft light blue/grey like your image */
            transition: all 0.2s ease;
        }

        .form-control:focus {
            background-color: #fff;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: none;
            padding: 16px;
            border-radius: 14px;
            font-weight: 700;
            margin-top: 10px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
        }

        .login-link {
            color: var(--primary-color);
            font-weight: 600;
            text-decoration: none;
        }

        .app-footer {
            text-align: center;
            padding: 20px;
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark shadow">
  <div class="container">
    <a class="navbar-brand fw-bold" href="#">OCMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navBar">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navBar">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="homepage.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link active" href="UserLogin.jsp">Login</a></li>
        <li class="nav-item"><a class="nav-link" href="UserRegister.jsp">Register</a></li>
      </ul>
    </div>
  </div>
</nav>

<main class="page-content">
    <div class="auth-card">
        <h2>Welcome Back</h2>
        <p class="subtitle">Login to manage your complaints</p>

        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger text-center mb-4">Invalid Email or Password</div>
        <% } %>

        <% if (request.getParameter("success") != null) { %>
            <div class="alert alert-success text-center mb-4">Registration successful! Please login.</div>
        <% } %>

        <form action="UserLoginServlet" method="post">
            <div class="mb-3">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
            </div>

            <div class="mb-4">
                <div class="d-flex justify-content-between align-items-center">
                    <label for="password" class="mb-0">Password</label>
                    <a href="#" class="login-link small" style="font-weight: 400;">Forgot?</a>
                </div>
                <input type="password" id="password" name="password" class="form-control mt-2" placeholder="••••••••" required>
            </div>

            <button type="submit" class="btn btn-primary w-100 shadow-sm">
                Sign In
            </button>

            <div class="text-center mt-4">
                <span class="text-muted small">Don't have an account?</span>
                <a href="UserRegister.jsp" class="login-link small">Register here</a>
            </div>
        </form>
    </div>
</main>

<footer class="app-footer">
    &copy; 2025 Online Complaint Management System. All rights reserved.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>