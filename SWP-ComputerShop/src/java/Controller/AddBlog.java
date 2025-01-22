package Controller;

import Entity.New;
import Entity.Admin;
import DAO.BlogDao;
import Entity.NewsType;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

public class AddBlog extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDao bdao = new BlogDao();
        ArrayList<NewsType> bcl = bdao.NewsType();
        request.setAttribute("bcl", bcl);
        request.getRequestDispatcher("WriteNews.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Admin a = (Admin) session.getAttribute("acc");
        if (a != null) {
            int CreatedBy = a.getAdminID();
            int ModifiedBy = a.getAdminID();
            String Title = request.getParameter("title");
            String Content = request.getParameter("content");
            int NewsType = Integer.parseInt(request.getParameter("cateId"));
            String Image = request.getParameter("banner");
            String Video = request.getParameter("video");
            BlogDao bdao = new BlogDao();
            bdao.addBlog(Title, Content, NewsType, CreatedBy, ModifiedBy, Image, Video);
            response.sendRedirect("list-blog-admin");
        }else{
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    }

}
