package dao;


import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class DashboardDAO {

    public static Map<String, Integer> getComplaintStats(String userEmail) {
        Map<String, Integer> stats = new HashMap<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql =
                "SELECT status, COUNT(*) AS total FROM complaints WHERE user_email=? GROUP BY status";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userEmail);

            ResultSet rs = ps.executeQuery();

            // default values
            stats.put("Pending", 0);
            stats.put("In-Progress", 0);
            stats.put("Resolved", 0);
            stats.put("Rejected", 0);

            while (rs.next()) {
                stats.put(rs.getString("status"), rs.getInt("total"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return stats;
    }

    public static int getTotalComplaints(String userEmail) {
        int total = 0;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT COUNT(*) FROM complaints WHERE user_email=?";
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
}

