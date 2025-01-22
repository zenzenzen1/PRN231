/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.OrderDAO;
import DAO.UserDAO1;
import Entity.Order;
import Entity.User1;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class AddOrder extends HttpServlet {

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
            out.println("<title>Servlet AddOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddOrder at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("key", request.getParameter("key"));
        request.setAttribute("page", request.getParameter("page"));
        request.setAttribute("entryperpage", request.getParameter("entryperpage"));
        request.getRequestDispatcher("form-add-don-hang.jsp").forward(request, response);
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
        OrderDAO odb = new OrderDAO();
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String nameU = request.getParameter("nameU");
        String payment = request.getParameter("payment");
        String id_raw = request.getParameter("id");
        String[] idSP = request.getParameterValues("idSP");
        String[] total = request.getParameterValues("total");
        String[] discount = request.getParameterValues("discount");
        String[] quantity = request.getParameterValues("quantity");
        double totalorder = 0;
        for (int i = 0; i < total.length; i++) {
            totalorder += Double.parseDouble(total[i]);
        }
        System.out.println("haveID: "+id_raw);
        if (!id_raw.isEmpty()) {
            odb.addOrder(Integer.parseInt(id_raw),nameU,phone,totalorder, payment, address);
        }else{
            odb.addOrder(6,nameU,phone, totalorder, payment, address);
        }
        int idOrder = odb.getIDOrderNew();
        odb.addItemOrder(idSP, total, discount, quantity, idOrder);
        
        //Xu ly phan trang va chuyen huong den danh sach
        if (request.getParameter("key") == null || request.getParameter("key").isEmpty()) {
            odb = new OrderDAO();
        } else {
            odb = new OrderDAO();
            String key = request.getParameter("key");
        }
        int page, numperpage, max = 0;
        if (request.getParameter("entryperpage") == null
                || request.getParameter("entryperpage").isEmpty()
                || request.getParameter("entryperpage").equals("0")) {
            numperpage = 2;
        } else {
            numperpage = Integer.parseInt(request.getParameter("entryperpage"));
        }
        String xpage = request.getParameter("page");
        int size = 0;
        size = odb.getSizeOfListHandle(request.getParameter("key"));
        int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(numperpage * page, size);
        List<Order> list = new ArrayList<>();
        list = odb.getListByPageHandle(start, numperpage, request.getParameter("key"));
        request.setAttribute("key", request.getParameter("key"));
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("entryperpage", numperpage);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("list", list);
        request.getRequestDispatcher("NewOrderAdmin.jsp").forward(request, response);
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
