<%@ page import="java.util.List" %>
<%@ page import="model.Complaint" %>

<%
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }

    List<Complaint> complaints =
        (List<Complaint>) request.getAttribute("complaints");
%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* ===============================
   GLOBAL
================================ */
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap');

* {
    box-sizing: border-box;
}

body {
    font-family: 'Plus Jakarta Sans', sans-serif;
    background: linear-gradient(135deg, #eef2ff, #f8fafc);
    color: #1f2937;
}

/* ===============================
   NAVBAR
================================ */
.navbar {
    background: rgba(31, 41, 55, 0.95);
    backdrop-filter: blur(10px);
    padding: 14px 0;
}

.navbar-brand {
    font-weight: 700;
    color: #ffffff !important;
    letter-spacing: 0.5px;
}

/* ===============================
   PAGE LAYOUT
================================ */
.page-content {
    padding-top: 110px;
    padding-bottom: 60px;
    display: flex;
    justify-content: center;
}

/* ===============================
   CARD
================================ */
.dashboard-card {
    background: #ffffff;
    width: 100%;
    padding: 40px;
    border-radius: 26px;
    box-shadow: 0 25px 50px -15px rgba(0, 0, 0, 0.12);
    animation: fadeIn 0.5s ease;
}

.dashboard-card h3 {
    font-weight: 700;
    margin-bottom: 25px;
    color: #111827;
}

/* ===============================
   ALERT
================================ */
.alert-info {
    background: #eef2ff;
    border: 1px solid #c7d2fe;
    color: #3730a3;
    font-weight: 500;
    border-radius: 14px;
}

/* ===============================
   TABLE
================================ */
.table {
    margin-top: 10px;
    border-collapse: separate;
    border-spacing: 0 10px;
}

.table thead th {
    background: #f1f5f9;
    color: #374151;
    font-size: 0.85rem;
    font-weight: 600;
    text-transform: uppercase;
    border: none;
    padding: 14px;
}

.table tbody tr {
    background: #ffffff;
    border-radius: 16px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.table tbody tr:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 25px rgba(0,0,0,0.08);
}

.table td {
    padding: 14px;
    vertical-align: middle;
    border: none;
    font-size: 0.9rem;
    color: #1f2937;
}

/* ===============================
   BADGES (STATUS)
================================ */
.badge {
    padding: 7px 12px;
    font-size: 0.75rem;
    font-weight: 600;
    border-radius: 999px;
}

.bg-warning {
    background-color: #f59e0b !important;
    color: #ffffff;
}

.bg-success {
    background-color: #10b981 !important;
}

.bg-danger {
    background-color: #ef4444 !important;
}

.bg-primary {
    background-color: #3b82f6 !important;
}

/* ===============================
   BUTTONS
================================ */
.btn-primary {
    background: #6366f1;
    border: none;
    padding: 14px;
    border-radius: 14px;
    font-weight: 600;
    transition: all 0.25s ease;
}

.btn-primary:hover {
    background: #4f46e5;
    box-shadow: 0 10px 20px rgba(79, 70, 229, 0.35);
}

.btn-light {
    border-radius: 10px;
    font-weight: 600;
}

/* ===============================
   FOOTER
================================ */
.app-footer {
    text-align: center;
    font-size: 0.85rem;
    color: #6b7280;
    padding: 20px;
}

/* ===============================
   ANIMATION
================================ */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(15px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ===============================
   MOBILE
================================ */
@media (max-width: 768px) {
    .dashboard-card {
        padding: 25px;
    }

    .table thead {
        display: none;
    }

    .table tbody tr {
        display: block;
        margin-bottom: 15px;
    }

    .table td {
        display: flex;
        justify-content: space-between;
        padding: 10px 14px;
    }

    .table td::before {
        content: attr(data-label);
        font-weight: 600;
        color: #6b7280;
    }
}

</style>
    <meta charset="UTF-8">
    <title>My Complaints</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/compliant-theme.css">
</head>

<body>

<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid px-4">
        <span class="navbar-brand">Complaint Management System</span>
        <div class="ms-auto">
            <a href="UserDashboardServlet" class="btn btn-light btn-sm">Dashboard</a>
        </div>
    </div>
</nav>

<main class="page-content">
    <div class="dashboard-card" style="max-width:1000px;">

        <h3 class="mb-3 text-center">My Complaints</h3>

        <%
            if (complaints == null || complaints.isEmpty()) {
        %>
            <div class="alert alert-info text-center">
                You have not registered any complaints yet.
            </div>
        <%
            } else {
        %>

        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Category</th>
                        <th>Title</th>
                        <th>Location</th>
                        <th>Status</th>
                        <th>Assigned To</th>
                        <th>Created</th>
                    </tr>
                </thead>
                <tbody>
                <% for (Complaint c : complaints) { %>
                    <tr>
                        <td>#<%= c.getId() %></td>
                        <td><%= c.getCategory() %></td>
                        <td><%= c.getTitle() %></td>
                        <td><%= c.getLocation() %></td>
                        <td>
                            <span class="badge
                                <%= "Pending".equals(c.getStatus()) ? "bg-warning" :
                                    "Resolved".equals(c.getStatus()) ? "bg-success" :
                                    "Rejected".equals(c.getStatus()) ? "bg-danger" :
                                    "bg-primary" %>">
                                <%= c.getStatus() %>
                            </span>
                        </td>
                        <td>
                            <%= c.getAssignedTo() != null ? c.getAssignedTo() : "—" %>
                        </td>
                        <td><%= c.getCreatedAt() %></td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>

        <% } %>

        <a href="AddComplaint.jsp" class="btn btn-primary w-100 mt-3">
            Register New Complaint
        </a>

    </div>
</main>

<footer class="app-footer">
    © 2025 Online Complaint Management System
</footer>

</body>
</html>
