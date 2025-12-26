<%@ page import="java.util.*,model.Complaint" %>

<%
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }

    List<Complaint> list = (List<Complaint>) request.getAttribute("complaints");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | OCMS</title>

<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/* ================= ADMIN NAVBAR ================= */

.admin-navbar {
    background: rgba(17, 24, 39, 0.95) !important; /* darker than user navbar */
    backdrop-filter: blur(10px);
    padding: 1rem 0;
}

/* Admin pill */
.admin-pill {
    background: #ffffff;
    color: #111827 !important;
    padding: 8px 22px;
    border-radius: 999px;
    font-weight: 600;
    transition: 0.25s;
}

.admin-pill:hover {
    background: #e5e7eb;
}

/* Dropdown */
.admin-dropdown {
    border-radius: 14px;
    border: 1px solid #e5e7eb;
    padding: 6px;
}

.admin-dropdown .dropdown-item {
    border-radius: 10px;
    padding: 10px 14px;
    font-weight: 500;
}

.admin-dropdown .dropdown-item:hover {
    background: #fee2e2;
}

/* Active link */
.navbar .nav-link.active {
    color: #ffffff !important;
    font-weight: 600;
}

/* Normal links */
.navbar .nav-link {
    color: #d1d5db !important;
    font-weight: 500;
}

.navbar .nav-link:hover {
    color: #ffffff !important;
}

    body {
        font-family: 'Plus Jakarta Sans', sans-serif;
        background: linear-gradient(135deg, #eef2ff, #f8fafc);
        min-height: 100vh;
    }

    /* Page Layout */
    .page-content {
        padding: 100px 20px 60px;
        display: flex;
        justify-content: center;
    }

    /* Card */
    .dashboard-card {
        background: #ffffff;
        width: 100%;
        max-width: 1000px;
        padding: 40px;
        border-radius: 26px;
        box-shadow: 0 25px 50px -15px rgba(0,0,0,0.12);
        animation: fadeIn 0.5s ease;
    }

    .dashboard-card h3 {
        text-align: center;
        font-weight: 700;
        margin-bottom: 30px;
        color: #111827;
    }

    /* Table */
    table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 12px;
    }

    thead th {
        background: #f1f5f9;
        padding: 14px;
        font-size: 0.85rem;
        text-transform: uppercase;
        color: #374151;
        font-weight: 700;
        border: none;
    }

    tbody tr {
        background: #ffffff;
        box-shadow: 0 6px 18px rgba(0,0,0,0.06);
        border-radius: 16px;
        transition: all 0.25s ease;
    }

    tbody tr:hover {
        transform: translateY(-2px);
        box-shadow: 0 12px 30px rgba(0,0,0,0.1);
    }

    td {
        padding: 14px;
        font-size: 0.9rem;
        color: #1f2937;
        border: none;
        vertical-align: middle;
    }

    /* Status Colors */
    .status-Pending { color: #f59e0b; font-weight: 700; }
    .status-In-Progress { color: #3b82f6; font-weight: 700; }
    .status-Resolved { color: #10b981; font-weight: 700; }
    .status-Rejected { color: #ef4444; font-weight: 700; }

    /* Buttons */
    .btn-primary {
        background: #6366f1;
        border: none;
        border-radius: 12px;
        font-weight: 600;
        padding: 8px 14px;
        transition: all 0.25s ease;
    }

    .btn-primary:hover {
        background: #4f46e5;
        box-shadow: 0 10px 15px rgba(79,70,229,0.35);
        transform: translateY(-1px);
    }

    /* Animation */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Mobile */
    @media (max-width: 768px) {
        thead { display: none; }

        tbody tr {
            display: block;
            margin-bottom: 15px;
        }

        td {
            display: flex;
            justify-content: space-between;
            padding: 10px 14px;
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
<!-- ===== ADMIN NAVBAR ===== -->
<!-- ===== ADMIN NAVBAR ===== -->
<nav class="navbar navbar-expand-lg navbar-dark admin-navbar shadow">
    <div class="container-fluid px-4">

        <!-- BRAND -->
        <a class="navbar-brand fw-bold d-flex align-items-center gap-2" href="AdminDashboardServlet">
            OCMS Admin
        </a>

        <!-- TOGGLER -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- MENU -->
        <div class="collapse navbar-collapse" id="adminNav">
            <ul class="navbar-nav ms-auto align-items-center gap-2">

                <li class="nav-item">
                    <a class="nav-link active" href="AdminDashboardServlet">Dashboard</a>
                </li>

              <li class="nav-item">
        <a class="nav-link" href="AddOfficer.jsp">Add Officer</a>
    </li>  

              <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle admin-pill"
       href="#"
       id="adminDropdown"
       role="button"
       data-bs-toggle="dropdown"
       aria-expanded="false">
        Admin
    </a>

    <ul class="dropdown-menu dropdown-menu-end admin-dropdown shadow"
        aria-labelledby="adminDropdown">
        <li>
            <a class="dropdown-item text-danger fw-semibold"
               href="AdminLogoutServlet">
                Logout
            </a>
        </li>
    </ul>
</li>

            </ul>
        </div>
    </div>
</nav>


<div class="page-content">
    <div class="dashboard-card">

        <h3>Admin Dashboard</h3>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>User</th>
                    <th>Category</th>
                    <th>Title</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
            <% for (Complaint c : list) { %>
                <tr>
                    <td data-label="ID">#<%= c.getId() %></td>
                    <td data-label="User"><%= c.getUserEmail() %></td>
                    <td data-label="Category"><%= c.getCategory() %></td>
                    <td data-label="Title"><%= c.getTitle() %></td>
                    <td data-label="Status"
                        class="status-<%= c.getStatus().replace(" ", "-") %>">
                        <%= c.getStatus() %>
                    </td>
                    <td data-label="Action">
                       <a href="AssignComplaintServlet?id=<%= c.getId() %>"
   class="btn btn-primary btn-sm">
   Assign / Update
</a>

                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
