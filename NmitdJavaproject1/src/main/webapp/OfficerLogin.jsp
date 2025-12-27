<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Officer Login | OCMS</title>

<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
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

body{
    font-family:'Plus Jakarta Sans',sans-serif;
    background:linear-gradient(135deg,#eef2ff,#f8fafc);
    min-height:100vh;
}

/* Navbar */
.navbar{
    background:rgba(17,24,39,.95);
    backdrop-filter:blur(10px);
    padding:1rem 0;
}

/* Card */
.page-content{
    padding-top:120px;
    display:flex;
    justify-content:center;
}

.auth-card{
    background:#fff;
    width:100%;
    max-width:420px;
    padding:40px;
    border-radius:26px;
    box-shadow:0 25px 50px -15px rgba(0,0,0,.12);
}

.auth-card h3{
    text-align:center;
    font-weight:700;
    margin-bottom:25px;
}

label{
    font-weight:600;
    font-size:.9rem;
}

.form-control{
    padding:14px;
    border-radius:14px;
    background:#f1f5f9;
}

.form-control:focus{
    background:#fff;
    border-color:#6366f1;
    box-shadow:0 0 0 4px rgba(99,102,241,.1);
}

.btn-primary{
    background:#6366f1;
    border:none;
    padding:14px;
    border-radius:14px;
    font-weight:600;
}

.btn-primary:hover{
    background:#4f46e5;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="homepage.jsp">OCMS</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navBar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navBar">
            <ul class="navbar-nav ms-auto align-items-center gap-2">

                <li class="nav-item">
                    <a class="nav-link" href="homepage.jsp">Home</a>
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

             

            </ul>
        </div>
    </div>
</nav>

<!-- CONTENT -->
<div class="page-content">
  <div class="auth-card">

    <h3>Officer Login</h3>

    <% if(request.getParameter("error")!=null){ %>
        <div class="alert alert-danger text-center">
            Invalid Username or Password
        </div>
    <% } %>

    <form action="OfficerLoginServlet" method="post">
        <label>Username</label>
        <input type="text" name="username" class="form-control mb-3" required>

        <label>Password</label>
        <input type="password" name="password" class="form-control mb-4" required>

        <button class="btn btn-primary w-100">
            Login
        </button>
    </form>

  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
