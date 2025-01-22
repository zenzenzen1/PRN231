package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DAO.OrderDAO;
import Entity.Order;
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
public class OrderManager extends HttpServlet {

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
            OrderDAO odb;
            if (request.getParameter("key") == null || request.getParameter("key").isEmpty()) {
                odb = new OrderDAO();
            } else {
                odb = new OrderDAO();
                String key = request.getParameter("key");
            }
            int page, numperpage,max=0;
            if (request.getParameter("entryperpage") == null
                    || request.getParameter("entryperpage").isEmpty()
                    || request.getParameter("entryperpage").equals("0")) {
                numperpage = 2;
            } else {
                numperpage = Integer.parseInt(request.getParameter("entryperpage"));
            }
            String xpage = request.getParameter("page");
            int size = 0;
            if(request.getParameter("order").equals("1")){
                size = odb.getSizeOfListHandle(request.getParameter("key"));
            }
            else if(request.getParameter("order").equals("2")){
                size = odb.getSizeOfListOnDelivery(request.getParameter("key"));
            }
            else if(request.getParameter("order").equals("3")){
                size = odb.getSizeOfListSuccess(request.getParameter("key"));
            }
            else if(request.getParameter("order").equals("4")){
                size = odb.getSizeOfListCancel(request.getParameter("key"));
            }
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
            if(request.getParameter("order").equals("1")){
                list = odb.getListByPageHandle(start, numperpage, request.getParameter("key"));
            }
            else if(request.getParameter("order").equals("2")){
                list = odb.getListByPageOnDelivery(start, numperpage, request.getParameter("key"));
            }
            else if(request.getParameter("order").equals("3")){
                list = odb.getListByPageSuccess(start, numperpage, request.getParameter("key"));
            }
            else if(request.getParameter("order").equals("4")){
                list = odb.getListByPageCancel(start, numperpage, request.getParameter("key"));
            }
            request.setAttribute("key", request.getParameter("key"));
            request.setAttribute("start", start);
            request.setAttribute("end", end);
            request.setAttribute("entryperpage", numperpage);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("list", list);
            if(request.getParameter("order").equals("1")){
                request.getRequestDispatcher("NewOrderAdmin.jsp").forward(request, response);
            }
            else if(request.getParameter("order").equals("2")){
                request.getRequestDispatcher("table-data-oder.jsp").forward(request, response);
            }
            else if(request.getParameter("order").equals("3")){
                request.getRequestDispatcher("SuccessOrderAdmin.jsp").forward(request, response);
            }
            else if(request.getParameter("order").equals("4")){
                request.getRequestDispatcher("CancelOrderAdmin.jsp").forward(request, response);
            }
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
