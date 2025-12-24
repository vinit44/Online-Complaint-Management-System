<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>
<link rel="stylesheet" href="css/compliant-theme.css">
</head>

<body>
<div class="page-content">
    <div class="auth-card">
        <h3>Admin Login</h3>

        <form action="AdminLoginServlet" method="post">
            <label>Username</label>
            <input type="text" name="username" class="form-control" required>

            <label>Password</label>
            <input type="password" name="password" class="form-control" required>

            <button class="btn btn-primary w-100 mt-3">Login</button>
        </form>
    </div>
</div>
</body>
</html>
