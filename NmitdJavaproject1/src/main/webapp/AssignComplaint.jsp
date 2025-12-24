<!DOCTYPE html>
<html>
<head>
<title>Assign Complaint</title>
<link rel="stylesheet" href="css/compliant-theme.css">
</head>

<body>

<div class="page-content">
<div class="auth-card">

<h3>Assign Complaint</h3>

<form action="AssignComplaintServlet" method="post">
<input type="hidden" name="id" value="<%= request.getParameter("id") %>">

<label>Assign To</label>
<input type="text" name="assignedTo" class="form-control" required>

<label>Priority</label>
<select name="priority" class="form-control">
<option>Low</option>
<option>Medium</option>
<option>High</option>
<option>Critical</option>
</select>

<label>Remarks</label>
<textarea name="remarks" class="form-control"></textarea>

<button class="btn btn-primary w-100 mt-3">Assign</button>
</form>

</div>
</div>
</body>
</html>
