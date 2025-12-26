<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login | OCMS</title>

<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/* ===== NAVBAR (SAME AS HOMEPAGE) ===== */
.navbar {
    background: rgba(31, 41, 55, 0.95) !important;
    backdrop-filter: blur(10px);
    padding: 1rem 0;
}

.login-pill {
    background: #ffffff;
    color: #1f2937 !important;
    padding: 8px 22px;
    border-radius: 90px;
    font-weight: 600;
}

.register-pill {
    background: #4f46e5;
    color: #ffffff !important;
    padding: 8px 22px;
    border-radius: 999px;
    font-weight: 600;
    text-decoration: none;
}

.login-dropdown {
    border-radius: 14px;
    border: 1px solid #e5e7eb;
    padding: 6px;
}

.login-dropdown .dropdown-item:hover {
    background: #eef2ff;
}

/* ===== PAGE ===== */
:root {
    --primary-color: #6366f1;
    --primary-hover: #4f46e5;
}

body {
    font-family: 'Plus Jakarta Sans', sans-serif;
    background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

.page-content {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 15px;
}

/* ===== LOGIN CARD ===== */
.auth-card {
    background: #ffffff;
    max-width: 450px;
    width: 100%;
    padding: 50px 40px;
    border-radius: 28px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.1);
}

.auth-card h2 {
    text-align: center;
    font-weight: 700;
    margin-bottom: 8px;
}

.auth-card p.subtitle {
    text-align: center;
    color: #6b7280;
    margin-bottom: 35px;
}

/* ===== FORM ===== */
label {
    font-weight: 600;
    font-size: 0.875rem;
    margin-bottom: 8px;
    display: block;
}

.form-control {
    padding: 14px 16px;
    border-radius: 14px;
    background: #f1f5f9;
}

.form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 4px rgba(99,102,241,0.15);
}

.btn-primary {
    background: var(--primary-color);
    border: none;
    padding: 16px;
    border-radius: 14px;
    font-weight: 700;
}

.btn-primary:hover {
    background: var(--primary-hover);
    transform: translateY(-2px);
}

/* ===== FOOTER ===== */
.app-footer {
    text-align: center;
    padding: 20px;
    font-size: 0.85rem;
    color: #6b7280;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">OCMS</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navBar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navBar">
            <ul class="navbar-nav ms-auto align-items-center gap-2">

                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle login-pill" href="#" data-bs-toggle="dropdown">
                        Login
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end login-dropdown shadow">
                        <li><a class="dropdown-item" href="UserLogin.jsp">👤 User Login</a></li>
                        <li><a class="dropdown-item text-danger" href="AdminLogin.jsp">🛡️ Admin Login</a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="UserRegister.jsp" class="register-pill">Register</a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<!-- ADMIN LOGIN -->
<main class="page-content">
    <div class="auth-card">
        <h2>Admin Login</h2>
        <p class="subtitle">Administrator access only</p>

        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger text-center mb-4">
                Invalid Username or Password
            </div>
        <% } %>

        <form action="AdminLoginServlet" method="post">

            <div class="mb-3">
                <label>Username</label>
                <input type="text" name="username" class="form-control"
                       placeholder="Enter admin username" required>
            </div>

            <div class="mb-4">
                <label>Password</label>
                <input type="password" name="password" class="form-control"
                       placeholder="••••••••" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">
                Login
            </button>

        </form>
    </div>
</main>

<footer class="app-footer">
    © 2025 Online Complaint Management System
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
