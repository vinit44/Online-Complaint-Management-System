package servlet;

import java.io.IOException;
import java.util.List;

import dao.ComplaintDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Complaint;

@WebServlet("/OfficerDashboardServlet")
public class OfficerDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("officerUsername") == null) {
            response.sendRedirect("OfficerLogin.jsp");
            return;
        }

        String username = (String) session.getAttribute("officerUsername");
        System.out.println("Officer logged in: " + username);

        List<Complaint> complaints =
                ComplaintDAO.getComplaintsByOfficer(username);

        request.setAttribute("complaints", complaints);
        request.getRequestDispatcher("OfficerDashboard.jsp").forward(request, response);
    }
}
