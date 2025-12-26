<%@ page %>
<%
    if(session==null || session.getAttribute("officer")==null){
        response.sendRedirect("OfficerLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Officer Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand">OCMS Officer</span>
    <a href="OfficerLogoutServlet" class="btn btn-danger btn-sm">Logout</a>
</nav>

<div class="container mt-5">
    <h3>Welcome Officer 👮</h3>
    <p>You can now view and update assigned complaints.</p>
</div>

</body>
</html>
