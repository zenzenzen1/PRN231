/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BlogDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Laptop LC
 */
public class DeleteCheckBoxNewsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect or show success message
        BlogDao blogDao = new BlogDao();
        String ids = request.getParameter("ids");
        String[] listID = ids.split(",");
        for (int i = 0; i < listID.length; i++) {
            blogDao.delete(Integer.parseInt(listID[i]));
        }
        response.sendRedirect(request.getContextPath() + "/list-blog-admin");
    }
}
