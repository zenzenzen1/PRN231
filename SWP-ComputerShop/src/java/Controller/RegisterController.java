/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.LoginDAO;
import Untity.MailSender;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.util.Random;
import java.util.regex.Pattern;

/**
 *
 * @author vinh1
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    
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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("register.jsp").forward(request, response);

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
        
        String username = request.getParameter("Name");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        String confirmPassword = request.getParameter("ConfirmPassword");
        String address = request.getParameter("Address");
        String phone = request.getParameter("Phone");
        HttpSession session = request.getSession();
        LoginDAO re = new LoginDAO();
        boolean hasLowerCase = false;
        boolean hasUpperCase = false;
        boolean hasDigit = false;
        boolean hasSpecialChar = false;
        
        for (char c : password.toCharArray()) {
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
        
        
        if (!username.isEmpty() && !email.isEmpty() && !password.isEmpty()
                && !confirmPassword.isEmpty() && !address.isEmpty() && !phone.isEmpty()) {
            if (password.equals(confirmPassword)) {
                if (!re.checkDuplicate(email)) {
                    request.setAttribute("error", "Email đã tồn tại, sử dụng email khác");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else {
                    if (isValid) {
                        if (6 <= password.length() && password.length() <= 12) {
                            String otp = generateOTP();
                            MailSender mailSender = new MailSender();
                            mailSender.sendEmail(email, otp);
                            session.setAttribute("OTP", otp);
                            session.setAttribute("Username", username);
                            session.setAttribute("Address", address);
                            session.setAttribute("Phone", phone);
                            session.setAttribute("Email", email);
                            session.setAttribute("Password", password);
//                            re.createAccount(username, address, phone, email, password);
                            request.getRequestDispatcher("registerConfirm.jsp").forward(request, response);
                        } else {
                            request.setAttribute("error", "Mật khẩu có độ dài 6-12");
                            request.getRequestDispatcher("register.jsp").forward(request, response);
                        }
                    } else {
                        request.setAttribute("error", "Mật khẩu có một chữ viết hoa, một chữ viết thường, số và kí tự đặc biệt ");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                    }
                }
            } else {
                request.setAttribute("error", "Mật khẩu và mật khẩu cữ không giống nhau");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

    }

    public static String generateOTP() {
        String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        int OTP_LENGTH = 6;
        SecureRandom random = new SecureRandom();
        StringBuilder otp = new StringBuilder(OTP_LENGTH);

        for (int i = 0; i < OTP_LENGTH; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            otp.append(randomChar);
        }
        return otp.toString();
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
