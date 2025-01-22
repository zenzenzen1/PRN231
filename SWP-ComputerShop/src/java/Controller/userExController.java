
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import DAO.UserDAO1;
import Entity.Category;
import Entity.Product;
import Entity.User1;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class userExController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
       
        CategoryDAO categoryDAO = new CategoryDAO();
        UserDAO1 userDAO = new UserDAO1();
        ArrayList<User1> data = userDAO.getListUserByStatus();
        req.setAttribute("data", data);
        req.getRequestDispatcher("table-data-banned.jsp").forward(req, resp);
    }
    
}
