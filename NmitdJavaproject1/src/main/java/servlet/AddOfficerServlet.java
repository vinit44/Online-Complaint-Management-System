package servlet;

import dao.OfficerDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import model.Officer;

import java.io.IOException;

@WebServlet("/AddOfficerServlet")
public class AddOfficerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("AdminLogin.jsp");
            return;
        }

        Officer o = new Officer();
        o.setName(request.getParameter("name"));
        o.setEmail(request.getParameter("email"));
        o.setPhone(request.getParameter("phone"));
        o.setDepartment(request.getParameter("department"));

        boolean success = OfficerDAO.addOfficer(o);

        if (success) {
            response.sendRedirect("AdminDashboardServlet?officerAdded=1");
        } else {
            response.sendRedirect("AdminDashboardServlet?officerError=1");
        }
    }
}
