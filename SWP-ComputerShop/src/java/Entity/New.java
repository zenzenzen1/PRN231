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
public class New {
    private int NewsID;
    private String Title;
    private String Content;
    private int NewsType;
    private int CreatedBy;
    private int ModifiedBy;
    private String Image;
    private String Video;
    private String adminName;
    private Date createDate;
    private Date modifiedDate;
    private String NewTypesName;

    public New() {
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
    
    public New(int NewsID, String Title, String Content, int NewsType, int CreatedBy, int ModifiedBy, String Image, String Video) {
        this.NewsID = NewsID;
        this.Title = Title;
        this.Content = Content;
        this.NewsType = NewsType;
        this.CreatedBy = CreatedBy;
        this.ModifiedBy = ModifiedBy;
        this.Image = Image;
        this.Video = Video;
    }

    public New(int NewsID, String Title, String Content, String adminName, Date createDate, String NewTypesName,String image,Date modifiedDate) {
        this.NewsID = NewsID;
        this.Title = Title;
        this.Content = Content;
        this.adminName = adminName;
        this.createDate = createDate;
        this.NewTypesName = NewTypesName;
        this.Image = image;
        this.modifiedDate = modifiedDate;
    }

    
    
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    

    
    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getNewTypesName() {
        return NewTypesName;
    }

    public void setNewTypesName(String NewTypesName) {
        this.NewTypesName = NewTypesName;
    }
    
    
    
    public int getNewsID() {
        return NewsID;
    }

    public void setNewsID(int NewsID) {
        this.NewsID = NewsID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public int getNewsType() {
        return NewsType;
    }

    public void setNewsType(int NewsType) {
        this.NewsType = NewsType;
    }

    public int getCreatedBy() {
        return CreatedBy;
    }

    public void setCreatedBy(int CreatedBy) {
        this.CreatedBy = CreatedBy;
    }

    public int getModifiedBy() {
        return ModifiedBy;
    }

    public void setModifiedBy(int ModifiedBy) {
        this.ModifiedBy = ModifiedBy;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getVideo() {
        return Video;
    }

    public void setVideo(String Video) {
        this.Video = Video;
    }

    @Override
    public String toString() {
        return "New{" + "NewsID=" + NewsID + ", Title=" + Title + ", Content=" + Content + ", NewsType=" + NewsType + ", CreatedBy=" + CreatedBy + ", ModifiedBy=" + ModifiedBy + ", Image=" + Image + ", Video=" + Video + '}';
    }
    
            
    
    
    
}
