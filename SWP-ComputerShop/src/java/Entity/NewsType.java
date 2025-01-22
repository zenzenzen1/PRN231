/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author Laptop LC
 */
public class NewsType {
    int NewsTypeID;
    String NewsTypeName;

    public NewsType(int NewsTypeID, String NewsTypeName) {
        this.NewsTypeID = NewsTypeID;
        this.NewsTypeName = NewsTypeName;
    }

    public NewsType() {
    }

    public int getNewsTypeID() {
        return NewsTypeID;
    }

    public void setNewsTypeID(int NewsTypeID) {
        this.NewsTypeID = NewsTypeID;
    }

    public String getNewsTypeName() {
        return NewsTypeName;
    }

    public void setNewsTypeName(String NewsTypeName) {
        this.NewsTypeName = NewsTypeName;
    }
    
}
