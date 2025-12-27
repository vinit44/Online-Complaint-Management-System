<%@ page import="java.util.Map" %>

<%@ page import="java.util.Map, java.util.HashMap" %>
<%@ page import="java.util.List, model.Complaint" %>

<%
    // Session validation
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }

    // SAFE handling for total complaints
    Integer totalObj = (Integer) request.getAttribute("totalComplaints");
    int total = (totalObj != null) ? totalObj : 0;

    // SAFE handling for stats
    Map<String, Integer> stats =
        (Map<String, Integer>) request.getAttribute("stats");

    if (stats == null) {
        stats = new HashMap<>();
        stats.put("Pending", 0);
        stats.put("In-Progress", 0);
        stats.put("Resolved", 0);
        stats.put("Rejected", 0);
    }
%>


<!DOCTYPE html>
<html>
<head>
<style>
        :root {
            --primary-color: #6366f1;
            --primary-hover: #4f46e5;
            --bg-gradient: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            --card-bg: #ffffff;
            --text-main: #1f2937;
            --text-muted: #6b7280;
            --pending: #f59e0b;
            --progress: #3b82f6;
            --resolved: #10b981;
            --rejected: #ef4444;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: var(--bg-gradient);
            min-height: 100vh;
            color: var(--text-main);
        }

        /* Navbar Styling */
        .navbar {
            background: rgba(31, 41, 55, 0.95) !important;
            backdrop-filter: blur(10px);
            padding: 1rem 0;
            z-index: 1000;
          
        }

        /* Layout */
        .page-content {
            padding-top: 100px;
            padding-bottom: 60px;
            display: flex;
            justify-content: center;
        }

        .dashboard-card {
            background: var(--card-bg);
            width: 100%;
            max-width: 850px;
            padding: 40px;
            border-radius: 28px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.6s ease-out;
        }

        /* Welcome Section */
        .welcome-header h3 {
            font-weight: 700;
            margin-bottom: 5px;
        }
        .welcome-header p {
            color: var(--text-muted);
            font-size: 0.95rem;
        }

        /* Stat Cards */
        .stat-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }

        .stat-card {
            padding: 20px;
            border-radius: 20px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            background: #fff;
            border-color: var(--primary-color);
        }

        .stat-number {
            font-size: 1.8rem;
            font-weight: 800;
            display: block;
        }

        .stat-label {
            font-size: 0.85rem;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        /* Status Colors */
        .text-pending { color: var(--pending); }
        .text-progress { color: var(--progress); }
        .text-resolved { color: var(--resolved); }
        .text-rejected { color: var(--rejected); }

        /* Action Buttons */
        .btn-action {
            padding: 14px;
            border-radius: 14px;
            font-weight: 600;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            transition: all 0.3s ease;
        }

        .btn-primary-custom {
            background-color: var(--primary-color);
            color: white;
            border: none;
        }
        .btn-primary-custom:hover {
            background-color: var(--primary-hover);
            box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.3);
        }

        .btn-outline-custom {
            background: transparent;
            border: 1px solid #e2e8f0;
            color: var(--text-main);
        }
        .btn-outline-custom:hover {
            background: #f8fafc;
            border-color: var(--primary-color);
        }

        /* Footer */
        .app-footer {
            text-align: center;
            padding: 20px;
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 576px) {
            .dashboard-card { padding: 25px; }
            .stat-grid { grid-template-columns: 1fr 1fr; }
        }
    </style>
<meta charset="UTF-8">
<title>User Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/compliant-theme.css">
</head>

<body>

<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid px-4">
        <span class="navbar-brand" style="color: white">Complaint Management System</span>
        <div class="ms-auto">
            <a href="LogoutServlet" class="btn btn-danger btn-sm">Logout</a>
        </div>
    </div>
</nav>

<main class="page-content">
    <div class="auth-card" style="max-width:700px;">

        <h3>Welcome, <%= session.getAttribute("userName") %></h3>
        <p>Email: <%= session.getAttribute("userEmail") %></p>

        <hr>

        <h5>Total Complaints: <strong><%= total %></strong></h5>

        <div class="row text-center mt-3">
            <div class="col-md-3"><strong>Pending</strong><br><%= stats.getOrDefault("Pending", 0) %></div>
            <div class="col-md-3"><strong>In-Progress</strong><br><%= stats.getOrDefault("In Progress", 0) %></div>
            <div class="col-md-3"><strong>Resolved</strong><br><%= stats.getOrDefault("Resolved", 0) %></div>
            <div class="col-md-3"><strong>Rejected</strong><br><%= stats.getOrDefault("Rejected", 0) %></div>
        </div>

<hr>
<h4>My Assigned Complaints</h4>

<%
    List<Complaint> complaints =
        (List<Complaint>) request.getAttribute("complaints");
%>

<% if (complaints == null || complaints.isEmpty()) { %>
    <p>No complaints assigned yet.</p>
<% } else { %>

<table class="table table-bordered mt-3">
<tr>
    <th>ID</th>
    <th>Title</th>
    <th>Status</th>
    <th>Assigned Officer</th>
</tr>

<% for (Complaint c : complaints) { %>
<tr>
    <td>#<%= c.getId() %></td>
    <td><%= c.getTitle() %></td>
    <td><%= c.getStatus() %></td>
    <td>
        <% if (c.getAssignedTo() != null) { %>
            <strong><%= c.getOfficerName() %></strong><br>
           <%= c.getOfficerPhone() %>
        <% } else { %>
            Not Assigned
        <% } %>
    </td>
</tr>
<% } %>
</table>
<% } %>


        <a href="AddComplaint.jsp" class="btn btn-primary w-100 mb-2">
            Register New Complaint
        </a>

     <a href="ViewComplaintsServlet" class="btn btn-outline-primary w-100">
    View My Complaints
</a>

        <a href="#" class="btn btn-outline-secondary w-100 mt-2">
            Download Complaint Report
        </a>

    </div>
    
</main>



</body>
</html>
