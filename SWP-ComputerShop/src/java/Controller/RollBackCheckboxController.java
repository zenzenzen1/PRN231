/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import Entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RollBackCheckboxController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        String check = req.getParameter("rollback");
        if (check.equals("1")) {
            productDAO.rollbackAllProduct();
        } else {

            String ids = req.getParameter("ids");
            String[] listID = ids.split(",");
            for (int i = 0; i < listID.length; i++) {
                productDAO.rollbackProduct(Integer.parseInt(listID[i]));
            }
        }
        int page, numperpage;

        if (req.getParameter("entryperpage") == null
                || req.getParameter("entryperpage").isEmpty()
                || req.getParameter("entryperpage").equals("0")) {
            numperpage = 2;
        } else {
            numperpage = Integer.parseInt(req.getParameter("entryperpage"));
        }
        String xpage = req.getParameter("page");
        int size = productDAO.getSizeOfListDelete(req.getParameter("key"));
        int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));

        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(numperpage * page, size);
        List<Product> list = productDAO.getListByDeletePage(start, numperpage, req.getParameter("key"));

        
        req.setAttribute("key", req.getParameter("key"));
        req.setAttribute("start", start);
        req.setAttribute("entryperpage", numperpage);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("data", list);
        req.setAttribute("end", end);
        req.setAttribute("size", size);
        req.getRequestDispatcher("table-delete-product.jsp").forward(req, resp);
    }
    
}
