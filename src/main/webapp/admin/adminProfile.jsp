<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Profile | Admin Panel</title>
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
    color: #fff;
    display: flex;
    align-items: center;
    padding: 0 24px;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
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
    padding: 28px;
    max-width: 700px;
}

/* PASSWORD GROUP */
.password-group {
    position: relative;
}

.password-group input {
    padding-right: 44px;
}

/* EYE ICON */
.eye-icon {
    position: absolute;
    right: 14px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    font-size: 1rem;
    color: var(--text-muted);
    user-select: none;
}

.eye-icon:hover {
    color: var(--blue-main);
}

/* DISABLED INPUT */
.form-control:disabled {
    background: #f1f5f9;
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
    <a href="<%= request.getContextPath() %>/admin/adminDashboard.jsp">Dashboard</a>
    <a href="<%= request.getContextPath() %>/admin/adminComplaints.jsp">View Complaints</a>
    <a href="<%= request.getContextPath() %>/admin/adminAssignComplaint.jsp">Assign Complaint</a>
    <a class="active" href="<%= request.getContextPath() %>/admin/adminProfile.jsp">Profile</a>
    <a href="<%= request.getContextPath() %>/admin/adminLogout.jsp">Logout</a>
</div>

<!-- MAIN -->
<div class="admin-main">

    <h4 class="mb-4">Admin Profile</h4>

    <div class="content-card">
        <form action="UpdateAdminProfileServlet" method="post">

            <div class="mb-3">
                <label class="form-label">Admin Name</label>
                <input type="text" class="form-control admin-field"
                       value="System Administrator" disabled>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control"
                       value="admin@cms.com" disabled>
            </div>

            <div class="mb-3">
                <label class="form-label">Phone</label>
                <input type="text" class="form-control admin-field"
                       value="9999999999" disabled>
            </div>

            <hr>

            <h6 class="fw-semibold mb-3">Change Password</h6>

            <div class="mb-3">
                <label class="form-label">New Password</label>
                <div class="password-group">
                    <input type="password" id="newPassword"
                           class="form-control admin-field" disabled>
                    <span class="eye-icon"
                          onclick="togglePassword('newPassword')">👁</span>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">Confirm Password</label>
                <div class="password-group">
                    <input type="password" id="confirmPassword"
                           class="form-control admin-field" disabled>
                    <span class="eye-icon"
                          onclick="togglePassword('confirmPassword')">👁</span>
                </div>
            </div>

            <button type="button"
                    id="editBtn"
                    class="btn btn-outline-primary">
                Update Profile
            </button>

            <button type="submit"
                    id="saveBtn"
                    class="btn btn-primary d-none">
                Save Changes
            </button>

        </form>
    </div>

</div>

<!-- FOOTER -->
<div class="admin-footer">
    © 2025 Complaint Management System | Admin Panel
</div>

<script>
/* Enable fields */
document.getElementById("editBtn").onclick = function () {
    document.querySelectorAll(".admin-field").forEach(f => f.disabled = false);
    this.classList.add("d-none");
    document.getElementById("saveBtn").classList.remove("d-none");
};

/* Toggle password visibility */
function togglePassword(id) {
    const input = document.getElementById(id);
    input.type = input.type === "password" ? "text" : "password";
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
