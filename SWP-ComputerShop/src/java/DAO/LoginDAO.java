/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Admin;
import Entity.User1;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Untity.MD5;

/**
 *
 * @author vinh1
 */
public class LoginDAO extends DBContext {

    /**
     *
     * @param email
     * @param pass
     * @return
     */
    public User1 checkLoginUser(String email, String pass) {
        MD5 md5 = new MD5();
        String sql = "select * from [User] where Email =? and [Password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User1 u = new User1(rs.getInt("UserID"),
                        rs.getString("UserName"),
                        rs.getString("Address"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getString("Img"),
                        rs.getBoolean("Status"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println("error db");
        }
        return null;
    }

    public Admin checkLoginAdmin(String user, String pass) {
        MD5 md5 = new MD5();
        String sql = "select * from [Admin] where Email = ? and Password= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Admin u = new Admin(rs.getInt("AdminID"),
                        rs.getString("AdminName"),
                        rs.getString("Address"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"),
                        rs.getString("Img"),
                        rs.getBoolean("Status"));
                return u;

            }
        } catch (SQLException e) {
            System.out.println("error db");
        }
        return null;
    }

    public boolean checkDuplicate(String email) {
        
        String strSelect = "SELECT *  FROM [User] where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return false;
            }
        } catch (SQLException e) {
            System.err.println("error db" + e.getMessage());
        }
        return true;
    }

    public void createAccount(String username, String address, String phone, String email, String password) {
        MD5 md5 = new MD5();
        String insert = "insert into [User] "
                + "(UserName,Address,Phone,Email,Password)"
                + " values (?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(insert);
            ps.setString(1, username);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setString(5, md5.getMd5(password));
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Create Account Error!!");
        }
    }

    public boolean changePassword(String email, String newPassword) {
        MD5 md5 = new MD5();
        String update = "UPDATE [User] SET Password='"+md5.getMd5(newPassword)+"' WHERE  Email= '"+email+"'";
        try {
                PreparedStatement up = connection.prepareStatement(update);
                up.executeUpdate();
                return true;
            
        } catch (SQLException e) {
            System.out.println("Change Password Error");
        } 
        return false;
    }
    
}
