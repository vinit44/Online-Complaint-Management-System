package dao;

import model.Complaint;
import util.DBConnection;

import java.sql.*;
import java.util.*;

public class AdminComplaintDAO {

    public static List<Complaint> getAllComplaints() {

        List<Complaint> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM complaints ORDER BY created_at DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setCategory(rs.getString("category"));
                c.setTitle(rs.getString("title"));
                c.setStatus(rs.getString("status"));
                c.setUserEmail(rs.getString("user_email"));
                c.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
