/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author vinh1
 */
public class Guarantee {
    private int guaranteeID;    
    private String userName;
    private String startDate;
    private String phone;    
    private String email;
    private String address;
    private String productName;
    private int oldGuaranteeID;
    private String adminName;
    private String status;
    private String img;
    private String des_Error;
    private String seri;

    public Guarantee() {
    }

    public Guarantee(int guaranteeID, String userName, String startDate, String phone, String email, String address, String productName, int oldGuaranteeID, String adminName, String status, String img, String des_Error, String seri) {
        this.guaranteeID = guaranteeID;
        this.userName = userName;
        this.startDate = startDate;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.productName = productName;
        this.oldGuaranteeID = oldGuaranteeID;
        this.adminName = adminName;
        this.status = status;
        this.img = img;
        this.des_Error = des_Error;
        this.seri = seri;
    }

    public int getGuaranteeID() {
        return guaranteeID;
    }

    public void setGuaranteeID(int guaranteeID) {
        this.guaranteeID = guaranteeID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getOldGuaranteeID() {
        return oldGuaranteeID;
    }

    public void setOldGuaranteeID(int oldGuaranteeID) {
        this.oldGuaranteeID = oldGuaranteeID;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDes_Error() {
        return des_Error;
    }

    public void setDes_Error(String des_Error) {
        this.des_Error = des_Error;
    }

    public String getSeri() {
        return seri;
    }

    public void setSeri(String seri) {
        this.seri = seri;
    }
    
    
    
}
