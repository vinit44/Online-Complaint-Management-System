<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Officer | OCMS Admin</title>

<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" rel="stylesheet">
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

body{
    font-family:'Plus Jakarta Sans',sans-serif;
    background:linear-gradient(135deg,#eef2ff,#f8fafc);
}
.page-content{
    padding-top:120px;
    display:flex;
    justify-content:center;
}
.card{
    max-width:550px;
    width:100%;
    padding:35px;
    border-radius:20px;
    box-shadow:0 20px 40px rgba(0,0,0,.12);
}
label{font-weight:600;margin-top:12px;}
.btn-primary{
    background:#6366f1;border:none;border-radius:12px;font-weight:600;
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
                            <a  class="dropdown-item text-danger fw-semibold"
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
<div class="card">

<h4 class="text-center fw-bold mb-4">Add Officer</h4>

<form action="AddOfficerServlet" method="post">

    <label>Officer Name</label>
    <input type="text" name="name" class="form-control" required>

    <label>Department</label>
    <input type="text" name="department" class="form-control" required>
<label>Phone Number</label>
<input type="text"
       name="phone"
       class="form-control"
       placeholder="Enter phone number"
       required>

    <label>Email</label>
    <input type="email" name="email" class="form-control" required>

    <button class="btn btn-primary w-100 mt-3">
        Add Officer & Send Credentials
    </button>

</form>


</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
