/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AdminDAO;
import DAO.RoleDAO;
import Entity.Admin1;
import Entity.Role;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.List;

/**
 *
 * @author wth0z
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AdminAccount extends HttpServlet {

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
            out.println("<title>Servlet UpdateStaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStaff at " + request.getContextPath() + "</h1>");
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
        AdminDAO adb = new AdminDAO();
        String id_raw = request.getParameter("id");
        try {
            int id = Integer.parseInt(id_raw);
            Admin1 a = adb.getAdminAccount(id);
            request.setAttribute("admin", a);
            request.getRequestDispatcher("AdminAccount.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("AdminAccountController: " + e);
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
        AdminDAO adb = new AdminDAO();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String id_raw = request.getParameter("id");
        Part img = request.getPart("img");
        if (img != null && img.getSize() > 0) {
            String fileName = img.getSubmittedFileName();
            
            if (fileName != null && !fileName.isEmpty()) {
                // Ghi tệp tin vào thư mục chỉ khi tên tệp tin khác null và không rỗng
                img.write("D:\\SWP391_LapTop\\web\\image1\\" + fileName);
            }
            try {
                int id = Integer.parseInt(id_raw);
                boolean status = Boolean.valueOf(request.getParameter("status"));
                adb.updateAcc(name, address, phone, email, status, fileName, id, request.getParameter("pass"));
                Admin1 a = adb.getAdminAccount(id);
                request.setAttribute("admin", a);
            } catch (Exception e) {
                System.out.println("doPostAddStaff: " + e);
            }
        } else {
            try {
                int id = Integer.parseInt(id_raw);
                boolean status = Boolean.valueOf(request.getParameter("status"));
                adb.updateStaffNoImg(name, address, phone, email, status, id, request.getParameter("pass"));
                Admin1 a = adb.getAdminAccount(id);
                request.setAttribute("admin", a);
            } catch (Exception e) {
                System.out.println("doPostAddStaff: " + e);
            }
        }
        request.setAttribute("success", "1");
        request.getRequestDispatcher("AdminAccount.jsp").forward(request, response);
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
