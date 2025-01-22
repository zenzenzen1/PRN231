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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UpdateUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id =  req.getParameter("id");
        String userName = req.getParameter("name"); 
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String Email = req.getParameter("email");
        UserDAO1 userDao = new UserDAO1();
        userDao.updateUser1(Integer.parseInt(id), userName, address, phone, Email);
        
        int check = Integer.parseInt(req.getParameter("check"));
        if (check == 1) {
            int page, numperpage;
            if (req.getParameter("entryperpage") == null
                    || req.getParameter("entryperpage").isEmpty()
                    || req.getParameter("entryperpage").equals("0")) {
                numperpage = 2;
            } else {
                numperpage = Integer.parseInt(req.getParameter("entryperpage"));
            }
            String xpage = req.getParameter("page");
            int size = userDao.getSizeOfList1(req.getParameter("key"));
     
            int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(numperpage * page, size);
             List<User1> list = userDao.getListByPage1(start, numperpage, req.getParameter("key"));
            

            req.setAttribute("key", req.getParameter("key"));
            req.setAttribute("start", start);
            req.setAttribute("entryperpage", numperpage);
            req.setAttribute("page", page);
            req.setAttribute("num", num);
            req.setAttribute("data", list);
            req.setAttribute("end", end);
            req.getRequestDispatcher("table-delete-user.jsp").forward(req, resp);
        } else {
            int page, numperpage;
            if (req.getParameter("entryperpage") == null
                    || req.getParameter("entryperpage").isEmpty()
                    || req.getParameter("entryperpage").equals("0")) {
                numperpage = 2;
            } else {
                numperpage = Integer.parseInt(req.getParameter("entryperpage"));
            }
            String xpage = req.getParameter("page");
            int size = userDao.getSizeOfList1(req.getParameter("key"));
            
            int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            System.out.println("page = " + page);
            System.out.println("");
            start = (page - 1) * numperpage;
            end = Math.min(numperpage * page, size);
             List<User1> list = userDao.getListByPage(start, numperpage, req.getParameter("key"));
           
            req.setAttribute("key", req.getParameter("key"));
            req.setAttribute("start", start);
            req.setAttribute("entryperpage", numperpage);
            req.setAttribute("page", page);
            req.setAttribute("data", list);
            req.setAttribute("num", num);
            req.setAttribute("end", end);
            req.getRequestDispatcher("table-data-banned.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        session.setAttribute("userId", id);
        UserDAO1 userDAO1 = new UserDAO1();
        User1 user = userDAO1.getUserByID1(id);
        
        
        int check = Integer.parseInt(req.getParameter("check"));
        int page, numperpage;
        if (req.getParameter("entryperpage") == null
                || req.getParameter("entryperpage").isEmpty()
                || req.getParameter("entryperpage").equals("0")) {
            numperpage = 2;
        } else {
            numperpage = Integer.parseInt(req.getParameter("entryperpage"));
        }
        String xpage = req.getParameter("page");
        int size = userDAO1.getSizeOfList(req.getParameter("key"));
       
        int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(numperpage * page, size);
        
        req.setAttribute("key", req.getParameter("key"));
        req.setAttribute("start", start);
        req.setAttribute("entryperpage", numperpage);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("end", end);
        req.setAttribute("check", check);
        req.setAttribute("User1", user);
        req.getRequestDispatcher("form-update-user.jsp").forward(req, resp);
    }

}


    

