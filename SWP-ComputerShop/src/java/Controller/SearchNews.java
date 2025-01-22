/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;
import Entity.New;
import DAO.BlogDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Laptop LC
 */
public class SearchNews extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchNews</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchNews at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
        @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BlogDao bdao = new BlogDao();
        String search = req.getParameter("search");
        ArrayList<New> listSearch = new ArrayList<>();
        String NewString;
        ArrayList<New> data = bdao.getListBlogsForAdmin();
        for (int i = 0; i < data.size(); i++) {
            New news = data.get(i);
            NewString = news.getNewsID()+ "|" + news.getTitle()+ "|" + news.getNewsType()+ "|" + news.getCreatedBy()+ "|" + news.getCreateDate();
            if (NewString.contains(search)) {
                listSearch.add(news);
            }
        }
        if (!listSearch.isEmpty()) {
            req.setAttribute("data", listSearch);
            req.getRequestDispatcher("list-blog-admin.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Không tìm thấy sản phẩm");
            req.getRequestDispatcher("list-blog-admin.jsp").forward(req, resp);
        }
    }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
      
   

