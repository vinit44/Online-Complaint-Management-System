<%@ page contentType="text/html; charset=UTF-8" %>

<%
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Complaint</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --primary-color: #6366f1;
            --primary-hover: #4f46e5;
            --bg-gradient: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            --card-bg: #ffffff;
            --text-main: #1f2937;
            --text-muted: #6b7280;
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
        }

        /* Page Layout */
        .page-content {
            padding: 100px 15px 60px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Form Card */
        .auth-card {
            background: var(--card-bg);
            width: 100%;
            max-width: 600px;
            padding: 45px 40px;
            border-radius: 28px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.6s ease-out;
        }

        .auth-card h3 {
            font-weight: 700;
            margin-bottom: 10px;
            color: var(--text-main);
        }

        /* Form Elements */
        label {
            font-weight: 600;
            font-size: 0.875rem;
            margin-bottom: 8px;
            display: block;
            color: #374151;
        }

        .form-control, .form-select {
            padding: 12px 16px;
            border-radius: 12px;
            border: 1px solid #e5e7eb;
            background-color: #f9fafb;
            font-size: 0.95rem;
            transition: all 0.2s ease;
        }

        .form-control:focus, .form-select:focus {
            background-color: #fff;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
            outline: none;
        }

        textarea.form-control {
            resize: none;
        }

        /* Buttons */
        .btn-primary-custom {
            background-color: var(--primary-color);
            border: none;
            padding: 14px;
            border-radius: 12px;
            font-weight: 700;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-primary-custom:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.3);
            color: white;
        }

        .btn-outline-custom {
            border: 1px solid #e5e7eb;
            padding: 12px;
            border-radius: 12px;
            font-weight: 600;
            color: var(--text-muted);
            transition: all 0.2s ease;
        }

        .btn-outline-custom:hover {
            background-color: #f9fafb;
            color: var(--text-main);
            border-color: #d1d5db;
        }

        /* Footer */
        .app-footer {
            text-align: center;
            padding: 25px;
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
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
    <div class="auth-card" style="max-width:650px;">

        <h3 class="text-center">Register New Complaint</h3>
        <p class="text-center text-muted">Provide accurate details for faster resolution</p>

        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger text-center">
                Failed to submit complaint. Try again.
            </div>
        <% } %>

        <form action="AddComplaintServlet" method="post">

            <div class="mb-3">
                <label>Category</label>
                <select name="category" class="form-control" required>
                    <option value="">-- Select Category --</option>
                    <option>Lost & Found</option>
                    <option>Theft</option>
                    <option>Harassment</option>
                    <option>Fraud</option>
                    <option>Other</option>
                </select>
            </div>

            <div class="mb-3">
                <label>Complaint Title</label>
                <input type="text" name="title" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Description</label>
                <textarea name="description" rows="4" class="form-control" required></textarea>
            </div>

            <div class="mb-3">
                <label>Location</label>
                <input type="text" name="location" class="form-control" placeholder="City / Area">
            </div>

            <button type="submit" class="btn btn-primary w-100">
                Submit Complaint
            </button>

            <a href="UserDashboardServlet" class="btn btn-outline-secondary w-100 mt-2">
                Cancel
            </a>
        </form>

    </div>
</main>

<footer class="app-footer">
    © 2025 Online Complaint Management System
</footer>

</body>
</html>
