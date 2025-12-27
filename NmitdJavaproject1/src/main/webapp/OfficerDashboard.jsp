<%@ page import="java.util.*, model.Complaint" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Officer Dashboard</title>

<style>
/* ========== RESET ========== */
* {
    box-sizing: border-box;
}

/* ========== NAVBAR ========== */
.navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 60px;
    background: linear-gradient(90deg, #0f172a, #111827);
    box-shadow: 0 6px 18px rgba(0,0,0,0.25);
    z-index: 1000;
}

.navbar-inner {
    max-width: 1200px;
    margin: auto;
    height: 100%;
    padding: 0 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.brand {
    color: #ffffff;
    font-weight: 700;
    font-size: 1rem;
}

.nav-right {
    display: flex;
    align-items: center;
    gap: 14px;
}

.nav-right span {
    color: #e5e7eb;
    font-size: 0.9rem;
}

.logout-btn {
    background: #ef4444;
    color: #ffffff;
    padding: 6px 14px;
    border-radius: 6px;
    font-size: 0.85rem;
    font-weight: 600;
    text-decoration: none;
}

.logout-btn:hover {
    background: #dc2626;
}

/* ========== PAGE ========== */
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f1f5f9;
    padding-top: 80px;
}

.dashboard-container {
    max-width: 1200px;
    margin: auto;
    padding: 20px;
}

h2 {
    margin-bottom: 20px;
    color: #111827;
}

/* ========== TABLE ========== */
.table-card {
    background: #ffffff;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
    overflow: hidden;
}

table {
    width: 100%;
    border-collapse: collapse;
}

thead {
    background: #f8fafc;
}

thead th {
    padding: 14px;
    font-size: 0.8rem;
    color: #374151;
    text-transform: uppercase;
    text-align: left;
}

tbody td {
    padding: 14px;
    font-size: 0.9rem;
    border-top: 1px solid #e5e7eb;
}

tbody tr:hover {
    background: #f9fafb;
}

/* ========== STATUS COLORS ========== */
.status-resolved {
    color: #16a34a;
    font-weight: 600;
}

.status-rejected {
    color: #dc2626;
    font-weight: 600;
}

.status-progress {
    color: #2563eb;
    font-weight: 600;
}

.status-assigned {
    color: #f59e0b;
    font-weight: 600;
}

/* ========== BADGES ========== */
.badge {
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 600;
}

.badge.success {
    background: #dcfce7;
    color: #166534;
}

.badge.danger {
    background: #fee2e2;
    color: #991b1b;
}

/* ========== MOBILE ========== */
@media (max-width: 768px) {

    thead {
        display: none;
    }

    table, tbody, tr, td {
        display: block;
        width: 100%;
    }

    tr {
        margin-bottom: 15px;
        padding: 10px;
        border: 1px solid #e5e7eb;
        border-radius: 10px;
    }

    td {
        border: none;
        display: flex;
        justify-content: space-between;
        padding: 6px 0;
    }

    td::before {
        content: attr(data-label);
        font-weight: 600;
        color: #6b7280;
    }
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="navbar-inner">
        <div class="brand">Complaint Management System</div>
        <div class="nav-right">
            <span>
                Welcome,
                <%= session.getAttribute("officerName") != null
                        ? session.getAttribute("officerName")
                        : session.getAttribute("officerUsername") %>
            </span>
            <a href="OfficerLogoutServlet" class="logout-btn">Logout</a>
        </div>
    </div>
</div>

<!-- DASHBOARD -->
<div class="dashboard-container">

<h2>Officer Dashboard</h2>

<%
List<Complaint> complaints =
        (List<Complaint>) request.getAttribute("complaints");
%>

<% if (complaints == null || complaints.isEmpty()) { %>
    <p>No complaints assigned to you.</p>
<% } else { %>

<div class="table-card">
<table>
<thead>
<tr>
    <th>ID</th>
    <th>Title</th>
    <th>Priority</th>
    <th>Status</th>
    <th>Remarks</th>
    <th>Action</th>
</tr>
</thead>

<tbody>
<% for (Complaint c : complaints) { %>
<tr>
    <td data-label="ID">#<%= c.getId() %></td>
    <td data-label="Title"><%= c.getTitle() %></td>
    <td data-label="Priority"><%= c.getPriority() %></td>

    <td data-label="Status"
        class="<%=
            "Resolved".equals(c.getStatus()) ? "status-resolved" :
            "Rejected".equals(c.getStatus()) ? "status-rejected" :
            "In Progress".equals(c.getStatus()) ? "status-progress" :
            "status-assigned"
        %>">
        <%= c.getStatus() %>
    </td>

    <td data-label="Remarks">
        <%= c.getAdminRemarks() != null ? c.getAdminRemarks() : "-" %>
    </td>

    <td data-label="Action">
        <% if ("Resolved".equals(c.getStatus())) { %>
            <span class="badge success">Completed</span>
        <% } else if ("Rejected".equals(c.getStatus())) { %>
            <span class="badge danger">Rejected</span>
        <% } else { %>
            In Progress
        <% } %>
    </td>
    <th>Proof</th>
    
    <td data-label="Proof">
<% if (c.getProofFile() != null) { %>

    <% if (c.getProofFile().endsWith(".mp4")) { %>
        <video width="150" controls>
            <source src="<%= c.getProofFile() %>" type="video/mp4">
        </video>
    <% } else { %>
        <img src="<%= c.getProofFile() %>" width="120" style="border-radius:8px;">
    <% } %>

<% } else { %>
    -
<% } %>
</td>
    
</tr>
<% } %>
</tbody>
</table>
</div>

<% } %>
</div>

</body>
</html>
