/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import DAO.UserDAO1;
import Entity.Product;
import Entity.User1;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import org.json.JSONObject;

/**
 *
 * @author wth0z
 */
public class OrderAjaxHandle extends HttpServlet {

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
            out.println("<title>Servlet OrderAjaxHandle</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderAjaxHandle at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        JSONObject jsonObject = new JSONObject();
        if (request.getParameter("check").equals("0")) {
            String phone = request.getParameter("phone");
            UserDAO1 udb = new UserDAO1();
            User1 u = udb.getUserByPhone(phone);
            if (u != null) {
                jsonObject.put("nameU", u.getUserName());
                jsonObject.put("address", u.getAddress());
                jsonObject.put("haveID", u.getUserID());
            }
            else{
                jsonObject.put("nameU", "");
                jsonObject.put("address", "");
                jsonObject.put("haveID", "");
            }
        } else {
            String name = request.getParameter("name");
            String num = request.getParameter("num");
            ProductDAO pdb = new ProductDAO();
            Product p = pdb.getProductByName(name.trim());
            if (p == null) {
                jsonObject.put("errorP", "Sản phẩm không tồn tại");
            } else {
                int quantity = Integer.parseInt(num);
                if (quantity == 0) {
                    jsonObject.put("errorN", "Hãy chọn số lượng sản phẩm");
                } else if (quantity > p.getQuantity()) {
                    jsonObject.put("errorN", "Số lượng vượt quá số lượng của sản phẩm");
                } else {
                    double total = (Double.parseDouble(p.getPrice()) - Double.parseDouble(p.getPrice()) * p.getDiscount() / 100) * quantity;
                    jsonObject.put("idSP", p.getProductID());
                    jsonObject.put("total", total);
                    jsonObject.put("discount", p.getDiscount());
                }
            }
        }
        PrintWriter prout = response.getWriter();
        prout.print(jsonObject.toString());
        prout.flush();
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
