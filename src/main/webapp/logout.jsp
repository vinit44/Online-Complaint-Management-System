<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Logout Successful | Complaint Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --primary: #2563eb;
    --background: #f4f6f9;
    --card-bg: #ffffff;
    --text-main: #111827;
    --text-muted: #6b7280;
}

html, body {
    height: 100%;
    margin: 0;
}

body {
    font-family: 'Poppins', sans-serif;
    background: var(--background);
    display: flex;
    align-items: center;
    justify-content: center;
}

/* CARD */
.logout-card {
    background: var(--card-bg);
    border-radius: 16px;
    padding: 40px 48px;
    text-align: center;
    max-width: 420px;
    width: 100%;
    box-shadow: 0 12px 32px rgba(0,0,0,0.1);
}

.logout-card h3 {
    font-weight: 600;
    margin-bottom: 12px;
    color: var(--text-main);
}

.logout-card p {
    color: var(--text-muted);
    margin-bottom: 28px;
    font-size: 0.95rem;
}

/* BUTTON */
.btn-home {
    background: var(--primary);
    border: none;
    padding: 10px 24px;
    font-weight: 500;
}

.btn-home:hover {
    background: #1e40af;
}
</style>
</head>

<body>

<div class="logout-card">
    <h3>Logout Successful</h3>
    <p>You have been logged out successfully.<br>
       Thank you for using the Complaint Management System.</p>

    <a href="<%= request.getContextPath() %>/homepage.jsp"
       class="btn btn-home text-white">
        Go to Home Page
    </a>
</div>

</body>
</html>
