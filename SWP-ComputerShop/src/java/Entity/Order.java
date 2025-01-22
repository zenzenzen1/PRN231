/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Order {

    private int OrderID;
    private int UserID;
    private String OrderDate;
    private String ShipDate;
    private String ReceiveDate;
    private String TotalPrice;
    private String Status;
    private String PaymentType;
    private String ShipAddress;
    private String UserName;
    private String Phone;

    public Order() {
    }

    public Order(int OrderID, int UserID, String OrderDate, String ShipDate, String ReceiveDate, String TotalPrice, String Status, String PaymentType, String ShipAddress, String UserName, String Phone) {
        this.OrderID = OrderID;
        this.UserID = UserID;
        this.OrderDate = OrderDate;
        this.ShipDate = ShipDate;
        this.ReceiveDate = ReceiveDate;
        this.TotalPrice = TotalPrice;
        this.Status = Status;
        this.PaymentType = PaymentType;
        this.ShipAddress = ShipAddress;
        this.UserName = UserName;
        this.Phone = Phone;
    }

    public String getReceiveDate() {
        return ReceiveDate;
    }

    public void setReceiveDate(String ReceiveDate) {
        this.ReceiveDate = ReceiveDate;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getShipDate() {
        return ShipDate;
    }

    public void setShipDate(String ShipDate) {
        this.ShipDate = ShipDate;
    }

    public String getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(String TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getPaymentType() {
        return PaymentType;
    }

    public void setPaymentType(String PaymentType) {
        this.PaymentType = PaymentType;
    }

    public String getShipAddress() {
        return ShipAddress;
    }

    public void setShipAddress(String ShipAddress) {
        this.ShipAddress = ShipAddress;
    }

    @Override
    public String toString() {
        return "Order{" + "UserName=" + getUserName() + ", OrderDate=" + OrderDate + ", ShipDate=" + ShipDate + ", TotalPrice=" + TotalPrice + ", Status=" + Status + ", PaymentType=" + PaymentType + ", ShipAddress=" + ShipAddress + '}';
    }

}
