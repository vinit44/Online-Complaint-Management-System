package servlet;

import dao.ComplaintDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Complaint;

@WebServlet("/UserDashboardServlet")
public class UserDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("UserLogin.jsp");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");

        // 1️⃣ Fetch complaints WITH officer details
        List<Complaint> complaints =
                ComplaintDAO.getUserComplaintsWithOfficer(userEmail);

        // 2️⃣ Total complaints
        int total = complaints.size();

        // 3️⃣ Status counts
        Map<String, Integer> stats = new HashMap<>();
        stats.put("Pending", 0);
        stats.put("In-Progress", 0);
        stats.put("Resolved", 0);
        stats.put("Rejected", 0);

        for (Complaint c : complaints) {
            String status = c.getStatus();
            stats.put(status, stats.getOrDefault(status, 0) + 1);
        }

        // 4️⃣ Set ALL attributes BEFORE forward
        request.setAttribute("totalComplaints", total);
        request.setAttribute("stats", stats);
        request.setAttribute("complaints", complaints);

        // 5️⃣ Forward ONCE (last line)
        request.getRequestDispatcher("UserDashboard.jsp")
               .forward(request, response);
    }
}
