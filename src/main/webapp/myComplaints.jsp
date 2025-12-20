<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Complaints | Complaint Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --primary: #2563eb;
    --primary-dark: #1e40af;
    --background: #f4f6f9;
    --card-bg: #ffffff;
    --sidebar-bg: #0f172a;
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
    color: #ffffff !important;
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
    margin-left: 240px;
    width: calc(100% - 240px);
    height: calc(100vh - 56px - 48px);
    padding: 32px 24px;
    box-sizing: border-box;
}

/* CARD */
.content-card {
    background: var(--card-bg);
    border: 1px solid var(--border);
    border-radius: 16px;
    padding: 28px 32px;
    height: 100%;
    display: flex;
    flex-direction: column;
}

.content-card h4 {
    font-weight: 600;
    margin-bottom: 20px;
}

/* TABLE */
.table thead {
    background: #f1f5f9;
}

.table th {
    font-weight: 600;
}

.badge {
    font-size: 0.85rem;
    padding: 6px 10px;
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
    <a href="<%= request.getContextPath() %>/registerComplaint.jsp">
        Register Complaint
    </a>
    <a class="active"
       href="<%= request.getContextPath() %>/myComplaints.jsp">
        My Complaints
    </a>
    <a href="<%= request.getContextPath() %>/profile.jsp">Profile</a>
    <a href="<%= request.getContextPath() %>/logout.jsp">Logout</a>
</aside>

<!-- MAIN CONTENT -->
<main class="main-content">

    <div class="content-card">
        <h4>My Complaints</h4>

        <div class="table-responsive flex-grow-1">
            <table class="table table-bordered align-middle">
                <thead>
                    <tr>
                        <th>Complaint ID</th>
                        <th>Category</th>
                        <th>Title</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <!-- SAMPLE ROW (replace with dynamic data later) -->
                    <tr>
                        <td>CMP1023</td>
                        <td>Electricity</td>
                        <td>Power outage</td>
                        <td>12-Jan-2025</td>
                        <td>
                            <span class="badge bg-warning text-dark">
                                Pending
                            </span>
                        </td>
                        <td>
                            <a href="#" class="btn btn-sm btn-outline-primary">
                                View
                            </a>
                        </td>
                    </tr>

                    <tr>
                        <td>CMP1018</td>
                        <td>Water</td>
                        <td>Water leakage</td>
                        <td>05-Jan-2025</td>
                        <td>
                            <span class="badge bg-success">
                                Resolved
                            </span>
                        </td>
                        <td>
                            <a href="#" class="btn btn-sm btn-outline-primary">
                                View
                            </a>
                        </td>
                    </tr>

                    <tr>
                        <td>CMP1012</td>
                        <td>Cleanliness</td>
                        <td>Garbage not collected</td>
                        <td>01-Jan-2025</td>
                        <td>
                            <span class="badge bg-danger">
                                Rejected
                            </span>
                        </td>
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

<!-- FOOTER -->
<footer class="app-footer">
    © 2025 Online Complaint Management System | JSP · Servlets · JDBC · MySQL
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
