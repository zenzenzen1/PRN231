/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Entity.User1;
import java.sql.SQLException;
import java.time.LocalDateTime;


import java.util.List;


/**
 *
 * @author Admin
 */
public class UserDAO1 extends DBContext {

    public UserDAO1() {
    }

    public ArrayList<User1> getListUser() {
        ArrayList<User1> data = new ArrayList<>();
        try {
            String strSelect = "select * from [User]";
            PreparedStatement st = connection.prepareStatement(strSelect);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt(1);
                String UserName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                String Password = rs.getString(6);
                String Img = rs.getString(8);
                boolean status = rs.getBoolean(7);
                User1 user = new User1(UserID, UserName, Address, Phone, Email, Password, Img, status);
                data.add(user);

            }
        } catch (Exception e) {
            System.out.println("getListUser: " + e.getMessage());
        }
        return data;
    }

    public void deleteUser(int id) {
        try {
            String strSelect = "UPDATE [User] SET status = 1 WHERE UserID = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setInt(1, id);
            st.executeQuery();
        } catch (Exception e) {
            System.out.println("deleteUser: " + e.getMessage());
        }
    }

    public User1 getUserByID(int userID) {
        String sql = "select * from [User] where UserID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int UserID = rs.getInt(1);
                String UserName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                String Password = rs.getString(6);
                String Img = rs.getString(8);
                boolean status = rs.getBoolean(7);
                return new User1(UserID, UserName, Address, Phone, Email, Password, Img, status);
            }
        } catch (SQLException e) {
            System.out.println("getAllOrder: " + e);
        }
        return null;
    }
    public User1 getUserByID2(int userID) {
        String sql = "select * from [User] where UserID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int UserID = rs.getInt(1);
                String UserName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                String Password = rs.getString(6);
                String Img = rs.getString(8);
                
                return new User1(UserID, UserName, Address, Phone, Email, Password, Img);
            }
        } catch (SQLException e) {
            System.out.println("getAllOrder: " + e);
        }
        return null;
    }
      public User1 getUserByID1(int userID) {
        String sql = "select * from [User] where UserID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int UserID = rs.getInt(1);
                String UserName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
               
                
                return new User1(UserID, UserName, Address, Phone, Email);
            }
        } catch (SQLException e) {
            System.out.println("getAllOrder: " + e);
        }
        return null;
    }

    public ArrayList<User1> getListUserDelete() {
        ArrayList<User1> data = new ArrayList<>();
        try {
            String strSelect = "select * from [User]";
            PreparedStatement st = connection.prepareStatement(strSelect);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt(1);
                String UserName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                String Password = rs.getString(6);
                String Img = rs.getString(8);
                boolean status = rs.getBoolean(7);
                if (rs.getBoolean(7)) {
                    User1 user = new User1(UserID, UserName, Address, Phone, Email, Password, Img, status);
                    data.add(user);
                }
                }

        } catch (Exception e) {
            System.out.println("getListUserDelete: " + e.getMessage());
        }
        return data;
    }

    public ArrayList<User1> getListUserByStatus() {
        ArrayList<User1> data = new ArrayList<>();
        try {
            String strSelect = "select * from [User]";
            PreparedStatement st = connection.prepareStatement(strSelect);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt(1);
                String UserName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                String Password = rs.getString(6);
                String Img = rs.getString(8);
                boolean status = rs.getBoolean(7);
                if (!status) {
                    User1 user = new User1(UserID, UserName, Address, Phone, Email, Password, Img, status);
                    data.add(user);
                }
            }
        } catch (Exception e) {
            System.out.println("getListUserDelete: " + e.getMessage());
        }
        return data;
    }


    public int getSizeOfList(String key) {
        String sql = "select count(UserID) \n"
                + "FROM [dbo].[User]\n"
                + "where (status is Null or status = 0)";
        if (key != null && !key.isEmpty()) {
            sql += "and (UserName like N'%" + key.trim() + "%' or Address like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'";
            try {
                int key_num = Integer.parseInt(key);
                sql += " or UserID = " + key + ")";
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
            System.out.println("getSizeOfListU: " + e);
        }
        return 0;
    }

    public List<User1> getListByPage(int start,int top, String key){
        List<User1> data = new ArrayList<>();
        String sql = "SELECT  top " + top + " [UserID]\n"
                + "      ,[UserName]\n"
                + "      ,[Address]\n"
                + "      ,[Phone]\n"
                + "      ,[Email]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[User]"
                + " where (status is Null or status = 0)"
                + "  and UserID > all (SELECT top " + start + " UserID\n"
                + "			FROM [dbo].[User]\n"
                + "		where (status is Null or status = 0) ";
        try {
            if (key != null && !key.isEmpty()){ 
                sql += "and (UserName like N'%" + key.trim() + "%' or Address like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'))";
                sql += "and (UserName like N'%" + key.trim() + "%' or Address like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'";
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
                int UserID = rs.getInt("UserID");
                String UserName = rs.getString("UserName");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Email = rs.getString("Email");
                boolean status = rs.getBoolean("status");
                if (!status) {
                    User1 user = new User1(UserID, UserName, Address, Phone, Email, "", "", status);
                    data.add(user);
                }
            }
        } catch (SQLException e) {
            System.out.println("getListByPageU: " + e);
        }
        return data;
    }
    public int getSizeOfList1(String key) {
        String sql = "select count(UserID) \n"
                + "FROM [dbo].[User]\n"
                + "where (status = 1)";
        if (key != null && !key.isEmpty()) {
            sql += "and (UserName like N'%" + key.trim() + "%' or Address like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'";
            try {
                int key_num = Integer.parseInt(key);
                sql += " or UserID = " + key + ")";
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
            System.out.println("getSizeOfListU: " + e);
        }
        return 0;
    }

    public List<User1> getListByPage1(int start,int top, String key){
        List<User1> data = new ArrayList<>();
        String sql = "SELECT  top " + top + " [UserID]\n"
                + "      ,[UserName]\n"
                + "      ,[Address]\n"
                + "      ,[Phone]\n"
                + "      ,[Email]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[User]"
                + " where (status = 1)"
                + "  and UserID > all (SELECT top " + start + " UserID\n"
                + "			FROM [dbo].[User]\n"
                + "		where (status = 1) ";
        try {
            if (key != null && !key.isEmpty()){ 
                sql += "and (UserName like N'%" + key.trim() + "%' or Address like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'))";
                sql += "and (UserName like N'%" + key.trim() + "%' or Address like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'";
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
                int UserID = rs.getInt("UserID");
                String UserName = rs.getString("UserName");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Email = rs.getString("Email");
                boolean status = rs.getBoolean("status");
                
                    User1 user = new User1(UserID, UserName, Address, Phone, Email, "", "", status);
                    data.add(user);
                
            }
        } catch (SQLException e) {
            System.out.println("getListByPageU: " + e);
        }
        return data;
    }
     
     public ArrayList<User1> getListTop() {
         ArrayList<User1> data = new ArrayList<>();
        try {
            String strSelect = "SELECT TOP 4 * FROM [User] ORDER BY UserID DESC;";
            PreparedStatement st = connection.prepareStatement(strSelect);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt(1);
                String UserName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
               
                User1 user = new User1(UserID, UserName, Address, Phone);
                data.add(user);

            }
        } catch (Exception e) {
            System.out.println("getListUser: " + e.getMessage());
        }
        return data;
    }
    
     public void deleteAllUser() {
        try {
            String str = "UPDATE [User] SET status = 1";
            PreparedStatement st = connection.prepareStatement(str);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("deleteAllUser: " + e.getMessage());
        }
    }
     public void updateUser1(int userId,  String userName, String address, String phone, String email) {
       
        try {
            String strSelect = "UPDATE [User]\n"
                    + "SET UserName = ?, Address = ?, Phone = ?, Email = ?\n"
                    + "WHERE UserID = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setString(1, userName);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            st.setInt(5, userId);
            
            int rowsAffected = st.executeUpdate();
            System.out.println("Number of rows affected: " + rowsAffected);

        } catch (Exception e) {
            System.out.println("updateUser: " + e.getMessage());
        }
    }
     public void updateUser(int userId,  String userName, String address, String phone, String email, String img) {
        try {
            String strSelect = "UPDATE [User]\n"
                    + "SET UserName = ?, Address = ?, Phone = ?, Email = ?, img = ?\n"
                    + "WHERE UserID = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setString(1, userName);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            if (!img.isEmpty()) {
                st.setString(5, img);
            } else {
                st.setNull(5, java.sql.Types.NVARCHAR);
            }
            st.setInt(6, userId);
            
            int rowsAffected = st.executeUpdate();
            System.out.println("Number of rows affected: " + rowsAffected);

        } catch (Exception e) {
            System.out.println("updateUser: " + e.getMessage());
        }
    }
     public void updateUserClient(int userId,  String userName, String address, String phone, String email, String Img , boolean  status, String pass) {
       
        try {
            String strSelect = "UPDATE [User]\n"
                    + "SET UserName = ?, Address = ?, Phone = ?, Email = ?, img = ?, status = ?\n"
                    + "WHERE UserID = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setString(1, userName);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            if (!Img.isEmpty()) {
                st.setString(6, Img);
            } else {
                st.setNull(6, java.sql.Types.NVARCHAR);
            }
            st.setBoolean(7, status);
            st.setInt(9, userId);
            st.setString(8, pass);
            int rowsAffected = st.executeUpdate();
            System.out.println("Number of rows affected: " + rowsAffected);

        } catch (Exception e) {
            System.out.println("updateUser: " + e.getMessage());
        }
     }
     public void rollbackUser(int id) {
        try {
            String strSelect = "UPDATE [User] SET status = 0 WHERE UserID = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("rollbackUser: " + e.getMessage());
        }
    }
     public User1 getUserByPhone(String phone) {
        User1 u = null;
        try {
            String strSelect = "SELECT UserID,[UserName]\n"
                    + "      ,[Address]\n"
                    + "      ,[Phone]\n"
                    + "  FROM [dbo].[User] where [Phone] = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setString(1, phone);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int UserId = rs.getInt(1);
                String UserName = rs.getString(2);
                String Address = rs.getString(3);
                String Phone = rs.getString(4);
                u = new User1(UserId, UserName, Address, Phone, "", "", "", false);
            }
        } catch (Exception e) {
            System.out.println("getUserByPhone: " + e.getMessage());
        }
        return u;
    }

    public void rollbackAllUser() {
        try {
            String str = "UPDATE [User] SET status = 0";
            PreparedStatement st = connection.prepareStatement(str);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("rollbackAllUser: " + e.getMessage());
        }
    }

