<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | Complaint Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
/* ===== BLUE & WHITE ADMIN THEME ===== */

:root {
    --bg-main: #f4f8ff;
    --blue-main: #2563eb;
    --blue-light: #e0e7ff;
    --card-bg: #ffffff;

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
}

/* NAVBAR */
.admin-navbar {
    height: 56px;
    background: var(--blue-main);
    color: #ffffff;
    display: flex;
    align-items: center;
    padding: 0 24px;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
}

/* SIDEBAR */
.admin-sidebar {
    width: 220px;
    background: var(--blue-main);
    position: fixed;
    top: 56px;
    bottom: 48px;
    padding-top: 20px;
}

.admin-sidebar a {
    display: block;
    padding: 14px 20px;
    color: #ffffff;
    text-decoration: none;
    font-weight: 500;
    opacity: 0.9;
}

.admin-sidebar a:hover,
.admin-sidebar a.active {
    background: rgba(255,255,255,0.15);
    opacity: 1;
}

/* MAIN */
.admin-main {
    margin-left: 220px;
    margin-top: 56px;
    padding: 24px;
    min-height: calc(100vh - 56px - 48px);
}

/* STAT CARDS */
.stat-card {
    background: var(--card-bg);
    border: 1px solid var(--border);
    border-radius: 14px;
    padding: 22px;
}

.stat-card h6 {
    color: var(--text-muted);
    font-weight: 500;
    margin-bottom: 6px;
}

.stat-card h3 {
    color: var(--blue-main);
    font-weight: 600;
    margin: 0;
}

/* INFO CARD */
.info-card {
    background: var(--card-bg);
    border: 1px solid var(--border);
    border-radius: 14px;
    padding: 24px;
}

/* FOOTER */
.admin-footer {
    height: 48px;
    background: var(--blue-light);
    position: fixed;
    bottom: 0;
    left: 220px;
    right: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.85rem;
    color: var(--text-muted);
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="admin-navbar">
    <h5 class="m-0 fw-semibold">Complaint Management System — Admin Panel</h5>
</div>

<!-- SIDEBAR -->
<div class="admin-sidebar">
    <a class="active"
       href="<%= request.getContextPath() %>/admin/adminDashboard.jsp">
        Dashboard
    </a>
    <a href="<%= request.getContextPath() %>/admin/adminComplaints.jsp">
        View Complaints
    </a>
    <a href="<%= request.getContextPath() %>/admin/adminAssignComplaint.jsp">
        Assign Complaints
    </a>
    <a href="<%= request.getContextPath() %>/admin/adminProfile.jsp">
        Profile
    </a>
    <a href="<%= request.getContextPath() %>/admin/adminLogout.jsp">
        Logout
    </a>
</div>

<!-- MAIN CONTENT -->
<div class="admin-main">

    <h4 class="mb-4">Dashboard Overview</h4>

    <div class="row g-4">

        <div class="col-md-3">
            <div class="stat-card">
                <h6>Total Complaints</h6>
                <h3>120</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="stat-card">
                <h6>Pending</h6>
                <h3>35</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="stat-card">
                <h6>In Progress</h6>
                <h3>48</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="stat-card">
                <h6>Resolved</h6>
                <h3>37</h3>
            </div>
        </div>

    </div>

    <div class="mt-5">
        <div class="info-card">
            <h6 class="fw-semibold mb-2">Admin Instructions</h6>
            <p class="mb-0" style="color: var(--text-muted);">
                Use the sidebar to view complaints, assign them to officers,
                and track complaint resolution. This dashboard provides
                a quick overview of system activity.
            </p>
        </div>
    </div>

</div>

<!-- FOOTER -->
<div class="admin-footer">
    © 2025 Complaint Management System | Admin Panel
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
