package servlet;

import dao.OfficerDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/OfficerLoginServlet")
public class OfficerLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean valid = OfficerDAO.validateOfficer(username, password);

        if(valid){
            HttpSession session = request.getSession();
            session.setAttribute("officer", username);
            response.sendRedirect("OfficerDashboard.jsp");
        } else {
            response.sendRedirect("OfficerLogin.jsp?error=1");
        }
    }
}
