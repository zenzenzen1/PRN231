/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Category;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext{
    
     public ArrayList<Category> getListCategory() {
        ArrayList<Category> data = new ArrayList<>();
        try {
            String strSelect = "select * from Category";
            PreparedStatement st = connection.prepareStatement(strSelect);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int CategoryID = rs.getInt(1);
                String CategoryName = rs.getString(2);               
                Category product = new Category(CategoryID, CategoryName);
                data.add(product);         
            }
        } catch (Exception e) {
            System.out.println("getListCategory: " + e.getMessage());
        }
        return data;
    }

     public Category getCategory(int CategoryID) {
        try {
            String strSelect = "select * from Category where CategoryID = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setInt(1, CategoryID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String CategoryName = rs.getString(2);
                Category c = new Category(CategoryID, CategoryName);
                return c;
            }
        } catch (Exception e) {
            System.out.println("getCategory: " + e.getMessage());
        }
        return null;
    }
}
