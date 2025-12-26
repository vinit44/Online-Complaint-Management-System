<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Officer" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Assign Complaint | OCMS Admin</title>

<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/* ================= ADMIN NAVBAR ================= */
.admin-navbar {
    background: rgba(17, 24, 39, 0.95) !important;
    backdrop-filter: blur(10px);
    padding: 1rem 0;
}

.admin-pill {
    background: #ffffff;
    color: #111827 !important;
    padding: 8px 22px;
    border-radius: 999px;
    font-weight: 600;
}

.admin-dropdown {
    border-radius: 14px;
    border: 1px solid #e5e7eb;
    padding: 6px;
}

.admin-dropdown .dropdown-item:hover {
    background: #fee2e2;
}

/* ================= PAGE ================= */
body {
    font-family: 'Plus Jakarta Sans', sans-serif;
    background: linear-gradient(135deg, #eef2ff, #f8fafc);
    min-height: 100vh;
}

.page-content {
    padding-top: 110px;
    display: flex;
    justify-content: center;
}

.auth-card {
    background: #ffffff;
    width: 100%;
    max-width: 520px;
    padding: 40px;
    border-radius: 26px;
    box-shadow: 0 25px 50px -15px rgba(0,0,0,0.12);
    animation: fadeIn 0.4s ease;
}

.auth-card h3 {
    text-align: center;
    font-weight: 700;
    margin-bottom: 30px;
}

label {
    font-weight: 600;
    font-size: 0.9rem;
    margin-bottom: 6px;
    display: block;
}

.form-control, select, textarea {
    padding: 14px;
    border-radius: 14px;
    border: 1px solid #e5e7eb;
    background: #f1f5f9;
    margin-bottom: 18px;
}

.form-control:focus, select:focus, textarea:focus {
    border-color: #6366f1;
    box-shadow: 0 0 0 4px rgba(99,102,241,0.1);
    background: #ffffff;
}

.btn-primary {
    background: #6366f1;
    border: none;
    padding: 14px;
    border-radius: 14px;
    font-weight: 600;
}

.btn-primary:hover {
    background: #4f46e5;
    transform: translateY(-1px);
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(15px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
</head>

<body>

<!-- ===== ADMIN NAVBAR ===== -->
<nav class="navbar navbar-expand-lg navbar-dark admin-navbar shadow fixed-top">
    <div class="container-fluid px-4">

        <a class="navbar-brand fw-bold" href="AdminDashboardServlet">
            🛡️ OCMS Admin
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminNav">
            <ul class="navbar-nav ms-auto align-items-center gap-2">

                <li class="nav-item">
                    <a class="nav-link" href="AdminDashboardServlet">Dashboard</a>
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

<!-- ===== PAGE CONTENT ===== -->
<div class="page-content">
    <div class="auth-card">

        <h3>Assign Complaint</h3>

        <form action="AssignComplaintServlet" method="post">
            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">

            <!-- OFFICER DROPDOWN -->
            <label>Assign To (Officer)</label>
            <select name="assignedTo" class="form-control" required>
                <option value="">-- Select Officer --</option>

                <%
                    List<Officer> officers =
                        (List<Officer>) request.getAttribute("officers");

                    if (officers != null && !officers.isEmpty()) {
                        for (Officer o : officers) {
                %>
                    <option value="<%= o.getName() %>">
                        <%= o.getName() %> (<%= o.getDepartment() %>)
                    </option>
                <%
                        }
                    }
                %>
            </select>

            <label>Priority</label>
            <select name="priority" class="form-control">
                <option>Low</option>
                <option>Medium</option>
                <option>High</option>
                <option>Critical</option>
            </select>

            <label>Admin Remarks</label>
            <textarea name="remarks" rows="4" class="form-control"
                      placeholder="Enter remarks or instructions..."></textarea>

            <button type="submit" class="btn btn-primary w-100 mt-2">
                Assign Complaint
            </button>
        </form>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
