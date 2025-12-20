<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register Complaint | Complaint Management System</title>
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

/* BODY */
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
    padding: 48px 24px 24px;
    box-sizing: border-box;
    margin-top:30px;
}

/* FORM CARD */
.form-card {
    background: var(--card-bg);
    border: 1px solid var(--border);
    border-radius: 16px;
    padding: 40px 48px;
    width: 100%;
    box-shadow: 0 12px 32px rgba(0,0,0,0.1);
}

.form-card h4 {
    font-weight: 600;
    margin-bottom: 28px;
}

/* INPUT SIZE */
.form-control,
.form-select {
    min-height: 20px;
    font-size: 1rem;
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
    <a class="active"
       href="<%= request.getContextPath() %>/registerComplaint.jsp">
        Register Complaint
    </a>
    <a href="<%= request.getContextPath() %>/myComplaints.jsp">My Complaints</a>
    <a href="<%= request.getContextPath() %>/profile.jsp">Profile</a>
    <a href="<%= request.getContextPath() %>/logout.jsp">Logout</a>
</aside>

<!-- MAIN CONTENT -->
<main class="main-content">

    <div class="form-card">
        <h4>Register New Complaint</h4>

        <form action="RegisterComplaintServlet" method="post"
              enctype="multipart/form-data">

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Complaint Category</label>
                    <select name="category" class="form-select" required>
                        <option value="">Select Category</option>
                        <option>Electricity</option>
                        <option>Water</option>
                        <option>IT Issue</option>
                        <option>Maintenance</option>
                        <option>Cleanliness</option>
                        <option>Noise</option>
                        <option>Harassment</option>
                        <option>Other</option>
                    </select>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Priority</label>
                    <select name="priority" class="form-select">
                        <option>Low</option>
                        <option>Medium</option>
                        <option>High</option>
                        <option>Critical</option>
                    </select>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Complaint Title</label>
                <input type="text" name="title" class="form-control"
                       placeholder="Short title of the complaint" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea name="description" rows="4" class="form-control"
                          placeholder="Describe the issue in detail" required></textarea>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Location</label>
                    <input type="text" name="location" class="form-control"
                           placeholder="Enter location of issue" required>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Upload Proof (Optional)</label>
                    <input type="file" name="attachment" class="form-control">
                </div>
            </div>

            <button type="submit" class="btn btn-primary px-4 mt-2">
                Submit Complaint
            </button>

        </form>
    </div>

</main>

<!-- FOOTER -->
<footer class="app-footer">
    © 2025 Online Complaint Management System | JSP · Servlets · JDBC · MySQL
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
