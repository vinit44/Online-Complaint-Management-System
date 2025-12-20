<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Login | Complaint Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
/* SAME THEME AS REGISTER PAGE */
:root {
    --primary: #2563eb;
    --primary-dark: #1e40af;
    --background: #f4f6f9;
    --card-bg: #ffffff;
    --navbar-bg: #111827;
    --footer-bg: #111827;
    --text-main: #111827;
    --text-muted: #6b7280;
    --border: #e5e7eb;
}

html, body {
    height: 100%;
    margin: 0;
}

body {
    font-family: 'Poppins', sans-serif;
    background: var(--background);
    display: flex;
    flex-direction: column;
}

.navbar {
    background: var(--navbar-bg) !important;
}

.navbar-brand {
    font-size: 1.4rem;
    font-weight: 600;
    color: #fff !important;
}

.nav-link {
    color: #e5e7eb !important;
    font-weight: 500;
    margin-left: 18px;
}

.nav-link.active {
    color: #ffffff !important;
}

.page-content {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding-top: 90px;
}

.login-card {
    background: var(--card-bg);
    border-radius: 12px;
    padding: 32px;
    width: 100%;
    max-width: 420px;
    border: 1px solid var(--border);
}

.login-card h3 {
    text-align: center;
    font-weight: 600;
}

.login-card p {
    text-align: center;
    color: var(--text-muted);
    font-size: 0.95rem;
    margin-bottom: 24px;
}

.form-control {
    border-radius: 6px;
    border: 1px solid var(--border);
}

.btn-primary {
    background: var(--primary);
    border: none;
    width: 100%;
    padding: 10px;
}

.btn-primary:hover {
    background: var(--primary-dark);
}

.app-footer {
    background: var(--footer-bg);
    color: #9ca3af;
    text-align: center;
    padding: 16px 0;
    font-size: 0.9rem;
}
</style>
</head>

<body>

<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid px-4">
        <a class="navbar-brand" href="homepage.jsp">Complaint Management System</a>
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link active" href="<%= request.getContextPath() %>/UserLogin.jsp">Login</a></li>
            <li class="nav-item"><a class="nav-link" href="UserRegister.jsp">Register</a></li>
        </ul>
    </div>
</nav>

<main class="page-content">
    <div class="login-card">
        <h3>User Login</h3>
        <p>Login to track and manage your complaints</p>

        <form action="UserLoginServlet" method="post">
            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary">Login</button>
        </form>

        <div class="text-center mt-3">
            Don’t have an account?
            <a href="<%= request.getContextPath() %>/UserRegister.jsp" class="fw-semibold">Register here</a>
        </div>
    </div>
</main>

<footer class="app-footer">
    © 2025 Online Complaint Management System | JSP · Servlets · JDBC · MySQL
</footer>

</body>
</html>
