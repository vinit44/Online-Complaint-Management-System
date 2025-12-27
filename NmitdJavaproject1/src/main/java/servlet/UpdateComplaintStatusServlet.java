package servlet;

import dao.ComplaintDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/UpdateComplaintStatusServlet")
public class UpdateComplaintStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");
        String remarks = request.getParameter("remarks");

        boolean updated = ComplaintDAO.updateStatusByOfficer(id, status, remarks);

        // Always redirect back to dashboard
        response.sendRedirect("OfficerDashboardServlet");
    }
}
