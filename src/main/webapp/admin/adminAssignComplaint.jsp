<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Assign Complaint | Admin Panel</title>
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
}

/* SIDEBAR (SAME AS OTHER PAGES) */
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
    max-width: 900px;
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
    <a href="<%= request.getContextPath() %>/admin/adminComplaints.jsp">
        View Complaints
    </a>
    <a class="active"
       href="<%= request.getContextPath() %>/admin/adminAssignComplaint.jsp">
        Assign Complaint
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

    <h4 class="mb-4">Assign Complaint</h4>

    <div class="content-card">

        <!-- Complaint Basic Info -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="text-muted small">Complaint ID</div>
                <div class="fw-semibold">CMP1023</div>
            </div>
            <div class="col-md-4">
                <div class="text-muted small">Category</div>
                <div class="fw-semibold">Electricity</div>
            </div>
            <div class="col-md-4">
                <div class="text-muted small">Current Status</div>
                <span class="badge bg-warning text-dark">Pending</span>
            </div>
        </div>

        <!-- ASSIGN FORM -->
        <form action="AssignComplaintServlet" method="post">

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Assign Officer</label>
                    <select name="officer" class="form-select" required>
                        <option value="">Select Officer</option>
                        <option>Officer A</option>
                        <option>Officer B</option>
                        <option>Officer C</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Set Priority</label>
                    <select name="priority" class="form-select">
                        <option>Low</option>
                        <option>Medium</option>
                        <option>High</option>
                        <option>Critical</option>
                    </select>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Admin Remarks</label>
                <textarea name="remarks"
                          class="form-control"
                          rows="3"
                          placeholder="Instructions for officer"></textarea>
            </div>

            <div class="d-flex gap-2">
                <button type="submit"
                        class="btn btn-primary px-4">
                    Assign Complaint
                </button>

                <a href="<%= request.getContextPath() %>/admin/adminComplaints.jsp"
                   class="btn btn-outline-secondary">
                    Cancel
                </a>
            </div>

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
