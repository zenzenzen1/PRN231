/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author vinh1
 */
public class OrderInfo {
//    [User].UserName,[User].[Email],[User].Phone,
//            [Product].ProductName,[Order].OrderDate,
//                    [Product].Guarantee,[Order].Status
    
    private int userID;
    private int productID;
    private String userName;
    private String email;
    private String phone;
    private String productName;
    private String orderDate;
    private int guarantee;
    private String seri;

    public OrderInfo() {
    }

    public OrderInfo(int userID, int productID, String userName, String email, String phone, String productName, String orderDate, int guarantee, String seri) {
        this.userID = userID;
        this.productID = productID;
        this.userName = userName;
        this.email = email;
        this.phone = phone;
        this.productName = productName;
        this.orderDate = orderDate;
        this.guarantee = guarantee;
        this.seri = seri;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public int getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(int guarantee) {
        this.guarantee = guarantee;
    }

    public String getSeri() {
        return seri;
    }

    public void setSeri(String seri) {
        this.seri = seri;
    }
    
    
    
}
