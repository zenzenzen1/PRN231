/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.UserDAO1;
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
public class SearchUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO1 userDAO = new UserDAO1();
        String search = req.getParameter("search");
        ArrayList<User1> listSearch = new ArrayList<>();
        String productString;
        ArrayList<User1> data = userDAO.getListUserByStatus();
        for (int i = 0; i < data.size(); i++) {
            User1 user = data.get(i);
            productString = user.getUserID() + "|" + user.getUserName() + "|" + user.getAddress() + "|" + user.getPhone() + "|" + user.getEmail();
            if (productString.contains(search)) {
                listSearch.add(user);
            }
        }
        if (!listSearch.isEmpty()) {
            
            req.setAttribute("data", listSearch);
            req.getRequestDispatcher("table-data-banned.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Không tìm thấy");
            req.getRequestDispatcher("table-data-banned.jsp").forward(req, resp);
        }
    }
    }