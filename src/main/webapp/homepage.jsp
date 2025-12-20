<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Online Complaint Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    html, body {
        height: 100%;
    }

    body {
        font-family: "Segoe UI", sans-serif;
        background-color: #f4f6f9;
        display: flex;
        flex-direction: column;
    }

    /* NAVBAR */
   /* NAVBAR FONT & STYLE */
.navbar {
    padding: 14px 0;
    font-family: 'Poppins', sans-serif;
}

.navbar-brand {
    font-size: 1.25rem;
    font-weight: 600;
    letter-spacing: 0.3px;
}

.nav-link {
    font-size: 0.95rem;
    font-weight: 500;
    color: #e9ecef !important;
    margin-left: 14px;
    transition: color 0.2s ease;
}

.nav-link:hover,
.nav-link.active {
    color: #ffffff !important;
}

.dropdown-menu {
    font-family: 'Poppins', sans-serif;
    font-size: 0.9rem;
}


    /* HERO */
    .hero {
        background: linear-gradient(135deg, #1d6efd, #4facfe);
        color: #fff;
        padding: 90px 20px;
        text-align: center;
    }

    .hero h1 {
        font-size: 2.8rem;
        font-weight: 600;
    }

    .hero p {
        font-size: 1.1rem;
        margin-top: 12px;
        opacity: 0.95;
    }

    .hero .btn {
        padding: 10px 22px;
        font-size: 1rem;
        border-radius: 8px;
    }

    /* FEATURES */
    .features {
        padding: 60px 0;
    }

    .feature-card {
        background: #fff;
        border-radius: 14px;
        padding: 30px;
        text-align: center;
        box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        transition: all 0.25s ease;
        height: 100%;
    }

    .feature-card:hover {
        transform: translateY(-6px);
        box-shadow: 0 12px 26px rgba(0,0,0,0.12);
    }

    .feature-card h5 {
        font-weight: 600;
        margin-bottom: 10px;
    }

    .feature-card p {
        color: #6c757d;
        font-size: 0.95rem;
    }

    /* FOOTER */
    footer {
        background: #212529;
        color: #adb5bd;
        padding: 16px 0;
        text-align: center;
        margin-top: auto;
        font-size: 0.9rem;
    }
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="homepage.jsp">
            Complaint Management System
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-lg-center">
                <li class="nav-item">
                    <a class="nav-link active" href="homepage.jsp">Home</a>
                </li>

                <!-- LOGIN AS DROPDOWN -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button"
                       data-bs-toggle="dropdown">
                        Login As
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li>
                            <a class="dropdown-item" href="<%= request.getContextPath() %>/UserLogin.jsp">User Login</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="<%= request.getContextPath() %>/admin/adminLogin.jsp">Admin Login</a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/UserRegister.jsp">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- HERO -->
<section class="hero">
    <div class="container">
        <h1>Online Complaint Management System</h1>
        <p>
            Register complaints, track status, and get faster resolutions
            through a transparent and secure platform.
        </p>

        <div class="mt-4">
            <a href="UserRegister.jsp" class="btn btn-light me-2">
                Register Complaint
            </a>
            <a href="login.jsp" class="btn btn-outline-light">
                Track Complaint
            </a>
        </div>
    </div>
</section>

<!-- FEATURES -->
<section class="features">
    <div class="container">
        <div class="row text-center mb-5">
            <h2 class="fw-semibold">System Highlights</h2>
            <p class="text-muted mt-2">
                Simple, reliable, and efficient complaint handling
            </p>
        </div>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="feature-card">
                    <h5>Easy Complaint Registration</h5>
                    <p>
                        Submit complaints with category, description,
                        location, and optional proof documents.
                    </p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="feature-card">
                    <h5>Real-Time Tracking</h5>
                    <p>
                        Track complaint status like Pending, In-Progress,
                        Resolved, or Rejected at any time.
                    </p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="feature-card">
                    <h5>Admin Control Panel</h5>
                    <p>
                        Admin can assign complaints, update status,
                        manage users, and generate reports.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer>
    © 2025 Online Complaint Management System |
    JSP · Servlets · JDBC · MySQL
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
