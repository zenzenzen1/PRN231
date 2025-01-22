/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.UserDAO1;
import Entity.User1;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UpdateUserClient extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String userName = req.getParameter("name");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String Email = req.getParameter("email");
        //String img = req.getParameter("img");
        Part img = req.getPart("img");
        UserDAO1 userDao = new UserDAO1();
        if (img != null && img.getSize() > 0) {
            String fileName = img.getSubmittedFileName();

            if (fileName != null && !fileName.isEmpty()) {
                // Ghi tệp tin vào thư mục chỉ khi tên tệp tin khác null và không rỗng
                img.write("D:\\SWP391_LapTop\\web\\image1\\" + fileName);
            }
            try {
                userDao.updateUser(Integer.parseInt(id), userName, address, phone, Email, fileName);
            } catch (Exception e) {
                System.out.println("doPostAddStaff: " + e);
            }
        } else {
            try {
               
                userDao.updateUser1(Integer.parseInt(id), userName, address, phone, Email);
                
            } catch (Exception e) {
                System.out.println("doPostAddStaff: " + e);
            }
        }
        
        HttpSession session = req.getSession();
        User1 user = (User1) session.getAttribute("acc");
        session.setAttribute("acc", userDao.getUserByID(user.getUserID()));
        resp.sendRedirect("/SWP391_LapTop/Home");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //int id = Integer.parseInt(req.getParameter("id"));

        HttpSession session = req.getSession();
        User1 user = (User1) session.getAttribute("acc");

//        UserDAO1 userDAO1 = new UserDAO1();
//        User1 user = userDAO1.getUserByID1(id);
        req.setAttribute("User1", user);
        req.getRequestDispatcher("ClientAccount.jsp").forward(req, resp);
    }

}
