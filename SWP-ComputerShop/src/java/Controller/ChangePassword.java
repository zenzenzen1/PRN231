/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author vinh1
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/changePassword"})
public class ChangePassword extends HttpServlet {

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
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
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
        String page = request.getParameter("Page");
        String email = request.getParameter("Email");
        String oldPassword = request.getParameter("OldPassword");
        String newPassword = request.getParameter("NewPassword");
        String confirmPassword = request.getParameter("ConfirmPassword");
        LoginDAO change = new LoginDAO();
        boolean hasLowerCase = false;
        boolean hasUpperCase = false;
        boolean hasDigit = false;
        boolean hasSpecialChar = false;

        for (char c : newPassword.toCharArray()) {
            if (Character.isLowerCase(c)) {
                hasLowerCase = true;
            } else if (Character.isUpperCase(c)) {
                hasUpperCase = true;
            } else if (Character.isDigit(c)) {
                hasDigit = true;
            } else {
                // Assume any character that is not a letter or digit is a special character
                hasSpecialChar = true;
            }
        }
        boolean isValid = hasLowerCase && hasUpperCase && hasDigit && hasSpecialChar;
        if (change.checkLoginUser(email, oldPassword) != null) {
            if (!newPassword.isEmpty() && !confirmPassword.isEmpty()) {
                if (newPassword.equals(confirmPassword)) {
                    if (isValid) {
                        if (6 <= newPassword.length() && newPassword.length() <= 12) {
                            boolean check = change.changePassword(email, newPassword);
                            if (check == true) {
//                                request.setAttribute("error", "Password account " + email + " change done");
                                request.getRequestDispatcher("login.jsp").forward(request, response);
                            }
                        } else {
                            request.setAttribute("error", "Mật khẩu có độ dài 6-12");
                            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                        }
                    } else {
                        request.setAttribute("error", "Mật khẩu có một chữ viết hoa, một chữ viết thường, số và kí tự đặc biệt ");
                        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("error", "Mật khẩu và mật khẩu xác nhận không giống nhau");
                    request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Mật khẩu cũ không đúng ");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
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
