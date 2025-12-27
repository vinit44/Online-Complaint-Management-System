package servlet;

import util.DBConnection;
import dao.OfficerDAO;
import model.Officer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

@WebServlet("/AssignComplaintServlet")
public class AssignComplaintServlet extends HttpServlet {

    // ================= ASSIGN COMPLAINT =================
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    int id = Integer.parseInt(request.getParameter("id"));
	    String assignedTo = request.getParameter("assignedTo");
	    String priority = request.getParameter("priority");
	    String remarks = request.getParameter("remarks");

	    System.out.println("Assigning to: " + assignedTo);
	    System.out.println("Priority: " + priority);
	    System.out.println("Remarks: " + remarks);

	    try (Connection con = DBConnection.getConnection()) {

	        String sql = """
	            UPDATE complaints
	            SET assigned_to = ?,
	                priority = ?,
	                admin_remarks = ?,
	                status = 'Assigned'
	            WHERE id = ?
	        """;

	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, assignedTo);
	        ps.setString(2, priority);
	        ps.setString(3, remarks);
	        ps.setInt(4, id);

	        ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    response.sendRedirect("AdminDashboardServlet?assigned=success");
	}

    // ================= LOAD ASSIGN PAGE =================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Officer> officers = OfficerDAO.getAllOfficers();

        // DEBUG – remove later
        System.out.println("Officers loaded: " + officers.size());

        request.setAttribute("officers", officers);
        request.getRequestDispatcher("AssignComplaint.jsp").forward(request, response);
    }
}
