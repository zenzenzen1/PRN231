/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BlogDao;
import Entity.Cart;
import Entity.New;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 *
 * @author Laptop LC
 */
public class BlogDetailController extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        Cookie[] c = request.getCookies();
        String txt = "";
        if (c != null) {
            for (Cookie i : c) {
                if (i.getName().equals("cart")) {
                    txt += i.getValue();
                }
            }
        }
        Cart cart = new Cart(txt);
        request.setAttribute("size", cart.getTotalQuantity());
        request.setAttribute("totalCart", cart.getTotalCart());
        request.setAttribute("cart", cart);
        request.setAttribute("bcl", new BlogDao().NewsTypeClient());
        request.setAttribute("newest", new BlogDao().getNewestBlogs(3));
        BlogDao bdb = new BlogDao();
        String nameN = request.getPathInfo().substring(1).replaceAll("-", " ");
        New detail = bdb.getBlogByName(nameN);
        int id = detail.getNewsID();
        request.setAttribute("relate", new BlogDao().get3RelateBlog(new BlogDao().getBlogByID(id).getNewsType()));
        request.setAttribute("n", new BlogDao().getBlogByName(request.getPathInfo().substring(1).replaceAll("-", " ")));
//        response.getWriter().print(new BlogDao().getBlogByID(id).getNewsType());
        String imgDe = detail.getContent();
        if (imgDe != null) {
            Document doc = Jsoup.parse(imgDe);
            Elements imgElements = doc.select("img[src]");
            String[] srcArray = new String[imgElements.size()];
            ArrayList<String> image = new ArrayList<>();
            for (int i = 0; i < imgElements.size(); i++) {
                Element img = imgElements.get(i);
                String src = img.attr("src");
                srcArray[i] = src;
                image.add(src);
            }
            request.setAttribute("data", image);

        }
        request.getRequestDispatcher("../BlogDetail.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
