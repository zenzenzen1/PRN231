/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author Admin
 */
public class User1 {
    private int UserID;
    private String UserName;
    private String Address;
    private String Phone;
    private String Email;
    private String Password;
    private String Img;
    private boolean Status;

    public User1() {
    }

    public User1(int UserID, String UserName, String Address, String Phone, String Email, String Password, String Img) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.Address = Address;
        this.Phone = Phone;
        this.Email = Email;
        this.Password = Password;
        this.Img = Img;
    }
    

    public User1(int UserID, String UserName, String Address, String Phone, String Email, String Password, String Img, boolean Status) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.Address = Address;
        this.Phone = Phone;
        this.Email = Email;
        this.Password = Password;
        this.Img = Img;
        this.Status = Status;
    }

    public User1(int UserID, String UserName, String Address, String Phone, String Email, String Img) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.Address = Address;
        this.Phone = Phone;
        this.Email = Email;
        this.Img = Img;
    }
    

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

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
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

    public User1(int UserID, String UserName, String Address, String Phone, String Email) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.Address = Address;
        this.Phone = Phone;
        this.Email = Email;
    }

    public User1(int UserID, String UserName, String Address, String Phone) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.Address = Address;
        this.Phone = Phone;
    }
    
    

    @Override
    public String toString() {
        return "User{" + "UserID=" + UserID + ", UserName=" + UserName + ", Address=" + Address + ", Phone=" + Phone + ", Email=" + Email + ", Password=" + Password + '}';
    }
    
    
}
