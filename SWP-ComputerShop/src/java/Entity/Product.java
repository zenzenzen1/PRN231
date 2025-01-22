/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author Admin
 */
public class Product {
   

    private int ProductID;
    private String ProductName;
    private String BrandName;
    private String CategoryName;
    private String Description;
    private String Price;
    private int Discount;
    private String SmallImage;
    private String CreatedAdmin;
    private String ModifiedAdmin;
    private String CreatedDate;
    private String ModifiedDate;
    private int Guarantee;
    private boolean status;
    private int Quantity;
    private String LargeImage;
    private String OtherDescription;
    private String Image;
    private String CategoryID;
    private String BrandID;
    private String file;
    private int numberGua;


    public Product() {
    }

    public Product(int ProductID, String ProductName, String BrandName, String CategoryName, String Price, int Discount, String CreatedAdmin, String ModifiedAdmin, String CreatedDate, String ModifiedDate, int Guarantee, int Quantity, String LargeImage) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.BrandName = BrandName;
        this.CategoryName = CategoryName;
        this.Price = Price;
        this.Discount = Discount;
        this.CreatedAdmin = CreatedAdmin;
        this.ModifiedAdmin = ModifiedAdmin;
        this.CreatedDate = CreatedDate;
        this.ModifiedDate = ModifiedDate;
        this.Guarantee = Guarantee;
        this.Quantity = Quantity;
        this.LargeImage = LargeImage;
    }

    public Product(int ProductID, String ProductName, String BrandName, String CategoryName, String Description, String Price, int Discount, String SmallImage, int Guarantee, int Quantity, String LargeImage, String OtherDescription) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.BrandName = BrandName;
        this.CategoryName = CategoryName;
        this.Description = Description;
        this.Price = Price;
        this.Discount = Discount;
        this.SmallImage = SmallImage;
        this.Guarantee = Guarantee;
        this.Quantity = Quantity;
        this.LargeImage = LargeImage;
        this.OtherDescription = OtherDescription;
       
    }
     public Product(int ProductID, String ProductName, String BrandName, String CategoryName, String Price, int Discount, String LargeImage) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.BrandName = BrandName;
        this.CategoryName = CategoryName;
        this.Price = Price;
        this.Discount = Discount;
        this.LargeImage = LargeImage;
    }
     public Product(int ProductID, String ProductName, String Price, int Discount, int Quantity) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.Price = Price;
        this.Discount = Discount;
        this.Quantity = Quantity;
    }

    public Product(int ProductID, String ProductName, String BrandName, String CategoryName, String Description, String Price, int Discount, String SmallImage, String CreatedAdmin, String ModifiedAdmin, String CreatedDate, String ModifiedDate, int Guarantee, boolean status, int Quantity, String LargeImage, String OtherDescription, String Image, String CategoryID, String BrandID, String file) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.BrandName = BrandName;
        this.CategoryName = CategoryName;
        this.Description = Description;
        this.Price = Price;
        this.Discount = Discount;
        this.SmallImage = SmallImage;
        this.CreatedAdmin = CreatedAdmin;
        this.ModifiedAdmin = ModifiedAdmin;
        this.CreatedDate = CreatedDate;
        this.ModifiedDate = ModifiedDate;
        this.Guarantee = Guarantee;
        this.status = status;
        this.Quantity = Quantity;
        this.LargeImage = LargeImage;
        this.OtherDescription = OtherDescription;
        this.Image = Image;
        this.CategoryID = CategoryID;
        this.BrandID = BrandID;
        this.file = file;
    }

   

    public Product(int ProductID, String ProductName, String BrandName, String CategoryName, String Price, int Discount, String CreatedAdmin, String ModifiedAdmin, String CreatedDate, String ModifiedDate, int Guarantee, int Quantity, String LargeImage,String file ) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.BrandName = BrandName;
        this.CategoryName = CategoryName;
        this.Price = Price;
        this.Discount = Discount;
        this.CreatedAdmin = CreatedAdmin;
        this.ModifiedAdmin = ModifiedAdmin;
        this.CreatedDate = CreatedDate;
        this.ModifiedDate = ModifiedDate;
        this.Guarantee = Guarantee;
        this.Quantity = Quantity;
        this.LargeImage = LargeImage;
        this.file = file;
    }



    public Product(int ProductID, String ProductName, String BrandName, String CategoryName, String Price, int Discount, String CreatedAdmin, String ModifiedAdmin, String CreatedDate, String ModifiedDate, int Guarantee, int Quantity, String LargeImage, String file, int numberGua) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.BrandName = BrandName;
        this.CategoryName = CategoryName;
        this.Price = Price;
        this.Discount = Discount;
        this.CreatedAdmin = CreatedAdmin;
        this.ModifiedAdmin = ModifiedAdmin;
        this.CreatedDate = CreatedDate;
        this.ModifiedDate = ModifiedDate;
        this.Guarantee = Guarantee;
        this.Quantity = Quantity;
        this.LargeImage = LargeImage;
        this.file = file;
        this.numberGua = numberGua;
    }
    public Product(int ProductID, String ProductName, String BrandName, String CategoryName, String Price, int Discount, String LargeImage, int Quantity) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.BrandName = BrandName;
        this.CategoryName = CategoryName;
        this.Price = Price;
        this.Discount = Discount;
        this.LargeImage = LargeImage;
        this.Quantity = Quantity;
    }
    public Product(int ProductID, String ProductName, String BrandName, String CategoryName, String Description, String Price, int Discount, String SmallImage, int Guarantee, int Quantity, String LargeImage, String OtherDescription,String file) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.BrandName = BrandName;
        this.CategoryName = CategoryName;
        this.Description = Description;
        this.Price = Price;
        this.Discount = Discount;
        this.SmallImage = SmallImage;
        this.Guarantee = Guarantee;
        this.Quantity = Quantity;
        this.LargeImage = LargeImage;
        this.OtherDescription = OtherDescription;
        this.file = file;
       
    }
                     
                     
                     
                     
    public int getNumberGua() {
        return numberGua;
    }

    public void setNumberGua(int numberGua) {
        this.numberGua = numberGua;
    }

     

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }
    
    public String getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(String CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getBrandID() {
        return BrandID;
    }

    public void setBrandID(String BrandID) {
        this.BrandID = BrandID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getBrandName() {
        return BrandName;
    }

    public void setBrandName(String BrandName) {
        this.BrandName = BrandName;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public int getDiscount() {
        return Discount;
    }

    public void setDiscount(int Discount) {
        this.Discount = Discount;
    }

    public String getSmallImage() {
        return SmallImage;
    }

    public void setSmallImage(String SmallImage) {
        this.SmallImage = SmallImage;
    }

    public String getCreatedAdmin() {
        return CreatedAdmin;
    }

    public void setCreatedAdmin(String CreatedAdmin) {
        this.CreatedAdmin = CreatedAdmin;
    }

    public String getModifiedAdmin() {
        return ModifiedAdmin;
    }

    public void setModifiedAdmin(String ModifiedAdmin) {
        this.ModifiedAdmin = ModifiedAdmin;
    }

    public String getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(String CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

    public String getModifiedDate() {
        return ModifiedDate;
    }

    public void setModifiedDate(String ModifiedDate) {
        this.ModifiedDate = ModifiedDate;
    }

    public int getGuarantee() {
        return Guarantee;
    }

    public void setGuarantee(int Guarantee) {
        this.Guarantee = Guarantee;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getLargeImage() {
        return LargeImage;
    }

    public void setLargeImage(String LargeImage) {
        this.LargeImage = LargeImage;
    }

    public String getOtherDescription() {
        return OtherDescription;
    }

    public void setOtherDescription(String OtherDescription) {
        this.OtherDescription = OtherDescription;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    
   
    
 

    
    
    

   

    
    
}




