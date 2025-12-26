package servlet;

import util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Officer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import dao.OfficerDAO;

@WebServlet("/AssignComplaintServlet")
public class AssignComplaintServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String assignedTo = request.getParameter("assignedTo");
        String priority = request.getParameter("priority");
        String remarks = request.getParameter("remarks");

        try {
            Connection con = DBConnection.getConnection();
            String sql =
              "UPDATE complaints SET assigned_to=?, status='Assigned', admin_remarks=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, assignedTo);
            ps.setString(2, remarks);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("AdminDashboardServlet");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch officers from DB
        List<Officer> officers = OfficerDAO.getAllOfficers();

        // DEBUG (IMPORTANT)
        System.out.println("Officers count: " + officers.size());

        // Send to JSP
        request.setAttribute("officers", officers);

        request.getRequestDispatcher("AssignComplaint.jsp")
               .forward(request, response);
    }

}
