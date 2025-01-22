/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Brand;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class BrandDAO extends DBContext {

    public ArrayList<Brand> getListBrands() {
        ArrayList<Brand> data = new ArrayList<>();
        try {
            String strSelect = "select * from Brand";
            PreparedStatement st = connection.prepareStatement(strSelect);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int BrandID = rs.getInt(1);
                String BrandName = rs.getString(2);
                Brand brand = new Brand(BrandID, BrandName);
                data.add(brand);
            }
        } catch (Exception e) {
            System.out.println("getListBrand: " + e.getMessage());
        }
        return data;
    }
    public ArrayList<Brand> getListBrands1() {
        ArrayList<Brand> data = new ArrayList<>();
        try {
            String strSelect = "select * from Brand";
            PreparedStatement st = connection.prepareStatement(strSelect);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int BrandID = rs.getInt(1);
                String BrandName = rs.getString(2);
                Brand brand = new Brand(BrandID, BrandName);
                data.add(brand);
            }
        } catch (Exception e) {
            System.out.println("getListBrand: " + e.getMessage());
        }
        return data;
    }
    
    public Brand getBrand(int BrandID) {
        try {
            String strSelect = "select * from Brand where BrandID = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setInt(1, BrandID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String BrandName = rs.getString(2);
                Brand b = new Brand(BrandID, BrandName);
                return b;
            }
        } catch (Exception e) {
            System.out.println("getBrand: " + e.getMessage());
        }
        return null;
    }
}
