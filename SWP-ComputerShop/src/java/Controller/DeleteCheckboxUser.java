/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import DAO.UserDAO1;
import Entity.Product;
import Entity.User1;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DeleteCheckboxUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
         UserDAO1 userDAO = new UserDAO1();
        ArrayList<User1> data = userDAO.getListUserByStatus();
        String ids = req.getParameter("ids");
        String[] listID = ids.split(",");
             for (int i = 0; i < listID.length; i++) {
                 userDAO.deleteUser(Integer.parseInt(listID[i]));
                
            }
        resp.sendRedirect(req.getContextPath() + "/userAdmin");
        }
}
