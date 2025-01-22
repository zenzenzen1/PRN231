/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Admin1;
import Entity.Role;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class AdminDAO extends DBContext {

    public List<Admin1> getListAdmin() {
        List<Admin1> data = new ArrayList<>();
        RoleDAO rdb = new RoleDAO();
        try {
            String strSelect = "SELECT [AdminID]\n"
                    + "      ,[AdminName]\n"
                    + "      ,[Address]\n"
                    + "      ,[Phone]\n"
                    + "      ,[Email]\n"
                    + "      ,[RoleID]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[Admin]";
            PreparedStatement st = connection.prepareStatement(strSelect);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt(1);
                String UserName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                Role role = rdb.getRole(rs.getInt(6));
                boolean status = rs.getBoolean(7);
                Admin1 admin = new Admin1(UserID, UserName, Address, Phone, Email, "", role, "", status);
                data.add(admin);
            }
        } catch (Exception e) {
            System.out.println("getListAdmin: " + e.getMessage());
        }
        return data;
    }

    public Admin1 getAdmin(int adminID) {
        RoleDAO rdb = new RoleDAO();
        try {
            String strSelect = "SELECT [AdminID]\n"
                    + "      ,[AdminName]\n"
                    + "      ,[Address]\n"
                    + "      ,[Phone]\n"
                    + "      ,[Email]\n"
                    + "      ,[RoleID]\n"
                    + "      ,[img]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[Admin] where AdminID = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setInt(1, adminID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int UserID = rs.getInt(1);
                String UserName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                Role role = rdb.getRole(rs.getInt(6));
                String img = rs.getString(7);
                boolean status = rs.getBoolean(8);
                Admin1 admin = new Admin1(UserID, UserName, Address, Phone, Email, "", role, img, status);
                return admin;
            }
        } catch (Exception e) {
            System.out.println("getAdmin: " + e.getMessage());
        }
        return null;
    }
    
    public Admin1 getAdminAccount(int adminID) {
        RoleDAO rdb = new RoleDAO();
        try {
            String strSelect = "SELECT [AdminID]\n"
                    + "      ,[AdminName]\n"
                    + "      ,[Address]\n"
                    + "      ,[Phone]\n"
                    + "      ,[Email]\n"
                    + "      ,[RoleID]\n"
                    + "      ,[img]\n"
                    + "      ,[status]\n"
                    + "      ,[Password]\n"
                    + "  FROM [dbo].[Admin] where AdminID = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setInt(1, adminID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int UserID = rs.getInt(1);
                String UserName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                Role role = rdb.getRole(rs.getInt(6));
                String img = rs.getString(7);
                String pass = rs.getString(9);
                boolean status = rs.getBoolean(8);
                Admin1 admin = new Admin1(UserID, UserName, Address, Phone, Email, pass, role, img, status);
                return admin;
            }
        } catch (Exception e) {
            System.out.println("getAdminAccount: " + e.getMessage());
        }
        return null;
    }

    public int getSizeOfList(String key) {
        String sql = "select count(AdminID) \n"
                + "FROM [dbo].[Admin]\n"
                + "where status = 0";
        if (key != null && !key.isEmpty()) {
            sql += "and (AdminName like N'%" + key.trim() + "%' or Address like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'";
            try {
                int key_num = Integer.parseInt(key);
                sql += " or AdminID = " + key + ")";
            } catch (Exception e) {
                sql += ")";
            }
        }
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getSizeOfListA: " + e);
        }
        return 0;
    }

    public List<Admin1> getListByPage(int start, int top, String key) {
        List<Admin1> data = new ArrayList<>();
        RoleDAO rdb = new RoleDAO();
        String sql = "SELECT  top " + top + " [AdminID]\n"
                + "      ,[AdminName]\n"
                + "      ,[Address]\n"
                + "      ,[Phone]\n"
                + "      ,[Email]\n"
                + "      ,[RoleID]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Admin]"
                + " where status = 0"
                + "  and AdminID > all (SELECT top " + start + " AdminID\n"
                + "			FROM [dbo].[Admin]\n"
                + "		where status = 0 ";
        try {
            if (key != null && !key.isEmpty()) {
                sql += "and (AdminName like N'%" + key.trim() + "%' or Address like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'))";
                sql += "and (AdminName like N'%" + key.trim() + "%' or Address like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'";
                try {
                    int key_num = Integer.parseInt(key);
                    sql += " or UserID = " + key + ")";
                } catch (Exception e) {
                    sql += ")";
                }
            } else {
                sql += ")";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int adminID = rs.getInt(1);
                String adminName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                Role role = rdb.getRole(rs.getInt(6));
                boolean status = rs.getBoolean(7);
                if (!status) {
                    Admin1 admin = new Admin1(adminID, adminName, Address, Phone, Email, "", role, "", status);
                    data.add(admin);
                }
            }
        } catch (SQLException e) {
            System.out.println("getListByPageA: " + e);
        }
        return data;
    }

    public void deleteStaff(int id) {
        try {
            String strSelect = "UPDATE [Admin] SET status = 1 WHERE AdminID = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setInt(1, id);
            st.executeQuery();
        } catch (Exception e) {
            System.out.println("deleteAdmin: " + e.getMessage());
        }
    }
    
    public void undoStaff(int id) {
        try {
            String strSelect = "UPDATE [Admin] SET status = 0 WHERE AdminID = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setInt(1, id);
            st.executeQuery();
        } catch (Exception e) {
            System.out.println("undoAdmin: " + e.getMessage());
        }
    }

    public void deleteStaffBox(String[] id) {
        try {
            String str = "UPDATE [Admin] SET status = 1 WHERE AdminID = ?";
            PreparedStatement st = connection.prepareStatement(str);
            connection.setAutoCommit(false);
            for (int i = 0; i < id.length; i++) {
                st.setInt(1, Integer.parseInt(id[i]));
                st.addBatch();
            }
            st.executeBatch();
            connection.commit();
        } catch (Exception e) {
            System.out.println("deleteStaffBox: " + e.getMessage());
        }
    }
    
    public void deleteAllStaff() {
        try {
            String str = "UPDATE [Admin] SET status = 1";
            PreparedStatement st = connection.prepareStatement(str);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("deleteAllStaff: " + e.getMessage());
        }
    }
    
    public void undoStaffBox(String[] id) {
        try {
            String str = "UPDATE [Admin] SET status = 0 WHERE AdminID = ?";
            PreparedStatement st = connection.prepareStatement(str);
            connection.setAutoCommit(false);
            for (int i = 0; i < id.length; i++) {
                st.setInt(1, Integer.parseInt(id[i]));
                st.addBatch();
            }
            st.executeBatch();
            connection.commit();
        } catch (Exception e) {
            System.out.println("undoStaffBox: " + e.getMessage());
        }
    }
    
    public void undoAllStaff(){
        try {
            String str = "UPDATE [Admin] SET status = 0";
            PreparedStatement st = connection.prepareStatement(str);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("undoAllStaff: " + e.getMessage());
        }
    }

    public int getSizeOfListDelete(String key) {
        String sql = "select count(AdminID) \n"
                + "FROM [dbo].[Admin]\n"
                + "where status = 1";
        if (key != null && !key.isEmpty()) {
            sql += "and (AdminName like N'%" + key.trim() + "%' or Address like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'";
            try {
                int key_num = Integer.parseInt(key);
                sql += " or AdminID = " + key + ")";
            } catch (Exception e) {
                sql += ")";
            }
        }
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getSizeOfListA: " + e);
        }
        return 0;
    }

    public List<Admin1> getListDeleteByPage(int start, int top, String key) {
        List<Admin1> data = new ArrayList<>();
        RoleDAO rdb = new RoleDAO();
        String sql = "SELECT  top " + top + " [AdminID]\n"
                + "      ,[AdminName]\n"
                + "      ,[Address]\n"
                + "      ,[Phone]\n"
                + "      ,[Email]\n"
                + "      ,[RoleID]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Admin]"
                + " where status = 1"
                + "  and AdminID > all (SELECT top " + start + " AdminID\n"
                + "			FROM [dbo].[Admin]\n"
                + "		where status = 1 ";
        try {
            if (key != null && !key.isEmpty()) {
                sql += "and (AdminName like N'%" + key.trim() + "%' or Address like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'))";
                sql += "and (AdminName like N'%" + key.trim() + "%' or Address like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'";
                try {
                    int key_num = Integer.parseInt(key);
                    sql += " or UserID = " + key + ")";
                } catch (Exception e) {
                    sql += ")";
                }
            } else {
                sql += ")";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int adminID = rs.getInt(1);
                String adminName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                Role role = rdb.getRole(rs.getInt(6));
                boolean status = rs.getBoolean(7);
                Admin1 admin = new Admin1(adminID, adminName, Address, Phone, Email, "", role, "", status);
                data.add(admin);
            }
        } catch (SQLException e) {
            System.out.println("getListByPageA: " + e);
        }
        return data;
    }

    public void addStaff(String adminName, String address, String phone, String email, int roleID) {
        String sql = "INSERT INTO [dbo].[Admin]\n"
                + "           ([AdminName]\n"
                + "           ,[Address]\n"
                + "           ,[Phone]\n"
                + "           ,[Email]\n"
                + "           ,[Password]\n"
                + "           ,[RoleID]\n"
                + "           ,[img]\n"
                + "          ,[status])\n"
                + "     VALUES (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, adminName);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            st.setString(5, "Ad@123");
            st.setInt(6, roleID);
            st.setString(7, "Admin.jpg");
            st.setBoolean(8, false);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("addStaff: " + e);
        }
    }

    public void updateStaff(String adminName, String address, String phone, String email, int roleID, boolean status, String img, int id) {
        String sql = "UPDATE [dbo].[Admin]\n"
                + "   SET [AdminName] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[RoleID] = ?\n"
                + "      ,[img] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE AdminID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, adminName);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            st.setInt(5, roleID);
            if (!img.isEmpty()) {
                st.setString(6, img);
            } else {
                st.setNull(6, java.sql.Types.NVARCHAR);
            }
            st.setBoolean(7, status);
            st.setInt(8, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateStaff: " + e);
        }
    }
    
    public void updateAcc(String adminName, String address, String phone, String email, boolean status, String img, int id, String pass) {
        String sql = "UPDATE [dbo].[Admin]\n"
                + "   SET [AdminName] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[img] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[Password] = ?\n"
                + " WHERE AdminID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, adminName);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            if (!img.isEmpty()) {
                st.setString(5, img);
            } else {
                st.setNull(5, java.sql.Types.NVARCHAR);
            }
            st.setBoolean(6, status);
            st.setInt(8, id);
            st.setString(7, pass);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateAcc: " + e);
        }
    }
    
    public void updateStaffNoImg(String adminName, String address, String phone, String email, boolean status,int id, String pass) {
        String sql = "UPDATE [dbo].[Admin]\n"
                + "   SET [AdminName] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[Password] = ?\n"
                + " WHERE AdminID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, adminName);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            st.setBoolean(5, status);
            st.setString(6, pass);
            st.setInt(7, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateStaffNoImg: " + e);
        }
    }
}
