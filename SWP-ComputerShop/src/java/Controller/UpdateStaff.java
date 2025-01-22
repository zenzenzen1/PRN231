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
public class UpdateStaff extends HttpServlet {

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
        RoleDAO rdb = new RoleDAO();
        List<Role> list = rdb.getAllRole();
        try {
            int id = Integer.parseInt(id_raw);
            Admin1 a = adb.getAdmin(id);
            request.setAttribute("admin", a);
            request.setAttribute("list", list);
            request.setAttribute("key", request.getParameter("key"));
            request.setAttribute("entryperpage", request.getParameter("entryperpage"));
            request.setAttribute("page", request.getParameter("page"));
            request.getRequestDispatcher("UpdateStaff.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("UpdateStaffController: " + e);
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
        String role_raw = request.getParameter("role");
        String id_raw = request.getParameter("id");
        Part img = request.getPart("img");
        if (img != null && img.getSize() > 0) {
            String fileName = img.getSubmittedFileName();
         
            if (fileName != null && !fileName.isEmpty()) {
                // Ghi tệp tin vào thư mục chỉ khi tên tệp tin khác null và không rỗng
                img.write("D:\\SWP391_LapTop\\web\\image1\\" + fileName);
            }
            try {
                int role = Integer.parseInt(role_raw);
                int id = Integer.parseInt(id_raw);
                boolean status = Boolean.valueOf(request.getParameter("status"));
                adb.updateStaff(name, address, phone, email, role, status, fileName, id);
            } catch (Exception e) {
                System.out.println("doPostUpdateStaff: " + e);
            }
        } else {
            try {
                int role = Integer.parseInt(role_raw);
                int id = Integer.parseInt(id_raw);
                boolean status = Boolean.valueOf(request.getParameter("status"));
                adb.updateStaff(name, address, phone, email, role, status, "", id);
            } catch (Exception e) {
                System.out.println("ok1");
                System.out.println("doPostUpdateStaff: " + e);
            }
        }
        int page, numperpage;
        if (request.getParameter("entryperpage") == null
                || request.getParameter("entryperpage").isEmpty()
                || request.getParameter("entryperpage").equals("0")) {
            numperpage = 2;
        } else {
            numperpage = Integer.parseInt(request.getParameter("entryperpage"));
        }
        String xpage = request.getParameter("page");
        int size = adb.getSizeOfList(request.getParameter("key"));
        int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(numperpage * page, size);
        List<Admin1> list = adb.getListByPage(start, numperpage, request.getParameter("key"));
        request.setAttribute("key", request.getParameter("key"));
        request.setAttribute("start", start);
        request.setAttribute("entryperpage", numperpage);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("data", list);
        request.setAttribute("end", end);
        request.getRequestDispatcher("AdminStaff.jsp").forward(request, response);
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
