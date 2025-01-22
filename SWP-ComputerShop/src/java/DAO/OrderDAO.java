package DAO;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import Entity.Cart;
import Entity.Order;
import Entity.OrderDetail;
import Entity.Product;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class OrderDAO extends DBContext {

    public static String withLargeIntegers(double value) {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(value);
    }

    public void CreateOrder(Order o) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([UserID]\n"
                + "           ,[OrderDate]\n"
                + "           ,[ShipDate]\n"
                + "           ,[TotalPrice]\n"
                + "           ,[Status]\n"
                + "           ,[PaymentType]\n"
                + "           ,[ShipAddress])\n"
                + "     VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, o.getUserID());
            stm.setString(2, LocalDateTime.now().toString());
            stm.setNull(3, java.sql.Types.DATE);
            stm.setDouble(4, Double.parseDouble(o.getTotalPrice()));
            stm.setString(5, o.getStatus());
            stm.setString(6, o.getPaymentType());
            stm.setString(7, o.getShipAddress());
            stm.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println("CreateOrder: " + e);
        }
    }

    public Order getOrder(int OrderId) {
        Order o = new Order();
        UserDAO1 udb = new UserDAO1();
        String sql = "select * from [Order] where OrderID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, OrderId);
            ResultSet re = stm.executeQuery();
            if (re.next()) {
                int OrderID = re.getInt(1);
                int UserID = re.getInt(2);
                SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat time = new SimpleDateFormat("HH:mm:ss");
                String OrderDate = date.format(re.getDate(3)) + " " + time.format(re.getTime(3));
                String ShipDate = "";
                if (re.getDate(4) != null) {
                    ShipDate = date.format(re.getDate(4)) + " " + time.format(re.getTime(4));
                }
                double TotalPrice = re.getDouble(5);
                String Status = re.getString(6);
                String PaymentType = re.getString(7);
                String ShipAddress = re.getString(8);
                String ReceiveDate = "";
                if (re.getDate(9) != null) {
                    ReceiveDate = date.format(re.getDate(9)) + " " + time.format(re.getTime(9));
                }
                String UserName = re.getString(10);
                String Phone = re.getString(11);
                o = new Order(OrderID, UserID, OrderDate, ShipDate, ReceiveDate, withLargeIntegers(TotalPrice), Status, PaymentType, ShipAddress, UserName, Phone);
                return o;
            }
        } catch (SQLException e) {
            System.out.println("getOrder: " + e);
        }
        return null;
    }

    public void UpdateOrder(int OrderID, String status) {
        Timestamp datetime = new Timestamp(System.currentTimeMillis());
        String sql = "";
        if (status.equalsIgnoreCase("On delivery")) {
            sql = "UPDATE [dbo].[Order]\n"
                    + "   SET [Status] = ?\n"
                    + "      ,[ShipDate] = ?\n"
                    + " WHERE OrderID = ?";
        } else if (status.equalsIgnoreCase("Delivered")) {
            sql = "UPDATE [dbo].[Order]\n"
                    + "   SET [Status] = ?\n"
                    + "      ,[ReceiveDate] = ?\n"
                    + " WHERE OrderID = ?";
            List<OrderDetail> list = getAllItem(OrderID);
            ProductDAO pdb = new ProductDAO();
            pdb.UpdateQuantity(list);
        } else {
            sql = "UPDATE [dbo].[Order]\n"
                    + "   SET [Status] = ?\n"
                    + " WHERE OrderID = ?";
        }
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            if (!status.equalsIgnoreCase("Reject")) {
                stm.setTimestamp(2, datetime);
                stm.setInt(3, OrderID);
            } else {
                stm.setInt(2, OrderID);
            }
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("UpdateOrder: " + e);
        }
    }

    public List<OrderDetail> getAllItem(int orderID) {
        String sql = "select * from OrderDetails where OrderID = ?";
        List<OrderDetail> list = new ArrayList<>();
        ProductDAO pdb = new ProductDAO();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderID);
            ResultSet re = stm.executeQuery();
            while (re.next()) {
                int productID = re.getInt(1);
                int OrderID = re.getInt(2);
                int quantity = re.getInt(3);
                double totalprice = re.getDouble(4);
                int discount = re.getInt(5);
                list.add(new OrderDetail(pdb.getProductById(productID), getOrder(OrderID), quantity, withLargeIntegers(totalprice), discount));
            }
        } catch (SQLException e) {
            System.out.println("getAllItem: " + e);
        }
        return list;
    }

    public int getSizeOfListHandle(String key) {
        String sql = "select count(OrderID) \n"
                + "FROM [dbo].[Order]\n"
                + "where [Order].[Status] = 'New'";
        if (key != null && !key.isEmpty()) {
            sql += "and (shipAddress like N'%" + key.trim() + "%' or [Order].[Status] like N'%" + key.trim() + "%' or UserName like N'%" + key.trim() + "%'";
            try {
                int key_num = Integer.parseInt(key);
                sql += " or OrderID = " + key + ")";
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
            System.out.println("getSizeOfList: " + e);
        }
        return 0;
    }

    public int getSizeOfListOnDelivery(String key) {
        String sql = "select count(OrderID) \n"
                + "FROM [dbo].[Order]\n"
                + "where [Order].[Status] = 'On delivery'";
        if (key != null && !key.isEmpty()) {
            sql += "and (shipAddress like N'%" + key.trim() + "%' or [Order].[Status] like N'%" + key.trim() + "%' or UserName like N'%" + key.trim() + "%'";
            try {
                int key_num = Integer.parseInt(key);
                sql += " or OrderID = " + key + ")";
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
            System.out.println("getSizeOfList: " + e);
        }
        return 0;
    }

    public int getSizeOfListCancel(String key) {
        String sql = "select count(OrderID) \n"
                + "FROM [dbo].[Order]\n"
                + "where [Order].[Status] = 'Reject' ";
        if (key != null && !key.isEmpty()) {
            sql += "and (shipAddress like N'%" + key.trim() + "%' or [Order].[Status] like N'%" + key.trim() + "%' or UserName like N'%" + key.trim() + "%'";
            try {
                int key_num = Integer.parseInt(key);
                sql += " or OrderID = " + key + ")";
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
            System.out.println("getSizeOfList: " + e);
        }
        return 0;
    }

    public int getSizeOfListSuccess(String key) {
        String sql = "select count(OrderID) \n"
                + "FROM [dbo].[Order]\n"
                + "where [Order].[Status] = 'Delivered'";
        if (key != null && !key.isEmpty()) {
            sql += "and (shipAddress like N'%" + key.trim() + "%' or [Order].[Status] like N'%" + key.trim() + "%' or UserName like N'%" + key.trim() + "%'";
            try {
                int key_num = Integer.parseInt(key);
                sql += " or OrderID = " + key + ")";
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
            System.out.println("getSizeOfList: " + e);
        }
        return 0;
    }

    public List<Order> getListByPageHandle(int start, int top, String key) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT  top " + top + " [OrderID]\n"
                + "      ,[UserID]\n"
                + "      ,[OrderDate]\n"
                + "      ,[TotalPrice]\n"
                + "      ,[Status]\n"
                + "      ,[ShipAddress]\n"
                + "      ,[UserName]\n"
                + "      ,[Phone]"
                + "  FROM [dbo].[Order] where "
                + " [Order].[Status] = 'New' and OrderID > all (SELECT top " + start + " [OrderID]\n"
                + "			FROM [dbo].[Order]\n"
                + "		where [Order].[Status] = 'New' ";
        UserDAO1 udb = new UserDAO1();
        try {
            if (key != null && !key.isEmpty()) {
                sql += "and (shipAddress like N'%" + key.trim() + "%' or [Order].[Status] like N'%" + key.trim() + "%' or UserName like N'%" + key.trim() + "%'))";
                sql += "and (shipAddress like N'%" + key.trim() + "%' or [Order].[Status] like N'%" + key.trim() + "%' or UserName like N'%" + key.trim() + "%'";
                try {
                    int key_num = Integer.parseInt(key);
                    sql += " or OrderID = " + key + ")";
                } catch (Exception e) {
                    sql += ")";
                }
            } else {
                sql += ")";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet re = stm.executeQuery();
            while (re.next()) {
                int OrderID = re.getInt(1);
                int UserID = re.getInt(2);
                SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat time = new SimpleDateFormat("HH:mm:ss");
                String OrderDate = date.format(re.getDate(3)) + " " + time.format(re.getTime(3));
                double TotalPrice = re.getDouble(4);
                String Status = re.getString(5);
                String ShipAddress = re.getString(6);
                String UserName = re.getString(7);
                String Phone = re.getString(8);
                list.add(new Order(OrderID, UserID, OrderDate, "", "", withLargeIntegers(TotalPrice), Status, "", ShipAddress, UserName, Phone));
            }
        } catch (SQLException e) {
            System.out.println("getListByPage: " + e);
        }
        return list;
    }

    public List<Order> getListByPageOnDelivery(int start, int top, String key) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT  top " + top + " [OrderID]\n"
                + "      ,[UserID]\n"
                + "      ,[OrderDate]\n"
                + "      ,[TotalPrice]\n"
                + "      ,[Status]\n"
                + "      ,[ShipAddress]\n"
                + "      ,[UserName]\n"
                + "      ,[Phone]"
                + "  FROM [dbo].[Order] where"
                + " [Order].[Status] = 'On delivery' and OrderID > all (SELECT top " + start + " [OrderID]\n"
                + "			FROM [dbo].[Order]\n"
                + "		where [Order].[Status] = 'On delivery' ";
        UserDAO1 udb = new UserDAO1();
        try {
            if (key != null && !key.isEmpty()) {
                sql += "and (shipAddress like N'%" + key.trim() + "%' or [Order].[Status] like N'%" + key.trim() + "%' or UserName like N'%" + key.trim() + "%'))";
                sql += "and (shipAddress like N'%" + key.trim() + "%' or [Order].[Status] like N'%" + key.trim() + "%' or UserName like N'%" + key.trim() + "%'";
                try {
                    int key_num = Integer.parseInt(key);
                    sql += " or OrderID = " + key + ")";
                } catch (Exception e) {
                    sql += ")";
                }
            } else {
                sql += ")";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet re = stm.executeQuery();
            while (re.next()) {
                int OrderID = re.getInt(1);
                int UserID = re.getInt(2);
                SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat time = new SimpleDateFormat("HH:mm:ss");
                String OrderDate = date.format(re.getDate(3)) + " " + time.format(re.getTime(3));
                double TotalPrice = re.getDouble(4);
                String Status = re.getString(5);
                String ShipAddress = re.getString(6);
                String UserName = re.getString(7);
                String Phone = re.getString(8);
                list.add(new Order(OrderID, UserID, OrderDate, "", "", withLargeIntegers(TotalPrice), Status, "", ShipAddress, UserName, Phone));
            }
        } catch (SQLException e) {
            System.out.println("getListByPage: " + e);
        }
        return list;
    }

    public List<Order> getListByPageSuccess(int start, int top, String key) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT  top " + top + " [OrderID]\n"
                + "      ,[UserID]\n"
                + "      ,[OrderDate]\n"
                + "      ,[TotalPrice]\n"
                + "      ,[Status]\n"
                + "      ,[ShipAddress]\n"
                + "      ,[UserName]\n"
                + "      ,[Phone]"
                + "  FROM [dbo].[Order] where"
                + " [Order].[Status] = 'Delivered' and OrderID > all (SELECT top " + start + " [OrderID]\n"
                + "			FROM [dbo].[Order]\n"
                + "		where [Order].[Status] = 'Delivered' ";
        UserDAO1 udb = new UserDAO1();
        try {
            if (key != null && !key.isEmpty()) {
                sql += "and (shipAddress like N'%" + key.trim() + "%' or [Order].[Status] like N'%" + key.trim() + "%' or UserName like N'%" + key.trim() + "%'))";
                sql += "and (shipAddress like N'%" + key.trim() + "%' or [Order].[Status] like N'%" + key.trim() + "%' or UserName like N'%" + key.trim() + "%'";
                try {
                    int key_num = Integer.parseInt(key);
                    sql += " or OrderID = " + key + ")";
                } catch (Exception e) {
                    sql += ")";
                }
            } else {
                sql += ")";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet re = stm.executeQuery();
            while (re.next()) {
                int OrderID = re.getInt(1);
                int UserID = re.getInt(2);
                SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat time = new SimpleDateFormat("HH:mm:ss");
                String OrderDate = date.format(re.getDate(3)) + " " + time.format(re.getTime(3));
                double TotalPrice = re.getDouble(4);
                String Status = re.getString(5);
                String ShipAddress = re.getString(6);
                String UserName = re.getString(7);
                String Phone = re.getString(8);
                list.add(new Order(OrderID, UserID, OrderDate, "", "", withLargeIntegers(TotalPrice), Status, "", ShipAddress, UserName, Phone));
            }
        } catch (SQLException e) {
            System.out.println("getListByPage: " + e);
        }
        return list;
    }

    public List<Order> getListByPageCancel(int start, int top, String key) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT  top " + top + " [OrderID]\n"
                + "      ,[UserID]\n"
                + "      ,[OrderDate]\n"
                + "      ,[TotalPrice]\n"
                + "      ,[Status]\n"
                + "      ,[ShipAddress]\n"
                + "      ,[UserName]\n"
                + "      ,[Phone]"
                + "  FROM [dbo].[Order] where"
                + " [Order].[Status] = 'Reject' and OrderID > all (SELECT top " + start + " [OrderID]\n"
                + "			FROM [dbo].[Order]\n"
                + "		where [Order].[Status] = 'Reject'";
        UserDAO1 udb = new UserDAO1();
        try {
            if (key != null && !key.isEmpty()) {
                sql += "and (shipAddress like N'%" + key.trim() + "%' or [Order].[Status] like N'%" + key.trim() + "%' or UserName like N'%" + key.trim() + "%'))";
                sql += "and (shipAddress like N'%" + key.trim() + "%' or [Order].[Status] like N'%" + key.trim() + "%' or UserName like N'%" + key.trim() + "%'";
                try {
                    int key_num = Integer.parseInt(key);
                    sql += " or OrderID = " + key + ")";
                } catch (Exception e) {
                    sql += ")";
                }
            } else {
                sql += ")";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet re = stm.executeQuery();
            while (re.next()) {
                int OrderID = re.getInt(1);
                int UserID = re.getInt(2);
                SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat time = new SimpleDateFormat("HH:mm:ss");
                String OrderDate = date.format(re.getDate(3)) + " " + time.format(re.getTime(3));
                double TotalPrice = re.getDouble(4);
                String Status = re.getString(5);
                String ShipAddress = re.getString(6);
                String UserName = re.getString(7);
                String Phone = re.getString(8);
                list.add(new Order(OrderID, UserID, OrderDate, "", "", withLargeIntegers(TotalPrice), Status, "", ShipAddress, UserName, Phone));
            }
        } catch (SQLException e) {
            System.out.println("getListByPage: " + e);
        }
        return list;
    }

    public void addOrder(int id, String name, String phone, double total, String payment, String address) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([UserID]\n"
                + "           ,[OrderDate]\n"
                + "           ,[TotalPrice]\n"
                + "           ,[Status]\n"
                + "           ,[PaymentType]\n"
                + "           ,[ShipAddress]\n"
                + "           ,[UserName]\n"
                + "           ,[Phone])"
                + "     VALUES (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            Timestamp datetime = new Timestamp(System.currentTimeMillis());
            stm.setInt(1, id);
            stm.setTimestamp(2, datetime);
            stm.setDouble(3, total);
            stm.setString(4, "New");
            stm.setString(5, payment);
            stm.setString(6, address);
            stm.setString(7, name);
            stm.setString(8, phone);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("addOrder: " + e);
        }
    }

    public int getIDOrderNew() {
        String sql = "select max(OrderID) \n"
                + "from [order]";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getIDOrderNew: " + e);
        }
        return 0;
    }

    public void addItemOrder(String[] idSP, String[] total, String[] discount, String[] quantity, int id) {
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([ProductID]\n"
                + "           ,[OrderID]\n"
                + "           ,[Quantity]\n"
                + "           ,[Price]\n"
                + "           ,[Discount])\n"
                + "     VALUES (?,?,?,?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            connection.setAutoCommit(false);
            for (int i = 0; i < idSP.length; i++) {
                stm.setInt(1, Integer.parseInt(idSP[i]));
                stm.setInt(2, id);
                stm.setInt(3, Integer.parseInt(quantity[i]));
                stm.setDouble(4, Double.parseDouble(total[i]));
                stm.setInt(5, Integer.parseInt(discount[i]));
                stm.addBatch();
            }
            stm.executeBatch();
            connection.commit();
            System.out.println("okaddItemOrder");
        } catch (Exception e) {
            System.out.println("addItemOrder: " + e);
        }
    }

    public void addItemOrderByCart(Cart cart, int id) {
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([ProductID]\n"
                + "           ,[OrderID]\n"
                + "           ,[Quantity]\n"
                + "           ,[Price]\n"
                + "           ,[Discount])\n"
                + "     VALUES (?,?,?,?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            connection.setAutoCommit(false);
            for (int i = 0; i < cart.getCart().size(); i++) {
                stm.setInt(1, cart.getCart().get(i).getProduct().getProductID());
                stm.setInt(2, id);
                stm.setInt(3, cart.getCart().get(i).getQuantity());
                stm.setDouble(4, Double.parseDouble(cart.getCart().get(i).getPrice().replaceAll(",", "")));
                stm.setInt(5, cart.getCart().get(i).getProduct().getDiscount());
                addSeri(id, cart.getCart().get(i).getProduct(), cart.getCart().get(i).getQuantity());
                stm.addBatch();
            }
            stm.executeBatch();
            connection.commit();
            System.out.println("okaddItemOrder");
        } catch (Exception e) {
            System.out.println("addItemOrder: " + e);
        }
    }

    public int getMax(int id) {
        String sql = "select count(id) \n"
                + "FROM [dbo].[SeriProduct]\n"
                + "where ProductID = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getQuantity: " + e);
        }
        return 0;
    }

    public void addSeri(int id, Product p, int quantity) {
        String sql = "INSERT INTO [dbo].[SeriProduct]\n"
                + "           ([orderid]\n"
                + "           ,[seri], [ProductID])\n"
                + "     VALUES (?,?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            int count = getMax(p.getProductID())+1;
            connection.setAutoCommit(false);
            for (int i = 0; i < quantity; i++) {
                stm.setInt(1, id);
                stm.setString(2, "" + p.getBrandName() + "_" + String.valueOf(p.getProductID()) + "_" + String.valueOf(count));
                stm.setInt(3, p.getProductID());
                stm.addBatch();
                count++;
            }
            stm.executeBatch();
            connection.commit();
        } catch (Exception e) {
            System.out.println("addSeri: " + e);
        }
    }

    public List<Order> getListOrderByUID(int userID) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] where UserID = ?";
        UserDAO1 udb = new UserDAO1();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet re = stm.executeQuery();
            while (re.next()) {
                int OrderID = re.getInt(1);
                int UserID = re.getInt(2);
                SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat time = new SimpleDateFormat("HH:mm:ss");
                String OrderDate = date.format(re.getDate(3)) + " " + time.format(re.getTime(3));
                String ShipDate = "";
                if (!re.getString(6).equalsIgnoreCase("New")) {
                    ShipDate = date.format(re.getDate(4)) + " " + time.format(re.getTime(4));
                }
                double TotalPrice = re.getDouble(5);
                String Status = re.getString(6);
                String PaymentType = re.getString(7);
                String ShipAddress = re.getString(8);
                String ReceiveDate = "";
                if (re.getDate(9) != null) {
                    ReceiveDate = date.format(re.getDate(9)) + " " + time.format(re.getTime(9));
                }
                String UserName = re.getString(10);
                String Phone = re.getString(11);
                list.add(new Order(OrderID, UserID, OrderDate, ShipDate, ReceiveDate, withLargeIntegers(TotalPrice), Status, PaymentType, ShipAddress, UserName, Phone));
            }
        } catch (SQLException e) {
            System.out.println("getListOrderByUID: " + e);
        }
        return list;
    }

}
