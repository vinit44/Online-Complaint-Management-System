<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Login | Complaint Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
/* ===== BLUE & WHITE ADMIN LOGIN THEME ===== */

:root {
    --bg-main: #f4f8ff;
    --navbar-bg: #2563eb;
    --card-bg: #ffffff;

    --primary: #2563eb;
    --primary-hover: #1e40af;
    --primary-light: #e0e7ff;

    --text-main: #0f172a;
    --text-muted: #64748b;

    --border: #e5e7eb;
}

html, body {
    height: 100%;
    margin: 0;
}

body {
    font-family: 'Poppins', sans-serif;
    background: var(--bg-main);
    display: flex;
    flex-direction: column;
}

/* NAVBAR */
.admin-navbar {
    height: 56px;
    background: var(--navbar-bg);
    color: #ffffff;
    display: flex;
    align-items: center;
    padding: 0 24px;
}

.admin-navbar h5 {
    margin: 0;
    font-weight: 600;
}

/* MAIN */
.login-wrapper {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* LOGIN CARD */
.login-card {
    background: var(--card-bg);
    border: 1px solid var(--border);
    border-radius: 16px;
    padding: 38px 42px;
    width: 100%;
    max-width: 420px;
    box-shadow: 0 12px 28px rgba(0,0,0,0.08);
}

.login-card h4 {
    text-align: center;
    font-weight: 600;
    color: var(--text-main);
    margin-bottom: 6px;
}

.login-card p {
    text-align: center;
    color: var(--text-muted);
    font-size: 0.9rem;
    margin-bottom: 28px;
}

/* FORM */
.form-label {
    font-weight: 500;
    color: var(--text-main);
}

.form-control {
    height: 46px;
    border-radius: 10px;
}

.form-control:focus {
    border-color: var(--primary);
    box-shadow: none;
}

/* BUTTON */
.btn-admin {
    background: var(--primary);
    border: none;
    height: 46px;
    font-weight: 500;
}

.btn-admin:hover {
    background: var(--primary-hover);
}

/* FOOTER */
.admin-footer {
    background: var(--primary-light);
    text-align: center;
    padding: 12px;
    font-size: 0.85rem;
    color: var(--text-muted);
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="admin-navbar">
    <h5>Complaint Management System — Admin Panel</h5>
</div>

<!-- MAIN CONTENT -->
<div class="login-wrapper">

    <div class="login-card">

        <h4>Admin Login</h4>
        <p>Login to manage complaints</p>

        <form action="<%= request.getContextPath() %>/AdminLoginServlet"
              method="post">

            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text"
                       name="username"
                       class="form-control"
                       placeholder="Enter admin username"
                       required>
            </div>

            <div class="mb-4">
                <label class="form-label">Password</label>
                <input type="password"
                       name="password"
                       class="form-control"
                       placeholder="Enter password"
                       required>
            </div>

            <button type="submit"
                    class="btn btn-admin w-100 text-white">
                Login
            </button>

        </form>

    </div>

</div>

<!-- FOOTER -->
<div class="admin-footer">
    © 2025 Complaint Management System | Admin Panel
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
