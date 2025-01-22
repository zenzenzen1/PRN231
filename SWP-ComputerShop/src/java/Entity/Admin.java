/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author Admin
 */
public class Admin {
    private int AdminID;
    private String AdminName;
    private String Address;
    private String Phone;
    private String Email;
    private String Password;
    private int RollID;
    private String Img;
    private boolean Status;

    public String getImg() {
        return Img;
    }

    public void setImg(String Img) {
        this.Img = Img;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }
    
    
    public Admin() {
    }

    public Admin(int AdminID, String AdminName, String Address, String Phone, String Email, String Password, int RoleID, String Img, boolean Status) {
        this.AdminID = AdminID;
        this.AdminName = AdminName;
        this.Address = Address;
        this.Phone = Phone;
        this.Email = Email;
        this.Password = Password;
        this.RollID = RoleID;
        this.Img = Img;
        this.Status = Status;
    }
    
    
    public int getAdminID() {
        return AdminID;
    }

    public void setAdminID(int AdminID) {
        this.AdminID = AdminID;
    }

    public String getAdminName() {
        return AdminName;
    }

    public void setAdminName(String AdminName) {
        this.AdminName = AdminName;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getRoleID() {
        return RollID;
    }

    public void setRoleID(int RoleID) {
        this.RollID = RoleID;
    }

    @Override
    public String toString() {
        return "Admin{" + "AdminID=" + AdminID + ", AdminName=" + AdminName + ", Address=" + Address + ", Phone=" + Phone + ", Email=" + Email + ", Password=" + Password + ", RoleID=" + RollID + '}';
    }
    
    
}