//    public Product getProductById(int id) {
//
//        Product product = null;
//
//        try {
//            String sql = "SELECT a.ProductID, a.ProductName, c.BrandName, b.CategoryName, a.Description, a.UnitPrice, a.Discount, a.Guarantee, a.LargeImage, a.UnitInStock, a.Img, a.OtherDescription\n"
//                    + "FROM Product a JOIN Category b ON a.CategoryID = b.CategoryID\n"
//                    + "JOIN Brand c ON a.BrandID = c.BrandID\n"
//                    + "JOIN [Admin] d ON a.CreatedBy = d.AdminID\n"
//                    + "JOIN [Admin] e ON a.ModifiedBy = e.AdminID\n"
//                    + "WHERE ProductID = ?";
//
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, id); // Set the value for the parameter
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                int ProductID = rs.getInt(1);
//                String ProductName = rs.getString(2);
//                String BrandName = rs.getString(3);
//                String CategoryName = rs.getString(4);
//                String Description = rs.getString(5);
//                String Price = withLargeIntegers(rs.getDouble(6));
//                int Discount = rs.getInt(7);
//                int Guarantee = rs.getInt(8);
//                String LargeImage = rs.getString(9);
//                int Quantity = rs.getInt(10);
//                String SmallImage = rs.getString(11);
//                String OtherDes = rs.getString(12);
//                product = new Product(ProductID, ProductName, BrandName, CategoryName, Description, Price, Discount, SmallImage, Guarantee, Quantity, LargeImage, OtherDes);
//            }
//        } catch (Exception e) {
//            System.out.println("getProductById: " + e.getMessage());
//        }
//        return product;
//    }

