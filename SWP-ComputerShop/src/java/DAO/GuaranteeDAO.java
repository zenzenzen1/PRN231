/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import static DAO.OrderDAO.withLargeIntegers;
import Entity.Guarantee;
import Entity.Order;
import Entity.OrderDetail;
import Entity.OrderInfo;
import dal.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author vinh1
 */
public class GuaranteeDAO {

    public GuaranteeDAO() {
        connectDB();
    }
    Connection cnn; //ket noi csdl
    Statement stm; //thuc thi cau lenh sql
    ResultSet rs; // luu tru va u ly du lieu

    private void connectDB() {
        try {
            cnn = (new DBContext()).connection;
            System.out.println("Connect successful");
        } catch (Exception e) {
            System.err.println("Connect error " + e.getMessage());
        }
    }

    public void UpdateGuarantee(int GuaranteeID, String status) {
        String sql = "update [Guarantee] "
                + "set[Status]='" + status + "' "
                + "where GuaranteeID=" + GuaranteeID + "";

        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stm.executeUpdate(sql);
            System.err.println("done");
        } catch (SQLException e) {
            System.out.println("UpdateOrder: " + e);
        }
    }

    public ArrayList<Guarantee> getListByPage(String key) {
        ArrayList<Guarantee> list = new ArrayList<>();
        String sql = "SELECT "
                + "[Guarantee].GuaranteeID,"
                + "[User].UserName,"
                + "[Guarantee].[StartDate],"
                + "[User].[Phone],"
                + "[User].Email,"
                + "[User].Address,"
                + "[Product].ProductName,"
                + "[Guarantee].OldGuaranteeID,"
                + "[Guarantee].AdminName,"
                + "[Guarantee].Status,"
                + "[Guarantee].Img,"
                + "[Guarantee].Des_Error,"
                + "[Guarantee].seri"
                + " FROM [User]  INNER JOIN [Guarantee]\n"
                + "  ON [User].UserID = [Guarantee].UserID  INNER JOIN [Product]\n"
                + "  ON [Product].ProductID = [Guarantee].ProductID";
        if (key != null && !key.isEmpty()) {
            sql += " WHERE (UserName LIKE N'%" + key.trim() + "%' OR Email LIKE N'%" + key.trim() + "%' OR ProductName LIKE N'%" + key.trim() + "%' or AdminName like N'%" + key.trim() + "%'or [Guarantee].seri like N'%" + key.trim() + "%'";
            try {
                int key_num = Integer.parseInt(key);
                sql += " or GuaranteeID = " + key_num + ")";
            } catch (NumberFormatException e) {
                sql += ")";
            }
        }
        try {

            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            rs = stm.executeQuery(sql);
            while (rs.next()) {
                int GuaranteeID = rs.getInt(1);
                String UserName = rs.getString(2);
                SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");
                String StartDate = date.format(rs.getDate(3));
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                String Address = rs.getString(6);
                String ProductName = rs.getString(7);
                int OldGuaranteeID = rs.getInt(8);
                String AdminName = rs.getString(9);
                String Status = rs.getString(10);
                String Img = rs.getString(11);
                String Des_Error = rs.getString(12);
                String seri =rs.getString(13);
                list.add(new Guarantee(GuaranteeID, UserName, StartDate, Phone, Email, Address, ProductName, OldGuaranteeID, AdminName, Status, Img, Des_Error,seri));
            }
        } catch (SQLException e) {
            System.out.println("getListByPageG: " + e);
        }
        return list;
    }

    public ArrayList<Guarantee> getSizeOfList(ArrayList<Guarantee> listAll, int start, int end) {
        ArrayList<Guarantee> list = new ArrayList<Guarantee>();
        if (end >= listAll.size()) {
            end = listAll.size();
        }
        for (int i = start; i <= end; i++) {
            list.add(listAll.get(i));
        }
        return list;
    }

    public Guarantee getDetailGuarantee(int orderID) {

        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "  SELECT "
                    + "[Guarantee].GuaranteeID,"
                    + "[User].UserName,"
                    + "[Guarantee].[StartDate],"
                    + "[User].[Phone],"
                    + "[User].Email,"
                    + "[User].Address,"
                    + "[Product].ProductName,"
                    + "[Guarantee].OldGuaranteeID,"
                    + "[Guarantee].AdminName,"
                    + "[Guarantee].Status,"
                    + "[Guarantee].Img,"
                    + "[Guarantee].Des_Error,"
                    + "[Guarantee].seri"
                    + " FROM [User]  INNER JOIN [Guarantee]\n"
                    + "  ON [User].UserID = [Guarantee].UserID  "
                    + "INNER JOIN [Product]\n"
                    + "  ON [Product].ProductID = [Guarantee].ProductID "
                    + "where [Guarantee].GuaranteeID=" + orderID + "";

            rs = stm.executeQuery(sql);
            while (rs.next()) {
                int GuaranteeID = rs.getInt(1);
                String UserName = rs.getString(2);
                SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");
                String StartDate = date.format(rs.getDate(3));
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                String Address = rs.getString(6);
                String ProductName = rs.getString(7);
                int OldGuaranteeID = rs.getInt(8);
                String AdminName = rs.getString(9);
                String Status = rs.getString(10);
                String Img = rs.getString(11);
                String Des_Error = rs.getString(12);
                String seri=rs.getString(13);
                return new Guarantee(GuaranteeID, UserName, StartDate, Phone, Email, Address, ProductName, OldGuaranteeID, AdminName, Status, Img, Des_Error,seri);
            }
        } catch (SQLException e) {
            System.out.println("getAllItem: " + e);
        }
        return null;
    }

    public OrderInfo infoOrder(String orderID) {

        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "SELECT [Order].OrderID,"
                    + "[User].UserID,"
                    + "[Product].ProductID,"
                    + "[User].UserName,"
                    + "[User].[Email],"
                    + "[User].Phone,"
                    + "[Product].ProductName,"
                    + "[Order].OrderDate,"
                    + "[Product].Guarantee,"
                    + "[SeriProduct].[seri]\n"
                    + "FROM OrderDetails INNER JOIN Product ON OrderDetails.ProductID = Product.ProductID \n"
                    + "INNER JOIN [Order] ON OrderDetails.OrderID = [Order].OrderID"
                    + " INNER JOIN [User] ON [Order].UserID = [User].UserID "
                    + "inner join [SeriProduct] on [Order].OrderID = [SeriProduct].[orderid]"
                    + " where [SeriProduct].[seri]= N'" + orderID + "' and [SeriProduct].[ProductID]=[OrderDetails].ProductID";

            rs = stm.executeQuery(sql);
            while (rs.next()) {
                int UserID = rs.getInt(2);
                int ProductID = rs.getInt(3);
                String UserName = rs.getString(4);
                String Email = rs.getString(5);
                String Phone = rs.getString(6);
                String ProductName = rs.getString(7);
                DateFormat date = new SimpleDateFormat("dd-MM-yyyy");
                String OrderDate = date.format(rs.getDate(8));
                int Guarantee = rs.getInt(9);
                String SeriProduct=rs.getString(10);
                return new OrderInfo(UserID, ProductID, UserName, Email, Phone, ProductName, OrderDate, Guarantee,SeriProduct);
            }
        } catch (SQLException e) {
            System.out.println("infoOrder: " + e);
        }
        return null;
    }

    public boolean checkDuplicateGuarantee(int guaranteeID) {

        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = " select [Guarantee].GuaranteeID from [Guarantee] where GuaranteeID=" + guaranteeID + "";

            rs = stm.executeQuery(sql);
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            return false;
        }
        return false;
    }

    public boolean addGuarantee(int userID, int productID, int dateGuarantee, String adminName, String img, String des_error,String seri) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strAdd = "INSERT [dbo].[Guarantee] "
                    + "([ProductID],"
                    + " [UserID],"
                    + " [StartDate],"
                    + " [EndDate],"
                    + " [OldGuaranteeID],"
                    + "[AdminName],"
                    + "[Status],"
                    + " [Img],"
                    + " [Des_Error],"
                    + "[seri])"
                    + " VALUES ( " + productID + ", " + userID + ", "
                    + "CAST((SELECT GETDATE() AS CurrentDateTime) AS DateTime),"
                    + " CAST((SELECT DATEADD(MONTH,"
                    + " " + dateGuarantee + ","
                    + " GETDATE()) AS CurrentDateTime) AS DateTime),"
                    + " NULL,"
                    + "N'" + adminName + "',"
                    + "N'working',"
                    + "N'" + img + "',N'" + des_error +"',N'"+ seri +"')";
            System.err.println(strAdd);
            stm.executeUpdate(strAdd);            
            return true;
        } catch (Exception e) {
            System.out.println("addGuarantee  " + e.getMessage());
            return false;
        }
    }

    public int getSizeOfList(String key) {
        String sql = "SELECT count(GuaranteeID)\n"
                + " FROM [User]  INNER JOIN [Guarantee]\n"
                + "  ON [User].UserID = [Guarantee].UserID  "
                + "INNER JOIN [Product]\n"
                + "  ON [Product].ProductID = [Guarantee].ProductID "
                + "where 1=1 ";
        if (key != null && !key.isEmpty()) {
            sql += "and (UserName like N'%" + key.trim() + "%' or ProductName like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'or [Guarantee].seri like N'%" + key.trim() + "%'";
            try {
                int key_num = Integer.parseInt(key);
                sql += " or [Guarantee].GuaranteeID = " + key + ")";
            } catch (Exception e) {
                sql += ")";
            }
        }
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(sql);
            if (rs.next()) {
                System.err.println(sql);
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getSizeOfList1: " + e);
        }
        return 0;
    }

    public List<Guarantee> getListByPage(int start, int top, String key) {
        List<Guarantee> data = new ArrayList<>();
        String sql = "select top " + top + "[Guarantee].GuaranteeID,"
                + "[User].UserName,"
                + "[Guarantee].[StartDate],"
                + "[User].[Phone],"
                + "[User].Email,"
                + "[User].Address,"
                + "[Product].ProductName,"
                + "[Guarantee].OldGuaranteeID,"
                + "[Guarantee].AdminName,"
                + "[Guarantee].Status,"
                + "[Guarantee].Img,"
                + "[Guarantee].Des_Error,"
                + "[Guarantee].seri"
                + " FROM [User]  INNER JOIN [Guarantee]\n"
                + "  ON [User].UserID = [Guarantee].UserID  INNER JOIN [Product]\n"
                + "  ON [Product].ProductID = [Guarantee].ProductID"
                + " where 1 = 1 "
                + "and [Guarantee].GuaranteeID > all (SELECT top " + start + " [Guarantee].GuaranteeID"
                + " FROM [User]  INNER JOIN [Guarantee]\n"
                + "  ON [User].UserID = [Guarantee].UserID  INNER JOIN [Product]\n"
                + "  ON [Product].ProductID = [Guarantee].ProductID where 1=1 ";
        try {
            if (key != null && !key.isEmpty()) {
                sql += " and (UserName like N'%" + key.trim() + "%' or ProductName like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%' or AdminName like N'%" + key.trim() + "%'or [Guarantee].seri like N'%" + key.trim() + "%'))";
                sql += " and (UserName like N'%" + key.trim() + "%' or ProductName like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%' or AdminName like N'%" + key.trim() + "%'or [Guarantee].seri like N'%" + key.trim() + "%'";
                try {
                    int key_num = Integer.parseInt(key);
                    sql += " or [Guarantee].GuaranteeID = " + key + ")";
                } catch (Exception e) {
                    sql += ")";
                }
            } else {
                sql += ")";
            }
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                int GuaranteeID = rs.getInt(1);
                String UserName = rs.getString(2);
                SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");
                String StartDate = date.format(rs.getDate(3));
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                String Address = rs.getString(6);
                String ProductName = rs.getString(7);
                int OldGuaranteeID = rs.getInt(8);
                String AdminName = rs.getString(9);
                String Status = rs.getString(10);
                String Img = rs.getString(11);
                String Des_Error = rs.getString(12);
                String seri =rs.getString(13);
                data.add(new Guarantee(GuaranteeID, UserName, StartDate, Phone, Email, Address, ProductName, OldGuaranteeID, AdminName, Status, Img, Des_Error,seri));
            }

        } catch (SQLException e) {
            System.out.println("getListByPage1: " + e);
        }
        return data;
    }

    public int getSizeOfList(String key, String id) {
        String sql = "SELECT count(GuaranteeID)\n"
                + "                FROM [User]  INNER JOIN [Guarantee]\n"
                + "                ON [User].UserID = [Guarantee].UserID \n"
                + "                INNER JOIN [Product]\n"
                + "                ON [Product].ProductID = [Guarantee].ProductID \n"
                + "                where 1=1 and [Guarantee].ProductID = ? ";
        if (key != null && !key.isEmpty()) {
            sql += "and (UserName like N'%" + key.trim() + "%' or ProductName like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%'or [Guarantee].seri like N'%" + key.trim() + "%'";
            try {
                int key_num = Integer.parseInt(key);
                sql += " or [Guarantee].GuaranteeID = " + key + ")";
            } catch (Exception e) {
                sql += ")";
            }
        }
        try {
            PreparedStatement st = cnn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                System.out.println(sql);
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getSizeOfListID: " + e);
        }
        return 0;
    }

    public List<Guarantee> getListByPage(int start, int top, String key, String id) {
        List<Guarantee> data = new ArrayList<>();
        String sql = "select top " + top + "[Guarantee].GuaranteeID,"
                + "[User].UserName,"
                + "[Guarantee].[StartDate],"
                + "[User].[Phone],"
                + "[User].Email,"
                + "[User].Address,"
                + "[Product].ProductName,"
                + "[Guarantee].OldGuaranteeID,"
                + "[Guarantee].AdminName,"
                + "[Guarantee].Status,"
                + "[Guarantee].Img,"
                + "[Guarantee].Des_Error,"
                + "[Guarantee].seri "
                + " FROM [User]  INNER JOIN [Guarantee]\n"
                + "  ON [User].UserID = [Guarantee].UserID  INNER JOIN [Product]\n"
                + "  ON [Product].ProductID = [Guarantee].ProductID "
                + " where 1 = 1 and [Guarantee].ProductID = ? "
                + "and [Guarantee].GuaranteeID > all (SELECT top " + start + " [Guarantee].GuaranteeID"
                + " FROM [User]  INNER JOIN [Guarantee]\n"
                + "  ON [User].UserID = [Guarantee].UserID  INNER JOIN [Product]\n"
                + "  ON [Product].ProductID = [Guarantee].ProductID where 1=1 and [Guarantee].ProductID = ?";
        try {
            if (key != null && !key.isEmpty()) {
                sql += " and (UserName like N'%" + key.trim() + "%' or ProductName like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%' or AdminName like N'%" + key.trim() + "%' or [Guarantee].seri like N'%" + key.trim() + "%'))";
                sql += " and (UserName like N'%" + key.trim() + "%' or ProductName like N'%" + key.trim() + "%' or Email like N'%" + key.trim() + "%' or AdminName like N'%" + key.trim() + "%' or [Guarantee].seri like N'%" + key.trim() + "%'";
                try {
                    int key_num = Integer.parseInt(key);
                    sql += " or [Guarantee].GuaranteeID = " + key + ")";
                } catch (Exception e) {
                    sql += ")";
                }
            } else {
                sql += ")";
            }
            PreparedStatement st = cnn.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int GuaranteeID = rs.getInt(1);
                String UserName = rs.getString(2);
                SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");
                String StartDate = date.format(rs.getDate(3));
                String Phone = rs.getString(4);
                String Email = rs.getString(5);
                String Address = rs.getString(6);
                String ProductName = rs.getString(7);
                int OldGuaranteeID = rs.getInt(8);
                String AdminName = rs.getString(9);
                String Status = rs.getString(10);
                String Img = rs.getString(11);
                String Des_Error = rs.getString(12);
                String seri =rs.getString(13);
                
                data.add(new Guarantee(GuaranteeID, UserName, StartDate, Phone, Email, Address, ProductName, OldGuaranteeID, AdminName, Status, Img, Des_Error,seri));
            }

        } catch (SQLException e) {
            System.out.println("getListByPage12: " + e);
        }
        return data;
    }

}
