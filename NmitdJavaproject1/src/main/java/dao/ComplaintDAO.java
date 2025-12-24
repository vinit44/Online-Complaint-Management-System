package dao;

import model.Complaint;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ComplaintDAO {

    public static boolean addComplaint(Complaint c) {

        boolean result = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = """
                INSERT INTO complaints
                (category, title, description, location, status, user_email)
                VALUES (?, ?, ?, ?, ?, ?)
            """;

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, c.getCategory());
            ps.setString(2, c.getTitle());
            ps.setString(3, c.getDescription());
            ps.setString(4, c.getLocation());
            ps.setString(5, "Pending");
            ps.setString(6, c.getUserEmail());

            result = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}