//    public void updateProduct(int adminId, int productID, String productName, String quantity, String category, String brand, String price, String discount, String guarantee, String otherDes, String description, String fileSmallImg, String fileLargeImg) {
//        LocalDateTime currentTime = LocalDateTime.now();
//        try {
//            String strSelect = "UPDATE Product\n"
//                    + "SET ProductName = ?, BrandID = ?, CategoryID = ?, UnitPrice = ?, Img = ?, UnitInStock = ?, ModifiedBy = ?, ModifiedDate = ?,Discount = ?,Guarantee = ?,Description = ?,LargeImage = ?,OtherDescription = ?\n"
//                    + "WHERE ProductID = ?";
//            PreparedStatement st = connection.prepareStatement(strSelect);
//            st.setString(1, productName);
//            st.setInt(2, Integer.parseInt(brand));
//            st.setInt(3, Integer.parseInt(category));
//            st.setString(4, price);
//            st.setString(5, fileSmallImg);
//            st.setInt(6, Integer.parseInt(quantity));
//            st.setInt(7, adminId);
//            st.setString(8, currentTime.toString());
//            st.setInt(9, Integer.parseInt(discount));
//            st.setInt(10, Integer.parseInt(guarantee));
//            st.setString(11, description);
//            st.setString(12,fileLargeImg);
//            st.setString(13, otherDes);
//            st.setInt(14, productID);
//
//            int rowsAffected = st.executeUpdate();
//            System.out.println("Number of rows affected: " + rowsAffected);
//
//        } catch (Exception e) {
//            System.out.println("updateProduct: " + e.getMessage());
//        }
    
}
