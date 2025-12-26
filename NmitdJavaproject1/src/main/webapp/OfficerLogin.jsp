<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Officer Login | OCMS</title>

<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
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
<nav class="navbar navbar-expand-lg navbar-dark fixed-top shadow">
  <div class="container">
    <a class="navbar-brand fw-bold" href="index.jsp">OCMS</a>
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
