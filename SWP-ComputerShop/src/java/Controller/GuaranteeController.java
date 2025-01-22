/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.GuaranteeDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import Entity.Guarantee;
import Entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vinh1
 */
@WebServlet(name = "GuaranteeController", urlPatterns = {"/guarantee"})
public class GuaranteeController extends HttpServlet {

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
            String key = request.getParameter("key");
            ArrayList<Guarantee> listAll = new ArrayList<Guarantee>();
            GuaranteeDAO gdb = new GuaranteeDAO();
            int page, numperpage;
            if (request.getParameter("entryperpage") == null
                    || request.getParameter("entryperpage").isEmpty()
                    || request.getParameter("entryperpage").equals("0")) {
                numperpage = 2;
            } else {
                numperpage = Integer.parseInt(request.getParameter("entryperpage"));
            }
            String xpage = request.getParameter("page");
            int size;
                size = gdb.getSizeOfList(request.getParameter("key"));            

            int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));

            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(numperpage * page, size);
            List<Guarantee> list;
                list = gdb.getListByPage(start, numperpage, request.getParameter("key"));
            
            System.out.println("size" + size);
            System.out.println("num" + num);
            
            request.setAttribute("key", request.getParameter("key"));
            request.setAttribute("start", start);
            request.setAttribute("entryperpage", numperpage);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("listGuarantee", list);
            request.setAttribute("end", end);
            request.setAttribute("size", size);
            request.setAttribute("id", request.getParameter("id"));
            request.getRequestDispatcher("guaranteeManager.jsp").forward(request, response);

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
