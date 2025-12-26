package servlet;

import dao.ComplaintDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Complaint;

import java.io.IOException;
import java.util.List;

@WebServlet("/ViewComplaintsServlet")
public class ViewComplaintsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("UserLogin.jsp");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");

        List<Complaint> complaints =
                ComplaintDAO.getComplaintsByUser(userEmail);

        request.setAttribute("complaints", complaints);

        request.getRequestDispatcher("ViewComplaints.jsp")
               .forward(request, response);
    }
}
