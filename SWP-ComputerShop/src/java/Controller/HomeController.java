/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BlogDao;
import DAO.BrandDAO;
import DAO.ProductDAO;
import Entity.Brand;
import Entity.Cart;

import Entity.New;
import Entity.Product;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author Laptop LC
 */
public class HomeController extends HttpServlet {

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
        String brandID = request.getParameter("brandID");
        BrandDAO brandDAO = new BrandDAO();
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> listProduct = new ArrayList<>();
        listProduct = productDAO.getListProduct();
        BlogDao dao = new BlogDao();
        ArrayList<Product> hotItem = productDAO.getListHotItem();
        ArrayList<Product> newItem = productDAO.getListNewItem();
        
        ArrayList<Product> listHeadPhone = productDAO.getListFinalItem(5);
        ArrayList<Product> listKeyboard = productDAO.getListFinalItem(4);
        ArrayList<Product> listMouse = productDAO.getListFinalItem(3);
        ArrayList<Brand> listBrand = brandDAO.getListBrands();
        ArrayList<New> data = dao.getNewestBlogs(3);
         ArrayList<New> phonenumer = dao.getPhoneNumber(3);
        ArrayList<New> email = dao.getEmail(4);
         ArrayList<New> information = dao.getInformation(10);
        ArrayList<New> customerservice = dao.GetCustomerService(11);
        ArrayList<New> getintouch = dao.GetGetinTouch(12);
        ArrayList<New> home = dao.getHome(5);
         ArrayList<New> banner = dao.getBanner(6);
        request.setAttribute("inCate", new BlogDao().Information());
        request.setAttribute("CusCate", new BlogDao().Customerservice());
        request.setAttribute("GetCate", new BlogDao().Getintouch());
       
        request.setAttribute("phone", phonenumer);
        request.setAttribute("home", home);
        request.setAttribute("information", information);
         request.setAttribute("banner", banner);
        request.setAttribute("customerservice", customerservice);
        request.setAttribute("getintouch", getintouch);
        request.setAttribute("email", email);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("brand", listBrand);
        request.setAttribute("newests", data);
        request.setAttribute("hot", hotItem);
        request.setAttribute("keyboard", listKeyboard);
        request.setAttribute("mouse", listMouse);
        request.setAttribute("headphone", listHeadPhone);
        request.setAttribute("newItem", newItem);
        
//        response.getWriter().print(dao);

        request.getRequestDispatcher("index.jsp").forward(request, response);
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
