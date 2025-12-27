package servlet;

import dao.ComplaintDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Complaint;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,
	    maxFileSize = 10 * 1024 * 1024,
	    maxRequestSize = 15 * 1024 * 1024
	)
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
        Part filePart = request.getPart("proofFile");
        String filePath = null;

        if (filePart != null && filePart.getSize() > 0) {

            String uploadDir = getServletContext().getRealPath("") +
                    "uploads/complaints";

            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String fileName = System.currentTimeMillis() + "_" +
                    Paths.get(filePart.getSubmittedFileName()).getFileName();

            filePath = "uploads/complaints/" + fileName;
            filePart.write(uploadDir + File.separator + fileName);
        }

        Complaint c = new Complaint();
        c.setCategory(request.getParameter("category"));
        c.setTitle(request.getParameter("title"));
        c.setDescription(request.getParameter("description"));
        c.setLocation(request.getParameter("location"));
        c.setUserEmail((String) session.getAttribute("userEmail"));
        c.setProofFile(filePath);
        boolean success = ComplaintDAO.addComplaint(c);

        if (success) {
            response.sendRedirect("UserDashboardServlet?added=true");
        } else {
            response.sendRedirect("AddComplaint.jsp?error=true");
        }
    }
}
