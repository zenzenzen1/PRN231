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
import java.util.List;

/**
 *
 * @author Admin
 */
public class DeleteUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException
            , IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UserDAO1 userDAO = new UserDAO1();
        userDAO.deleteUser(id);
        ArrayList<User1> data = userDAO.getListUserByStatus();
        int page, numperpage;
        if (req.getParameter("entryperpage") == null
                || req.getParameter("entryperpage").isEmpty()
                || req.getParameter("entryperpage").equals("0")) {
            numperpage = 2;
        } else {
            numperpage = Integer.parseInt(req.getParameter("entryperpage"));
        }
        String xpage = req.getParameter("page");
        int size = userDAO.getSizeOfList(req.getParameter("key"));
        int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
            if(page > num) page -= 1;
        }
        int start,end;
        start = (page - 1) * numperpage;
        end = Math.min(numperpage * page, size);
        List<User1> list = userDAO.getListByPage(start, numperpage, req.getParameter("key"));
        req.setAttribute("key", req.getParameter("key"));
        req.setAttribute("start", start);
        req.setAttribute("entryperpage", numperpage);
        req.setAttribute("page", page);
        req.setAttribute("size", size);
        req.setAttribute("num", num);
        req.setAttribute("data", list);
        req.setAttribute("end", end);
        req.getRequestDispatcher("table-data-banned.jsp").forward(req, resp);
       
    }
    
}
