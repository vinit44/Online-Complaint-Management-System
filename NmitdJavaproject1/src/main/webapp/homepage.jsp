<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Complaint Management System | OCMS</title>
    
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

        /* Navbar Styling */
        .navbar {
            background: rgba(31, 41, 55, 0.95) !important;
            backdrop-filter: blur(10px);
            padding: 1rem 0;
        }

        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, rgba(31, 41, 55, 0.9) 0%, rgba(79, 70, 229, 0.8) 100%), 
                        url('https://images.unsplash.com/photo-1557683316-973673baf926?auto=format&fit=crop&q=80&w=2000');
            background-size: cover;
            background-position: center;
            min-height: 80vh;
            display: flex;
            align-items: center;
            position: relative;
        }

        .hero-title {
            font-weight: 800;
            letter-spacing: -1px;
            color: #ffffff;
        }

        .hero-text {
            color: rgba(255, 255, 255, 0.85);
            max-width: 700px;
            margin: 1.5rem auto;
        }

        /* Buttons */
        .btn-primary-custom {
            background-color: var(--primary-color);
            border: none;
            padding: 12px 30px;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-primary-custom:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.3);
        }

        .btn-outline-custom {
            border: 2px solid rgba(255, 255, 255, 0.5);
            padding: 10px 30px;
            border-radius: 12px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-outline-custom:hover {
            background: white;
            color: var(--dark-bg);
            border-color: white;
        }

        /* Feature Cards */
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
            border: none;
            border-radius: 20px;
            padding: 30px;
            background: #ffffff;
            transition: all 0.4s ease;
            border: 1px solid #e2e8f0;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.05);
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

        /* Footer */
        footer {
            background: var(--dark-bg);
            color: #94a3b8;
            padding: 40px 0;
            border-top: 1px solid #334155;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark shadow">
  <div class="container">
    <a class="navbar-brand fw-bold" href="#">OCMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navBar">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navBar">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="UserLogin.jsp">Login</a></li>
        <li class="nav-item"><a class="nav-link" href="UserRegister.jsp">Register</a></li>
      </ul>
    </div>
  </div>
</nav>

<section class="hero-section">
  <div class="container text-center">
    <h1 class="hero-title display-4">Online Complaint <br>Management System</h1>
    <p class="hero-text lead">
      Empowering citizens to report, resolve, and track issues with full transparency. 
      Experience a faster, more efficient way to manage grievances.
    </p>

    <div class="mt-5">
      <a href="UserLogin.jsp" class="btn btn-primary-custom text-white btn-lg me-3">Login to Dashboard</a>
      <a href="UserRegister.jsp" class="btn btn-outline-custom btn-lg">Create Account</a>
    </div>
  </div>
</section>

<section class="py-5">
  <div class="container py-5">
    <div class="text-center mb-5">
        <h2 class="section-title mb-3">System Features</h2>
        <p class="text-muted">Built for speed, security, and ease of use.</p>
    </div>

    <div class="row g-4 mt-2">
      <div class="col-md-4">
        <div class="card feature-card h-100">
          <div class="card-body text-center">
            <div class="feature-icon-wrapper">
                <span>📝</span>
            </div>
            <h5 class="fw-bold">Easy Registration</h5>
            <p class="text-muted">
              Quickly set up your profile and start filing complaints within minutes using our intuitive interface.
            </p>
          </div>
        </div>
      </div>

      <div class="col-md-4">
        <div class="card feature-card h-100">
          <div class="card-body text-center">
            <div class="feature-icon-wrapper">
                <span>📍</span>
            </div>
            <h5 class="fw-bold">Real-time Tracking</h5>
            <p class="text-muted">
              Get instant updates on the progress of your complaints. Monitor every step from filing to resolution.
            </p>
          </div>
        </div>
      </div>

      <div class="col-md-4">
        <div class="card feature-card h-100">
          <div class="card-body text-center">
            <div class="feature-icon-wrapper">
                <span>🛡️</span>
            </div>
            <h5 class="fw-bold">Secure Data</h5>
            <p class="text-muted">
              Your data is encrypted and protected. We ensure the highest level of privacy and session security.
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<footer>
    <div class="container text-center">
        <p class="mb-2">© 2025 Online Complaint Management System</p>
        <p class="small text-muted">Developed by <strong>Vinit Dabholkar</strong></p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>