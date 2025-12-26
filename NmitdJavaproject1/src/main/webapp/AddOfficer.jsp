<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Officer | OCMS Admin</title>

<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
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



<div class="page-content">
<div class="card">

<h4 class="text-center fw-bold mb-4">Add Officer</h4>

<form action="AddOfficerServlet" method="post">

<label>Officer Name</label>
<input type="text" name="name" class="form-control" required>

<label>Email</label>
<input type="email" name="email" class="form-control" required>

<label>Phone</label>
<input type="text" name="phone" class="form-control">

<label>Department</label>
<input type="text" name="department" class="form-control">

<button class="btn btn-primary w-100 mt-4">Add Officer</button>

</form>

</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
