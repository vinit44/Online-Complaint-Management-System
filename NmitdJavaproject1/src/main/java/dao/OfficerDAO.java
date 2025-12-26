package dao;

import model.Officer;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OfficerDAO {
	 public static List<Officer> getAllOfficers() {

	        List<Officer> list = new ArrayList<>();

	        try {
	            Connection con = DBConnection.getConnection();
	            String sql = "SELECT * FROM officers ORDER BY name";

	            PreparedStatement ps = con.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                Officer o = new Officer();
	                o.setId(rs.getInt("id"));
	                o.setName(rs.getString("name"));
	                o.setDepartment(rs.getString("department"));
	                o.setEmail(rs.getString("email"));
	                list.add(o);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }

    // Add Officer
    public static boolean addOfficer(Officer o) {
        boolean result = false;

        try {
            Connection con = DBConnection.getConnection();
            String sql = """
                INSERT INTO officers (name, email, phone, department)
                VALUES (?, ?, ?, ?)
            """;

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, o.getName());
            ps.setString(2, o.getEmail());
            ps.setString(3, o.getPhone());
            ps.setString(4, o.getDepartment());

            result = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

   
}
