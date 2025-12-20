<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Profile | Complaint Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --primary: #2563eb;
    --background: #f4f6f9;
    --card-bg: #ffffff;
    --sidebar-bg: #0f172a;
    --navbar-bg: #111827;
    --footer-bg: #111827;
    --border: #e5e7eb;
}

html, body {
    height: 100%;
    margin: 0;
}

body {
    font-family: 'Poppins', sans-serif;
    background: var(--background);
    overflow: hidden;
}

/* NAVBAR */
.navbar {
    background: var(--navbar-bg) !important;
    height: 56px;
}

.navbar-brand {
    font-size: 1.4rem;
    font-weight: 600;
    color: #fff !important;
}

/* SIDEBAR */
.sidebar {
    width: 240px;
    background: linear-gradient(180deg, #0f172a, #111827);
    position: fixed;
    top: 56px;
    bottom: 0px;
    padding-top: 24px;
}

.sidebar a {
    display: block;
    padding: 14px 24px;
    color: #e5e7eb;
    font-size: 1.05rem;
    text-decoration: none;
}

.sidebar a.active,
.sidebar a:hover {
    background: rgba(255,255,255,0.08);
    border-left: 4px solid var(--primary);
}

/* MAIN */
.main-content {
    margin-left:690px;
    width: calc(100% - 240px);
    height: calc(100vh - 56px - 48px);
    padding: 32px 24px;
    margin-top:50px;
}

/* CARD */
.profile-card {
    background: var(--card-bg);
    border: 1px solid var(--border);
    border-radius: 16px;
    padding: 32px 40px;
    max-width: 900px;
}

/* INPUT */
.form-control:disabled {
    background: #f1f5f9;
    cursor: not-allowed;
}

/* FOOTER */
.app-footer {
    position: fixed;
    bottom: 0;
    left: 240px;
    right: 0;
    height: 48px;
    background: var(--footer-bg);
    color: #9ca3af;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.9rem;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid px-4">
        <a class="navbar-brand"
           href="<%= request.getContextPath() %>/homepage.jsp">
            Complaint Management System
        </a>
    </div>
</nav>

<!-- SIDEBAR -->
<aside class="sidebar">
    <a href="<%= request.getContextPath() %>/userDashboard.jsp">Dashboard</a>
    <a href="<%= request.getContextPath() %>/registerComplaint.jsp">Register Complaint</a>
    <a href="<%= request.getContextPath() %>/myComplaints.jsp">My Complaints</a>
    <a class="active" href="<%= request.getContextPath() %>/profile.jsp">Profile</a>
    <a href="<%= request.getContextPath() %>/logout.jsp">Logout</a>
</aside>

<!-- MAIN -->
<main class="main-content">

<div class="profile-card">
<h4 class="mb-4">My Profile</h4>

<form id="profileForm" action="UpdateProfileServlet" method="post">

<!-- BASIC INFO -->
<div class="row mb-3">
    <div class="col-md-6">
        <label class="form-label">Full Name</label>
        <input type="text" class="form-control profile-field"
               name="name" value="John Doe" disabled>
    </div>
    <div class="col-md-6">
        <label class="form-label">Phone</label>
        <input type="text" class="form-control profile-field"
               name="phone" value="9876543210" disabled>
    </div>
</div>

<div class="mb-3">
    <label class="form-label">Email</label>
    <input type="email" class="form-control"
           value="john@example.com" disabled>
</div>

<div class="mb-4">
    <label class="form-label">Address</label>
    <textarea class="form-control profile-field"
              name="address" rows="3" disabled>Sample address</textarea>
</div>

<hr>

<!-- PASSWORD SECTION -->
<h6 class="fw-semibold mb-3">Change Password</h6>

<div class="row mb-4">
    <div class="col-md-6">
        <label class="form-label">New Password</label>
        <div class="input-group">
            <input type="password" id="newPassword"
                   class="form-control profile-field"
                   name="newPassword" disabled>
            <button type="button"
                    class="btn btn-outline-secondary"
                    onclick="togglePassword('newPassword', this)">
                <i class="bi bi-eye"></i>
            </button>
        </div>
    </div>

    <div class="col-md-6">
        <label class="form-label">Confirm Password</label>
        <div class="input-group">
            <input type="password" id="confirmPassword"
                   class="form-control profile-field"
                   name="confirmPassword" disabled>
            <button type="button"
                    class="btn btn-outline-secondary"
                    onclick="togglePassword('confirmPassword', this)">
                <i class="bi bi-eye"></i>
            </button>
        </div>
    </div>
</div>

<!-- BUTTONS -->
<div class="d-flex gap-2">
    <button type="button" id="editBtn"
            class="btn btn-outline-primary">
        Update Profile
    </button>

    <button type="submit" id="saveBtn"
            class="btn btn-primary d-none">
        Save Changes
    </button>
</div>

</form>
</div>

</main>

<!-- FOOTER -->
<footer class="app-footer">
    © 2025 Online Complaint Management System | JSP · Servlets · JDBC · MySQL
</footer>

<!-- JS -->
<script>
document.getElementById("editBtn").onclick = function () {
    document.querySelectorAll(".profile-field").forEach(f => f.disabled = false);
    this.classList.add("d-none");
    document.getElementById("saveBtn").classList.remove("d-none");
};

function togglePassword(id, btn) {
    const input = document.getElementById(id);
    const icon = btn.querySelector("i");

    if (input.type === "password") {
        input.type = "text";
        icon.classList.replace("bi-eye", "bi-eye-slash");
    } else {
        input.type = "password";
        icon.classList.replace("bi-eye-slash", "bi-eye");
    }
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
