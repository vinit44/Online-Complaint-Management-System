<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View Complaints | Admin Panel</title>
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

/* CARD */
.content-card {
    background: var(--card-bg);
    border: 1px solid var(--border);
    border-radius: 14px;
    padding: 24px;
}

/* TABLE */
.table thead {
    background: var(--blue-light);
}

.table th {
    font-weight: 600;
    color: var(--text-main);
}

.badge {
    font-size: 0.8rem;
    padding: 6px 10px;
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
    <a href="<%= request.getContextPath() %>/admin/adminDashboard.jsp">
        Dashboard
    </a>
    <a class="active"
       href="<%= request.getContextPath() %>/admin/adminComplaints.jsp">
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

    <h4 class="mb-4">All Complaints</h4>

    <div class="content-card">

        <div class="table-responsive">
            <table class="table table-bordered align-middle">
                <thead>
                    <tr>
                        <th>Complaint ID</th>
                        <th>User</th>
                        <th>Category</th>
                        <th>Title</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <!-- SAMPLE DATA (replace with JDBC later) -->

                    <tr>
                        <td>CMP1023</td>
                        <td>John Doe</td>
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
                        <td>Priya Sharma</td>
                        <td>Water</td>
                        <td>Water leakage</td>
                        <td>05-Jan-2025</td>
                        <td>
                            <span class="badge bg-info text-dark">
                                In Progress
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
                        <td>Rahul Patil</td>
                        <td>Cleanliness</td>
                        <td>Garbage not collected</td>
                        <td>01-Jan-2025</td>
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

                </tbody>
            </table>
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
