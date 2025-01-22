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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DeleteProductController extends HttpServlet {

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        ProductDAO productDAO = new ProductDAO();
//        ArrayList<Product> data = productDAO.get();
//        String[] id = req.getParameterValues("checkBox");
//        if (id == null || id.length == 0) {
//            req.setAttribute("data", data);
//            req.getRequestDispatcher("table-data-product.jsp").forward(req, resp);        
//        } else {
//             for (int i = 0; i < id.length; i++) {
//                productDAO.deleteProduct(Integer.parseInt(id[i]));
//            }
//
//            req.setAttribute("data", data);
//            req.getRequestDispatcher("table-data-product.jsp").forward(req, resp);
//        }
//
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ProductDAO productDAO = new ProductDAO();
        productDAO.deleteProduct(id);
        int page, numperpage;
        if (req.getParameter("entryperpage") == null
                || req.getParameter("entryperpage").isEmpty()
                || req.getParameter("entryperpage").equals("0")) {
            numperpage = 2;
        } else {
            numperpage = Integer.parseInt(req.getParameter("entryperpage"));
        }
        String xpage = req.getParameter("page");
        int size = productDAO.getSizeOfList(req.getParameter("key"));
        int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
            if(page > num) page -= 1;
        }
        int start,end;
        start = (page - 1) * numperpage;
        end = Math.min(numperpage * page, size);
        List<Product> list = productDAO.getListByPage(start, numperpage, req.getParameter("key"));
        req.setAttribute("key", req.getParameter("key"));
        req.setAttribute("start", start);
        req.setAttribute("entryperpage", numperpage);
        req.setAttribute("page", page);
        req.setAttribute("size", size);
        req.setAttribute("num", num);
        req.setAttribute("data", list);
        req.setAttribute("end", end);
        req.getRequestDispatcher("table-data-product.jsp").forward(req, resp);
    }
    

}
