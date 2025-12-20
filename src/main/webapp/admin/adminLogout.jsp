<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Logout Successful | Admin Panel</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
/* ===== BLUE & WHITE ADMIN LOGOUT THEME ===== */

:root {
    --bg-main: #f4f8ff;
    --blue-main: #2563eb;
    --blue-light: #e0e7ff;
    --card-bg: #ffffff;
    --text-main: #0f172a;
    --text-muted: #64748b;
}

html, body {
    height: 100%;
    margin: 0;
}

body {
    font-family: 'Poppins', sans-serif;
    background: var(--bg-main);
    display: flex;
    align-items: center;
    justify-content: center;
}

/* CARD */
.logout-card {
    background: var(--card-bg);
    border-radius: 16px;
    padding: 40px 44px;
    max-width: 420px;
    width: 100%;
    text-align: center;
    box-shadow: 0 12px 28px rgba(0,0,0,0.08);
}

.logout-card h4 {
    font-weight: 600;
    margin-bottom: 10px;
    color: var(--text-main);
}

.logout-card p {
    color: var(--text-muted);
    font-size: 0.95rem;
    margin-bottom: 26px;
}

/* BUTTON */
.btn-home {
    background: var(--blue-main);
    border: none;
    padding: 10px 26px;
    font-weight: 500;
}

.btn-home:hover {
    background: #1e40af;
}
</style>
</head>

<body>

<div class="logout-card">
    <h4>Logout Successful</h4>
    <p>
        You have logged out from the Admin Panel successfully.<br>
        Please login again to continue.
    </p>

    <a href="<%= request.getContextPath() %>/admin/adminLogin.jsp"
       class="btn btn-home text-white">
        Go to Admin Login
    </a>
</div>

</body>
</html>
