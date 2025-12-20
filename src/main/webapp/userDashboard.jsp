<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Dashboard | Complaint Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --primary: #2563eb;
    --primary-dark: #1e40af;
    --background: #f4f6f9;
    --card-bg: #ffffff;
    --sidebar-bg: #111827;
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
}

/* NAVBAR */
.navbar {
    background: var(--navbar-bg) !important;
    z-index: 1000;
}

.navbar-brand {
    font-size: 1.4rem;
    font-weight: 600;
    color: #fff !important;
}

/* LAYOUT */
.dashboard-wrapper {
    display: flex;
    min-height: 100vh;
    padding-top: 56px; /* navbar height */
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
    display: flex;
    align-items: center;
    padding: 14px 24px;
    font-size: 1.05rem;
    font-weight: 500;
    color: #e5e7eb;
    text-decoration: none;
}

.sidebar a:hover,
.sidebar a.active {
    background: rgba(255, 255, 255, 0.08);
    color: #ffffff;
    border-left: 4px solid var(--primary);
}

/* MAIN CONTENT */
.main-content {
    margin-left: 230px;
    padding: 30px;
    flex: 1;
}

/* SUMMARY CARDS */
.summary-card {
    background: var(--card-bg);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 20px;
    text-align: center;
}

.summary-card h4 {
    font-weight: 600;
    margin-bottom: 5px;
}

.summary-card p {
    color: var(--text-muted);
    margin: 0;
}

/* TABLE */
.table thead {
    background: #f1f5f9;
}

.table th {
    font-weight: 600;
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

<div class="dashboard-wrapper">

    <!-- SIDEBAR -->
    <aside class="sidebar">
        <h6>User Menu</h6>

        <a class="active"
           href="<%= request.getContextPath() %>/userDashboard.jsp">
            Dashboard
        </a>

        <a href="<%= request.getContextPath() %>/registerComplaint.jsp">
            Register Complaint
        </a>

        <a href="<%= request.getContextPath() %>/myComplaints.jsp">
            My Complaints
        </a>

        <a href="<%= request.getContextPath() %>/profile.jsp">
            Profile
        </a>

        <a href="<%= request.getContextPath() %>/logout.jsp">
            Logout
        </a>
    </aside>

    <!-- MAIN CONTENT -->
    <main class="main-content">

        <h3 class="mb-4 fw-semibold">Welcome, User</h3>

        <!-- SUMMARY CARDS -->
        <div class="row g-4 mb-5">
            <div class="col-md-3">
                <div class="summary-card">
                    <h4>12</h4>
                    <p>Total Complaints</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="summary-card">
                    <h4>5</h4>
                    <p>Pending</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="summary-card">
                    <h4>6</h4>
                    <p>Resolved</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="summary-card">
                    <h4>1</h4>
                    <p>Rejected</p>
                </div>
            </div>
        </div>

        <!-- RECENT COMPLAINTS -->
        <div class="card border-0">
            <div class="card-body">
                <h5 class="fw-semibold mb-3">Recent Complaints</h5>

                <table class="table table-bordered align-middle">
                    <thead>
                        <tr>
                            <th>Complaint ID</th>
                            <th>Category</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>CMP1023</td>
                            <td>Electricity</td>
                            <td>10-Jan-2025</td>
                            <td><span class="badge bg-warning">Pending</span></td>
                            <td>
                                <a href="#" class="btn btn-sm btn-outline-primary">
                                    View
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>CMP1019</td>
                            <td>Water Supply</td>
                            <td>05-Jan-2025</td>
                            <td><span class="badge bg-success">Resolved</span></td>
                            <td>
                                <a href="#" class="btn btn-sm btn-outline-primary">
                                    View
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>

    </main>
</div>

<!-- FOOTER -->
<footer class="app-footer">
    © 2025 Online Complaint Management System | JSP · Servlets · JDBC · MySQL
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
