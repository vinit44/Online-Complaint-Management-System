package servlet;

import dao.ComplaintDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Complaint;

import java.io.IOException;

@WebServlet("/AddComplaintServlet")
public class AddComplaintServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("UserLogin.jsp");
            return;
        }

        Complaint c = new Complaint();
        c.setCategory(request.getParameter("category"));
        c.setTitle(request.getParameter("title"));
        c.setDescription(request.getParameter("description"));
        c.setLocation(request.getParameter("location"));
        c.setUserEmail((String) session.getAttribute("userEmail"));

        boolean success = ComplaintDAO.addComplaint(c);

        if (success) {
            response.sendRedirect("UserDashboardServlet?added=true");
        } else {
            response.sendRedirect("AddComplaint.jsp?error=true");
        }
    }
}
