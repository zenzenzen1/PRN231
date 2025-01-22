/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import Entity.Cart;
import Entity.Item;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author wth0z
 */
public class CartAjaxHandle extends HttpServlet {

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
            out.println("<title>Servlet CartAjaxHandle</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartAjaxHandle at " + request.getContextPath() + "</h1>");
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
        Cookie[] c = request.getCookies();
        ProductDAO pdb = new ProductDAO();
        String txt = "";
        for (Cookie cookie : c) {
            if (cookie.getName().equals("cart")) {
                txt += cookie.getValue();
            }
        }
        Cart cart = new Cart(txt);
        response.setContentType("text/html;charset=UTF-8");
        
        try ( PrintWriter out = response.getWriter()) {
            if (cart.getCart() != null) {
                if (cart.getCart().size() >= 2) {
                    System.out.println("ok");
                    out.print("                                        <div class=\"dropdown-cart-header\">\n"
                            + "                                            <span>" + cart.getCart().size() + " sản phẩm</span>\n"
                            + "                                            <a href=\"showcart\">Giỏ hàng</a>\n"
                            + "                                        </div>\n"
                            + "                                            <ul class=\"shopping-list\">\n"
                            + "                                                    <li>\n"
                            + "                                                        <a id=\"deleteInCart0\" data-id=\""+cart.getCart().get(cart.getCart().size() - 1).getProduct().getProductID()+"\" onclick=\"deleteItem('" + cart.getCart().get(cart.getCart().size() - 1).getProduct().getProductID() + "', '" + cart.getCart().size() + "'); CartShow()\" class=\"remove\" title=\"Remove this item\"><i class=\"fa fa-remove\"></i></a>\n"
                            + "                                                        <a class=\"cart-img\" href=\"productDetail/" + cart.getCart().get(cart.getCart().size() - 1).getProduct().getProductName().replaceAll(" ", "-") + "\"><img src=\"imageProduct/" + cart.getCart().get(cart.getCart().size() - 1).getProduct().getLargeImage() + "\" alt=\"#\"></a>\n"
                            + "                                                        <h4><a href=\"productDetail/" + cart.getCart().get(cart.getCart().size() - 1).getProduct().getProductName().replaceAll(" ", "-")+"\">" + cart.getCart().get(cart.getCart().size() - 1).getProduct().getProductName() + "</a></h4>\n"
                            + "                                                        <p class=\"quantity\">" + cart.getCart().get(cart.getCart().size() - 1).getQuantity() + "x - <span class=\"amount\">" + cart.getCart().get(cart.getCart().size() - 1).getPrice() + " đ</span></p>\n"
                            + "                                                    </li>\n"
                            + "                                                    <li>\n"
                            + "                                                        <a id=\"deleteInCart1\" data-id=\""+cart.getCart().get(cart.getCart().size() - 2).getProduct().getProductID()+ "\"onclick=\"deleteItem('" + cart.getCart().get(cart.getCart().size() - 2).getProduct().getProductID()+ "', '" + cart.getCart().size() + "'); CartShow()\" class=\"remove\" title=\"Remove this item\"><i class=\"fa fa-remove\"></i></a>\n"
                            + "                                                        <a class=\"cart-img\" href=\"productDetail/" + cart.getCart().get(cart.getCart().size() - 2).getProduct().getProductName().replaceAll(" ", "-") + "\"><img src=\"imageProduct/" + cart.getCart().get(cart.getCart().size() - 2).getProduct().getLargeImage() + "\" alt=\"#\"></a>\n"
                            + "                                                        <h4><a href=\"productDetail/" + cart.getCart().get(cart.getCart().size() - 2).getProduct().getProductName().replaceAll(" ", "-") + "\">" + cart.getCart().get(cart.getCart().size() - 2).getProduct().getProductName() + "</a></h4>\n"
                            + "                                                        <p class=\"quantity\">" + cart.getCart().get(cart.getCart().size() - 2).getQuantity() + "x - <span class=\"amount\">" + cart.getCart().get(cart.getCart().size() - 2).getPrice() + " đ</span></p>\n"
                            + "                                                    </li>\n"
                            + "                                            </ul>\n"
                            + "                                        <div class=\"bottom\">\n"
                            + "                                            <div class=\"total\">\n"
                            + "                                                <span>Total</span>\n"
                            + "                                                <span class=\"total-amount\">" + cart.getTotalCart() + " đ</span>\n"
                            + "                                            </div>\n"
                            + "                                            <a href=\"checkout\" class=\"btn animate\">Thanh toán</a>\n"
                            + "                                        </div>\n");
                } else {
                    System.out.println("ok1");
                    out.print("                                        <div class=\"dropdown-cart-header\">\n"
                            + "                                            <span>" + cart.getCart().size() + " sản phẩm</span>\n"
                            + "                                            <a href=\"showcart\">Giỏ hàng</a>\n"
                            + "                                        </div>\n"
                            + "                                            <ul class=\"shopping-list\">\n"
                            + "                                                    <li>\n"
                            + "                                                        <a id=\"deleteInCart0\" data-id=\""+cart.getCart().get(cart.getCart().size() - 1).getProduct().getProductID()+"\" onclick=\"deleteItem('" + cart.getCart().get(cart.getCart().size() - 1).getProduct().getProductID() + "', '" + cart.getCart().size() + "'); CartShow()\" class=\"remove\" title=\"Remove this item\"><i class=\"fa fa-remove\"></i></a>\n"
                            + "                                                        <a class=\"cart-img\" href=\"productDetail/" + cart.getCart().get(cart.getCart().size() - 1).getProduct().getProductName().replaceAll(" ", "-") + "\"><img src=\"imageProduct/" + cart.getCart().get(cart.getCart().size() - 1).getProduct().getLargeImage() + "\" alt=\"#\"></a>\n"
                            + "                                                        <h4><a href=\"productDetail/" + cart.getCart().get(cart.getCart().size() - 1).getProduct().getProductName().replaceAll(" ", "-") + "\">" + cart.getCart().get(cart.getCart().size() - 1).getProduct().getProductName() + "</a></h4>\n"
                            + "                                                        <p class=\"quantity\">" + cart.getCart().get(cart.getCart().size() - 1).getQuantity() + "x - <span class=\"amount\">" + cart.getCart().get(cart.getCart().size() - 1).getPrice() + " đ</span></p>\n"
                            + "                                                    </li>\n"
                            + "                                            </ul>\n"
                            + "                                        <div class=\"bottom\">\n"
                            + "                                            <div class=\"total\">\n"
                            + "                                                <span>Total</span>\n"
                            + "                                                <span class=\"total-amount\">" + cart.getTotalCart() + " đ</span>\n"
                            + "                                            </div>\n"
                            + "                                            <a href=\"checkout\" class=\"btn animate\">Thanh toán</a>\n"
                            + "                                        </div>\n");
                }
            } else {
                System.out.println("ok2");
                out.print("                                        <div class=\"dropdown-cart-header\">\n"
                        + "                                            <span>" + 0 + " sản phẩm</span>\n"
                        + "                                            <a href=\"showcart\">Giỏ hàng</a>\n"
                        + "                                        </div>\n"
                        + "                                        <div class=\"bottom\">\n"
                        + "                                            <div class=\"total\">\n"
                        + "                                                <span>Total</span>\n"
                        + "                                                <span class=\"total-amount\">" + 0 + " đ</span>\n"
                        + "                                            </div>\n"
                        + "                                            <a href=\"checkout\" class=\"btn animate\">Thanh toán</a>\n"
                        + "                                        </div>\n");
            }
        }
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
