/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.GuaranteeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 *
 * @author vinh1
 */
@WebServlet(name = "GuaranteeAddConfirmController", urlPatterns = {"/guaranteeAddConfirm"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class GuaranteeAddConfirmController extends HttpServlet {

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
            out.println("<title>Servlet GuaranteeAddConfirmController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuaranteeAddConfirmController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("guaranteeAddCf.jsp").forward(request, response);
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
        int userID = Integer.parseInt(request.getParameter("userID"));
        int productID = Integer.parseInt(request.getParameter("productID"));
        int dateGuarantee = Integer.parseInt(request.getParameter("dateGuarantee"));
        String adminName = request.getParameter("adminName");
        Part img = request.getPart("img");
        String des_error = request.getParameter("Des_error");
        String seri = request.getParameter("seri");
        GuaranteeDAO gdb = new GuaranteeDAO();
        HttpSession session = request.getSession();
        String fileImg;
        if (img != null && img.getSize() > 0) {
            fileImg = img.getSubmittedFileName();//            
//            String realPath = request.getServletContext().getRealPath("imageGuarantee");
            img.write("D:\\SWP391_LapTop\\web\\imageGuarantee\\" + fileImg);
        } else {
            fileImg = "";
        }
        if (gdb.addGuarantee( userID, productID,dateGuarantee,adminName,fileImg,des_error,seri)) {
            request.setAttribute("errorGuaratee", "Đã tạo bảo hành");             
            session.removeAttribute("GuaranteeID");
            session.removeAttribute("OrderID");
            session.removeAttribute("OrderInfo");
            session.removeAttribute("EndGuarantee");
            request.getRequestDispatcher("guaranteeAddCf.jsp").forward(request, response);
        } else {
            request.setAttribute("errorGuaratee", "Chưa tạo bảo hành");
            request.getRequestDispatcher("guaranteeAddCf.jsp").forward(request, response);
        }
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
