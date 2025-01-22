/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BlogDao;
import DAO.OrderDAO;
import Entity.Cart;
import Entity.New;
import Entity.Order;
import Entity.User1;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author wth0z
 */
public class Vnp_Return extends HttpServlet {

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
            out.println("<title>Servlet Vnp_Return</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Vnp_Return at " + request.getContextPath() + "</h1>");
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
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }
        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Controller.Config.hashAllFields(fields);
        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                Cookie[] c = request.getCookies();
                String txt = "";
                if (c != null) {
                    for (Cookie i : c) {
                        if (i.getName().equals("cart")) {
                            txt += i.getValue();
                            i.setMaxAge(0);
                            response.addCookie(i);
                        }
                    }
                }
                Cart cart = new Cart(txt);
                OrderDAO odb = new OrderDAO();
                User1 u = (User1) request.getSession().getAttribute("acc");
                if (u != null) {
                    odb.addOrder(u.getUserID(), request.getSession().getAttribute("name").toString(),
                            request.getSession().getAttribute("phoneN").toString(),
                            Double.parseDouble(cart.getTotalCart().replaceAll(",", "")), request.getParameter("vnp_BankCode"),
                            request.getSession().getAttribute("address").toString());
                    int idOrder = odb.getIDOrderNew();
                    odb.addItemOrderByCart(cart, idOrder);
                } else {
                    odb.addOrder(6, request.getSession().getAttribute("name").toString(),
                            request.getSession().getAttribute("phoneN").toString(),
                            Double.parseDouble(cart.getTotalCart().replaceAll(",", "")), request.getParameter("vnp_BankCode"),
                            request.getSession().getAttribute("address").toString());
                    int idOrder = odb.getIDOrderNew();
                    odb.addItemOrderByCart(cart, idOrder);
                }
                Cart temp = new Cart("");
                request.setAttribute("size", temp.getTotalQuantity());
                request.setAttribute("totalCart", temp.getTotalCart());
                request.setAttribute("cart", temp);
                request.setAttribute("cartshow", cart);
                request.setAttribute("total", cart.getTotalCart());
                request.setAttribute("mess", "thành công");
            } else {
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
                request.setAttribute("mess", "thất bại");
            }
        } else {
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
            request.setAttribute("mess", "thất bại");
        }
        BlogDao dao = new BlogDao();
        LocalDate date_raw = LocalDate.now();
        Date d = Date.valueOf(date_raw);
        SimpleDateFormat fm = new SimpleDateFormat("dd-MM-yyyy");
        ArrayList<New> phonenumer = dao.getPhoneNumber(3);
        ArrayList<New> email = dao.getEmail(4);
        request.setAttribute("phone", phonenumer);
        request.setAttribute("email", email);
        request.setAttribute("date", fm.format(d));
        request.setAttribute("vnp_Amount", request.getParameter("vnp_Amount"));
        request.setAttribute("vnp_TxnRef", request.getParameter("vnp_TxnRef"));
        request.setAttribute("vnp_OrderInfo", request.getParameter("vnp_OrderInfo"));
        request.setAttribute("vnp_ResponseCode", request.getParameter("vnp_ResponseCode"));
        request.setAttribute("vnp_TransactionNo", request.getParameter("vnp_TransactionNo"));
        request.setAttribute("vnp_BankCode", request.getParameter("vnp_BankCode"));
        request.setAttribute("vnp_PayDate", request.getParameter("vnp_PayDate"));
        request.getRequestDispatcher("vnp_return.jsp").forward(request, response);
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
