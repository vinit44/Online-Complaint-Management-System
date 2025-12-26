package dao;

import model.Officer;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OfficerDAO {

    /* ================= GET ALL OFFICERS ================= */
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
                o.setUsername(rs.getString("username"));
                o.setEmail(rs.getString("email"));
                o.setPhone(rs.getString("phone"));
                o.setDepartment(rs.getString("department"));

                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    /* ================= ADD OFFICER ================= */
    public static boolean addOfficer(Officer o) {

        boolean result = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = """
                INSERT INTO officers
                (name, username, password, email, phone, department)
                VALUES (?, ?, ?, ?, ?, ?)
            """;

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, o.getName());
            ps.setString(2, o.getUsername());
            ps.setString(3, o.getPassword()); // (hash later)
            ps.setString(4, o.getEmail());
            ps.setString(5, o.getPhone());
            ps.setString(6, o.getDepartment());

            result = ps.executeUpdate() > 0;

        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("Officer already exists!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /* ================= LOGIN OFFICER ================= */
    public static Officer loginOfficer(String username, String password) {

        Officer o = null;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM officers WHERE username=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                o = new Officer();
                o.setId(rs.getInt("id"));
                o.setName(rs.getString("name"));
                o.setUsername(rs.getString("username"));
                o.setEmail(rs.getString("email"));
                o.setDepartment(rs.getString("department"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return o;
    }
    public static boolean officerExists(String email) {
        boolean exists = false;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT id FROM officers WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            exists = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }

}
