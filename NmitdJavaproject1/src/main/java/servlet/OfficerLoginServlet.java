package servlet;

import dao.OfficerDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Officer;

import java.io.IOException;

@WebServlet("/OfficerLoginServlet")
public class OfficerLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Officer officer = OfficerDAO.login(username, password);

        if (officer != null) {
            HttpSession session = request.getSession();
            
            session.setAttribute("officerUsername", officer.getUsername());

            response.sendRedirect("OfficerDashboardServlet");
        } else {
            response.sendRedirect("OfficerLogin.jsp?error=invalid");
        }
    }
}


