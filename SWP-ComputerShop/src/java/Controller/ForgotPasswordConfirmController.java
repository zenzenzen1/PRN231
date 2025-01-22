/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import static Controller.RegisterConfirmController.generateOTP;
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

/**
 *
 * @author vinh1
 */
@WebServlet(name = "ForgotPasswordConfirmController", urlPatterns = {"/forgotPasswordConfirm"})
public class ForgotPasswordConfirmController extends HttpServlet {

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
            out.println("<title>Servlet ForgotPasswordConfirmController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPasswordConfirmController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        int page = Integer.parseInt(request.getParameter("page"));
        String email = (String) session.getAttribute("Email");
        if (page == 2) {
            String otpUpadate = generateOTP();
            MailSender mailSender = new MailSender();
            mailSender.sendEmail(email, otpUpadate);
            session.setAttribute("OTP", otpUpadate);
            response.sendRedirect("forgotPasswordConfirm.jsp");
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

        HttpSession session = request.getSession();
        LoginDAO ldb = new LoginDAO();
        int page = Integer.parseInt(request.getParameter("page"));
        String otp = request.getParameter("Otp");
        String otpSession = (String) session.getAttribute("OTP");
        String email = (String) session.getAttribute("Email");
        if (page == 1) {
            if (otp.equals(otpSession)) {
                session.removeAttribute("OTP");
                request.getRequestDispatcher("forgotChangePass.jsp").forward(request, response);
            } else {
                request.setAttribute("errorEmail", "Mã xác nhận không đúng");
                request.getRequestDispatcher("forgotPasswordConfirm.jsp").forward(request, response);
            }
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
