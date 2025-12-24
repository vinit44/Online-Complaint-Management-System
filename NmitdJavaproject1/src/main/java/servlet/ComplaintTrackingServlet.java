package servlet;

import dao.ComplaintTrackingDAO;
import model.Complaint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/ComplaintTrackingServlet")
public class ComplaintTrackingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("UserLogin.jsp");
            return;
        }

        String email = (String) session.getAttribute("userEmail");

        List<Complaint> complaints =
                ComplaintTrackingDAO.getUserComplaints(email);

        request.setAttribute("complaintList", complaints);
        request.getRequestDispatcher("TrackComplaints.jsp")
               .forward(request, response);
    }
}
