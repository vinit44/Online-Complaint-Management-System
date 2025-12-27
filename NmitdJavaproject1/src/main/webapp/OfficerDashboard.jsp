<%@ page import="java.util.*, model.Complaint" %>

<style>
/* ===== PAGE ===== */
body {
    font-family: 'Plus Jakarta Sans', sans-serif;
    background: linear-gradient(135deg, #eef2ff, #f8fafc);
    padding: 40px;
}

/* Heading */
h3 {
    font-weight: 700;
    margin-bottom: 20px;
    color: #111827;
}

/* Empty state */
.no-data {
    background: #fff;
    padding: 20px;
    border-radius: 14px;
    color: #6b7280;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
}

/* ===== TABLE ===== */
.table {
    background: transparent;
    border-collapse: separate;
    border-spacing: 0 12px;
}

.table thead th {
    background: #f1f5f9;
    padding: 14px;
    font-size: 0.85rem;
    text-transform: uppercase;
    color: #374151;
    border: none;
}

.table tbody tr {
    background: #ffffff;
    border-radius: 18px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.06);
    transition: transform 0.25s ease;
}

.table tbody tr:hover {
    transform: translateY(-3px);
}

.table td {
    padding: 14px;
    border: none;
    vertical-align: top;
    font-size: 0.9rem;
}

/* ===== STATUS COLORS ===== */
.status-assigned {
    color: #f59e0b;
    font-weight: 700;
}

.status-progress {
    color: #3b82f6;
    font-weight: 700;
}

.status-resolved {
    color: #10b981;
    font-weight: 700;
}

/* ===== ACTION FORMS ===== */
textarea.form-control {
    border-radius: 12px;
    resize: none;
    font-size: 0.85rem;
}

button.btn-sm {
    border-radius: 12px;
    font-weight: 600;
}

/* ===== BADGE ===== */
.badge {
    padding: 8px 14px;
    border-radius: 999px;
    font-size: 0.8rem;
}

/* ===== MOBILE ===== */
@media (max-width: 768px) {
    body {
        padding: 15px;
    }

    .table thead {
        display: none;
    }

    .table tbody tr {
        display: block;
        margin-bottom: 15px;
    }

    .table td {
        display: flex;
        justify-content: space-between;
    }

    .table td::before {
        content: attr(data-label);
        font-weight: 600;
        color: #6b7280;
    }
}
</style>

<h3>My Assigned Complaints</h3>

<%
    List<Complaint> complaints =
        (List<Complaint>) request.getAttribute("complaints");
%>

<% if (complaints == null || complaints.isEmpty()) { %>

    <div class="no-data">
        No complaints assigned to you.
    </div>

<% } else { %>

<table class="table table-hover">
<thead>
<tr>
    <th>ID</th>
    <th>Title</th>
    <th>Priority</th>
    <th>Status</th>
    <th>Remarks</th>
    <th>Action</th>
</tr>
</thead>

<tbody>
<% for (Complaint c : complaints) { %>
<tr>
    <td data-label="ID">#<%= c.getId() %></td>
    <td data-label="Title"><%= c.getTitle() %></td>
    <td data-label="Priority"><%= c.getPriority() %></td>

    <td data-label="Status"
        class="<%= 
            c.getStatus().equals("Assigned") ? "status-assigned" :
            c.getStatus().equals("In Progress") ? "status-progress" :
            "status-resolved"
        %>">
        <%= c.getStatus() %>
    </td>

    <td data-label="Remarks">
        <%= c.getAdminRemarks() != null ? c.getAdminRemarks() : "-" %>
    </td>

    <td data-label="Action">

        <% if ("Assigned".equals(c.getStatus())) { %>
            <form action="UpdateComplaintStatusServlet" method="post">
                <input type="hidden" name="id" value="<%= c.getId() %>">
                <input type="hidden" name="status" value="In Progress">
                <textarea name="remarks" class="form-control mb-2"
                          placeholder="Work started..." required></textarea>
                <button class="btn btn-warning btn-sm w-100">
                    Start Work
                </button>
            </form>

        <% } else if ("In Progress".equals(c.getStatus())) { %>
            <form action="UpdateComplaintStatusServlet" method="post">
                <input type="hidden" name="id" value="<%= c.getId() %>">
                <input type="hidden" name="status" value="Resolved">
                <textarea name="remarks" class="form-control mb-2"
                          placeholder="Work completed..." required></textarea>
                <button class="btn btn-success btn-sm w-100">
                    Mark Resolved
                </button>
            </form>

        <% } else { %>
            <span class="badge bg-success">Completed</span>
        <% } %>

    </td>
</tr>
<% } %>
</tbody>
</table>

<% } %>
