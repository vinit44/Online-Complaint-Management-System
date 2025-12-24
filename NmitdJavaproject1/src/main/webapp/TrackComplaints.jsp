<%@ page import="java.util.*,model.Complaint" %>

<%
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }

    List<Complaint> list =
        (List<Complaint>) request.getAttribute("complaintList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Track Complaints</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/compliant-theme.css">
</head>

<body>

<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid px-4">
        <span class="navbar-brand">Complaint Management System</span>
        <div class="ms-auto">
            <a href="UserDashboardServlet" class="btn btn-secondary btn-sm">Dashboard</a>
            <a href="LogoutServlet" class="btn btn-danger btn-sm ms-2">Logout</a>
        </div>
    </div>
</nav>

<div class="container page-content" style="align-items:flex-start;">
    <div class="w-100">

        <h3 class="mb-3">My Complaints</h3>

        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Category</th>
                    <th>Title</th>
                    <th>Status</th>
                    <th>Location</th>
                    <th>Date</th>
                </tr>
            </thead>

            <tbody>
                <% for (Complaint c : list) { %>
                <tr>
                    <td><%= c.getId() %></td>
                    <td><%= c.getCategory() %></td>
                    <td><%= c.getTitle() %></td>
                    <td>
                        <span class="badge bg-primary">
                            <%= c.getStatus() %>
                        </span>
                    </td>
                    <td><%= c.getLocation() %></td>
                    <td><%= c.getCreatedAt() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% if (list == null || list.isEmpty()) { %>
            <div class="alert alert-info text-center">
                No complaints found.
            </div>
        <% } %>

    </div>
</div>

<footer class="app-footer">
    © 2025 Online Complaint Management System
</footer>

</body>
</html>
