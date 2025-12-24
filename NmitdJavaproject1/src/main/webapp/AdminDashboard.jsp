<%@ page import="java.util.*,model.Complaint" %>

<%
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }

    List<Complaint> list = (List<Complaint>) request.getAttribute("complaints");
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet" href="css/compliant-theme.css">
</head>

<body>

<div class="page-content">
<div class="auth-card" style="max-width:900px">

<h3>Admin Dashboard</h3>

<table class="table">
<tr>
<th>ID</th>
<th>User</th>
<th>Category</th>
<th>Title</th>
<th>Status</th>
<th>Action</th>
</tr>

<% for (Complaint c : list) { %>
<tr>
<td><%= c.getId() %></td>
<td><%= c.getUserEmail() %></td>
<td><%= c.getCategory() %></td>
<td><%= c.getTitle() %></td>
<td><%= c.getStatus() %></td>
<td>
<a href="AssignComplaint.jsp?id=<%= c.getId() %>" class="btn btn-primary btn-sm">
Assign / Update
</a>
</td>
</tr>
<% } %>

</table>

</div>
</div>
</body>
</html>
