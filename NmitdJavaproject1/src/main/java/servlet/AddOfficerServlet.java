package servlet;

import dao.OfficerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Officer;
import util.EmailUtil;   // ✅ IMPORT THIS

import java.io.IOException;
import java.util.UUID;

@WebServlet("/AddOfficerServlet")
public class AddOfficerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String department = request.getParameter("department");

        // Check if officer exists
        if (OfficerDAO.officerExists(email)) {
            response.sendRedirect("AddOfficer.jsp?error=exists");
            return;
        }

        // Auto-generate credentials
        String username = email.split("@")[0];
        String password = UUID.randomUUID().toString().substring(0, 8);

        Officer o = new Officer();
        o.setName(name);
        o.setEmail(email);
        o.setPhone(phone);
        o.setDepartment(department);
        o.setUsername(username);
        o.setPassword(password);

        boolean added = OfficerDAO.addOfficer(o);

        if (added) {

            // ✅ THIS LINE WAS MISSING
            EmailUtil.sendOfficerCredentials(email, username, password);

            response.sendRedirect("AdminDashboardServlet?officerAdded=success");
        } else {
            response.sendRedirect("AddOfficer.jsp?error=failed");
        }
    }
}
