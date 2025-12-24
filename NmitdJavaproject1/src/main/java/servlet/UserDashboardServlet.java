package servlet;

import dao.DashboardDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Map;

@WebServlet("/UserDashboardServlet")
public class UserDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("UserLogin.jsp");
            return;
        }

        String email = (String) session.getAttribute("userEmail");

        int total = DashboardDAO.getTotalComplaints(email);
        Map<String, Integer> stats = DashboardDAO.getComplaintStats(email);

        request.setAttribute("totalComplaints", total);
        request.setAttribute("stats", stats);

        request.getRequestDispatcher("UserDashboard.jsp").forward(request, response);
    }
}
