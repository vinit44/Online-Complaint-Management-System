<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Registration | Complaint Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
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

/* NAVBAR */
.navbar {
    background: var(--navbar-bg) !important;
}

.navbar-brand {
    font-size: 1.4rem;
    font-weight: 600;
    color: #fff !important;
}

.nav-link {
    font-size: 1rem;
    font-weight: 500;
    color: #e5e7eb !important;
    margin-left: 18px;
}

.nav-link.active,
.nav-link:hover {
    color: #ffffff !important;
}

/* MAIN CONTENT */
.page-content {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding-top: 90px;
    padding-bottom: 40px;
}

/* CARD */
.register-card {
    background: var(--card-bg);
    border-radius: 12px;
    padding: 32px;
    width: 100%;
    max-width: 520px;
    border: 1px solid var(--border);
}

.register-card h3 {
    font-weight: 600;
    text-align: center;
}

.register-card p {
    text-align: center;
    font-size: 0.95rem;
    color: var(--text-muted);
    margin-bottom: 24px;
}

.form-control, textarea {
    border-radius: 6px;
    border: 1px solid var(--border);
    font-size: 0.95rem;
}

/* BUTTON */
.btn-primary {
    background: var(--primary);
    border: none;
    width: 100%;
    padding: 10px;
}

.btn-primary:hover {
    background: var(--primary-dark);
}

/* FOOTER */
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
            <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/UserLogin.jsp">Login</a></li>
            <li class="nav-item"><a class="nav-link active" href="<%= request.getContextPath() %>/UserRegister.jsp">Register</a></li>
        </ul>
    </div>
</nav>

<main class="page-content">
    <div class="register-card">
        <h3>User Registration</h3>
        <p>Create your account to register and track complaints</p>

        <form action="UserRegisterServlet" method="post">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label>Full Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label>Phone Number</label>
                    <input type="text" name="phone" class="form-control" required>
                </div>
            </div>

            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Address</label>
                <textarea name="address" class="form-control" rows="2" required></textarea>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label>Confirm Password</label>
                    <input type="password" name="confirmPassword" class="form-control" required>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Register</button>
        </form>

        <div class="text-center mt-3">
            Already have an account?
            <a href="<%= request.getContextPath() %>/UserLogin.jsp" class="fw-semibold">Login here</a>
        </div>
    </div>
</main>

<footer class="app-footer">
    © 2025 Online Complaint Management System | JSP · Servlets · JDBC · MySQL
</footer>

</body>
</html>
