package dao;

import model.Complaint;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public static List<Complaint> getComplaintsByOfficer(String username) {

        List<Complaint> list = new ArrayList<>();
        System.out.println("Fetching complaints for: " + username);

        try {
            Connection con = DBConnection.getConnection();

            String sql = """
                SELECT id, title, priority, status, admin_remarks
                FROM complaints
                WHERE assigned_to = ?
            """;

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setTitle(rs.getString("title"));
                c.setPriority(rs.getString("priority"));
                c.setStatus(rs.getString("status"));
                c.setAdminRemarks(rs.getString("admin_remarks"));
                list.add(c);
            }

            System.out.println("Officer complaints fetched: " + list.size());

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updateStatusByOfficer(int id, String status, String remarks) {

        boolean result = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = """
                UPDATE complaints
                SET status = ?, admin_remarks = ?, updated_at = NOW()
                WHERE id = ?
            """;

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, remarks);
            ps.setInt(3, id);

            result = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public static int getTotalComplaintsByUser(String userEmail) {

        int total = 0;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT COUNT(*) FROM complaints WHERE user_email = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userEmail);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }
    public static Map<String, Integer> getComplaintStatsByUser(String userEmail) {

        Map<String, Integer> stats = new HashMap<>();

        // Default values
        stats.put("Pending", 0);
        stats.put("In-Progress", 0);
        stats.put("Resolved", 0);
        stats.put("Rejected", 0);

        try {
            Connection con = DBConnection.getConnection();

            String sql = """
                SELECT status, COUNT(*) AS count
                FROM complaints
                WHERE user_email = ?
                GROUP BY status
            """;

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userEmail);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                stats.put(
                    rs.getString("status"),
                    rs.getInt("count")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return stats;
    }
    public static List<Complaint> getUserComplaintsWithOfficer(String userEmail) {

        List<Complaint> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = """
                SELECT c.*, o.name AS officer_name, o.phone AS officer_phone
                FROM complaints c
                LEFT JOIN officers o ON c.assigned_to = o.username
                WHERE c.user_email = ?
                ORDER BY c.created_at DESC
            """;

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userEmail);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setTitle(rs.getString("title"));
                c.setStatus(rs.getString("status"));
                c.setPriority(rs.getString("priority"));
                c.setAssignedTo(rs.getString("assigned_to"));
                c.setAdminRemarks(rs.getString("admin_remarks"));

                // officer info
                c.setOfficerName(rs.getString("officer_name"));
                c.setOfficerPhone(rs.getString("officer_phone"));

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}

