package servlet;

import dao.AdminComplaintDAO;
import dao.OfficerDAO;
import model.Complaint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("AdminLogin.jsp");
            return;
        }

        List<Complaint> complaints = AdminComplaintDAO.getAllComplaints();
        request.setAttribute("complaints", complaints);
        request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
        
    }
}
