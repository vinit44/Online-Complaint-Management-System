package dao;

import model.Complaint;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ComplaintDAO {
	public static List<Complaint> getComplaintsByUser(String userEmail) {

        List<Complaint> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = """
                SELECT * FROM complaints
                WHERE user_email = ?
                ORDER BY created_at DESC
            """;

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userEmail);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setCategory(rs.getString("category"));
                c.setTitle(rs.getString("title"));
                c.setDescription(rs.getString("description"));
                c.setLocation(rs.getString("location"));
                c.setStatus(rs.getString("status"));
                c.setUserEmail(rs.getString("user_email"));
                c.setAssignedTo(rs.getString("assigned_to"));
                c.setAdminRemarks(rs.getString("admin_remarks"));
                c.setCreatedAt(rs.getTimestamp("created_at"));
                c.setUpdatedAt(rs.getTimestamp("updated_at"));

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


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

