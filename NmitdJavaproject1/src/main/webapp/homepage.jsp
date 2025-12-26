<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Complaint Management System | OCMS</title>

    <!-- Fonts & Bootstrap -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --primary-color: #6366f1;
            --primary-hover: #4f46e5;
            --dark-bg: #1f2937;
            --light-bg: #f8fafc;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--light-bg);
            color: #334155;
        }

        /* ================= NAVBAR ================= */
        .navbar {
            background: rgba(31, 41, 55, 0.95) !important;
            backdrop-filter: blur(10px);
            padding: 1rem 0;
        }

        /* Pill Buttons */
        .login-pill {
            background: #ffffff;
            color: #1f2937 !important;
            padding: 8px 22px;
            border-radius: 90px;
            font-weight: 600;
            transition: 0.25s;
        }

        .login-pill:hover {
            background: #f1f5f9;
        }

        .register-pill {
            background: #4f46e5;
            color: #ffffff !important;
            padding: 8px 22px;
            border-radius: 999px;
            font-weight: 600;
            text-decoration: none;
            transition: 0.25s;
        }

        .register-pill:hover {
            background: #4338ca;
        }

        .login-dropdown {
            border-radius: 14px;
            border: 1px solid #e5e7eb;
            padding: 6px;
        }

        .login-dropdown .dropdown-item {
            border-radius: 10px;
            padding: 10px 14px;
            font-weight: 500;
        }

        .login-dropdown .dropdown-item:hover {
            background: #eef2ff;
        }

        /* ================= HERO ================= */
        .hero-section {
            background: linear-gradient(135deg, rgba(31, 41, 55, 0.9), rgba(79, 70, 229, 0.85)),
            url('https://images.unsplash.com/photo-1557683316-973673baf926?auto=format&fit=crop&q=80&w=2000');
            background-size: cover;
            background-position: center;
            min-height: 80vh;
            display: flex;
            align-items: center;
            text-align: center;
        }

        .hero-title {
            font-weight: 800;
            color: #ffffff;
        }

        .hero-text {
            color: rgba(255, 255, 255, 0.85);
            max-width: 700px;
            margin: 1.5rem auto;
        }

        .btn-primary-custom {
            background-color: var(--primary-color);
            border: none;
            padding: 12px 30px;
            border-radius: 12px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-primary-custom:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px rgba(99, 102, 241, 0.3);
        }

        .btn-outline-custom {
            border: 2px solid rgba(255, 255, 255, 0.6);
            padding: 10px 30px;
            border-radius: 12px;
            font-weight: 600;
            color: #ffffff;
        }

        .btn-outline-custom:hover {
            background: #ffffff;
            color: var(--dark-bg);
        }

        /* ================= FEATURES ================= */
        .section-title {
            font-weight: 700;
            color: var(--dark-bg);
            position: relative;
            padding-bottom: 15px;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background: var(--primary-color);
            border-radius: 2px;
        }

        .feature-card {
            border-radius: 20px;
            padding: 30px;
            border: 1px solid #e2e8f0;
            transition: 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 25px rgba(0, 0, 0, 0.05);
            border-color: var(--primary-color);
        }

        .feature-icon-wrapper {
            width: 60px;
            height: 60px;
            background: rgba(99, 102, 241, 0.1);
            color: var(--primary-color);
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 1.5rem;
        }

        /* ================= FOOTER ================= */
        footer {
            background: var(--dark-bg);
            color: #94a3b8;
            padding: 40px 0;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">OCMS</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navBar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navBar">
            <ul class="navbar-nav ms-auto align-items-center gap-2">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle login-pill"
                       href="#" role="button" data-bs-toggle="dropdown">
                        Login
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow login-dropdown">
                        <li><a class="dropdown-item" href="UserLogin.jsp">👤 User Login</a></li>
                        <li><a class="dropdown-item text-danger" href="AdminLogin.jsp">🛡️ Admin Login</a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="UserRegister.jsp" class="register-pill">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- HERO -->
<section class="hero-section">
    <div class="container">
        <h1 class="hero-title display-4">Online Complaint <br>Management System</h1>
        <p class="hero-text lead">
            Report, track, and resolve complaints with transparency and efficiency.
        </p>

        <div class="mt-5">
            <a href="UserLogin.jsp" class="btn btn-primary-custom text-white btn-lg me-3">
                Login to Dashboard
            </a>
            <a href="UserRegister.jsp" class="btn btn-outline-custom btn-lg">
                Create Account
            </a>
        </div>
    </div>
</section>

<!-- FEATURES -->
<section class="py-5">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h2 class="section-title mb-3">System Features</h2>
            <p class="text-muted">Built for speed, security, and ease of use.</p>
        </div>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="feature-card text-center h-100">
                    <div class="feature-icon-wrapper">📝</div>
                    <h5 class="fw-bold">Easy Registration</h5>
                    <p class="text-muted">Quick onboarding and complaint submission.</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="feature-card text-center h-100">
                    <div class="feature-icon-wrapper">📍</div>
                    <h5 class="fw-bold">Real-time Tracking</h5>
                    <p class="text-muted">Track your complaint status live.</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="feature-card text-center h-100">
                    <div class="feature-icon-wrapper">🛡️</div>
                    <h5 class="fw-bold">Secure System</h5>
                    <p class="text-muted">Role-based secure access and data protection.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer>
    <div class="container text-center">
        <p class="mb-2">© 2025 Online Complaint Management System</p>
        <p class="small">Developed by <strong>Vinit Dabholkar</strong></p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
