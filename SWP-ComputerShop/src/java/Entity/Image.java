/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author Admin
 */
public class Image {
    private int ImgID;
   private  int ProductID;
   private  String ImgLink;

    public Image(int ImgID, int ProductID, String ImgLink) {
        this.ImgID = ImgID;
        this.ProductID = ProductID;
        this.ImgLink = ImgLink;
    }

    public Image() {
    }

    public int getImgID() {
        return ImgID;
    }

    public void setImgID(int ImgID) {
        this.ImgID = ImgID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getImgLink() {
        return ImgLink;
    }

    public void setImgLink(String ImgLink) {
        this.ImgLink = ImgLink;
    }
   
}
