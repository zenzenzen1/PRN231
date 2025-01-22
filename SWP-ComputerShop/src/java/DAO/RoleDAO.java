/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Role;
import com.sun.javafx.scene.control.skin.VirtualFlow;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class RoleDAO extends DBContext {

    public Role getRole(int roleID) {
        try {
            String strSelect = "SELECT [RoleName]\n"
                    + "  FROM [dbo].[AdminRole] where [RoleID] = ?";
            PreparedStatement st = connection.prepareStatement(strSelect);
            st.setInt(1, roleID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String roleName = rs.getString(1);
                Role role = new Role(roleID, roleName);
                return role;
            }
        } catch (Exception e) {
            System.out.println("getRole: " + e.getMessage());
        }
        return null;
    }
    
    public List<Role> getAllRole() {
        List<Role> li = new ArrayList<>();
        try {
            String strSelect = "SELECT *\n"
                    + "  FROM [dbo].[AdminRole]";
            PreparedStatement st = connection.prepareStatement(strSelect);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String roleName = rs.getString(2);
                li.add(new Role(id, roleName));
            }
            return li;
        } catch (Exception e) {
            System.out.println("getAllRole: " + e.getMessage());
        }
        return null;
    }
}
