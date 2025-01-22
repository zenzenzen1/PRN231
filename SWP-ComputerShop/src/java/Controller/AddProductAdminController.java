/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.BrandDAO;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import Entity.Admin;
import Entity.Brand;
import Entity.Category;
import Entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet("/imageProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class AddProductAdminController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("acc");
        int adminID = admin.getAdminID();
        String productName = req.getParameter("name");
        String quantity = req.getParameter("quantity");
        String category = req.getParameter("category");
        String brand = req.getParameter("brand");
        String price = req.getParameter("price");
        String discount = req.getParameter("discount");
        String guarantee = req.getParameter("guarantee");
        String otherDes = req.getParameter("motangan");
        String imgDetails = req.getParameter("imageDetails");
        String description = req.getParameter("motachitiet");
        ProductDAO productDAO = new ProductDAO();
        
        Part fileProduct = req.getPart("tailieu");
       String fileProductPath;
        if (fileProduct != null && fileProduct.getSize() > 0) {
            fileProductPath  = fileProduct.getSubmittedFileName();
              fileProduct.write("D:\\SWP391_LapTop\\web\\FileProduct\\" + fileProductPath);
        }else{
            fileProductPath = "";
        }
        
        
        Part largeImg = req.getPart("largeimage");
        String fileLargeImg;
        if (largeImg != null && largeImg.getSize() > 0) {
            fileLargeImg = largeImg.getSubmittedFileName();         
            largeImg.write("D:\\SWP391_LapTop\\web\\FileProduct\\" + fileLargeImg);
        } else {
            fileLargeImg = "";
        }

        productDAO.addProduct(productName, brand, category, quantity, price, discount, guarantee, otherDes, description, fileLargeImg, imgDetails, adminID,fileProductPath);

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
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(numperpage * page, size);
        List<Product> list = productDAO.getListByPage(start, numperpage, req.getParameter("key"));
        req.setAttribute("key", req.getParameter("key"));
        req.setAttribute("start", start);
        req.setAttribute("entryperpage", numperpage);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("data", list);
        req.setAttribute("end", end);

        req.getRequestDispatcher("table-data-product.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> dataCategory = categoryDAO.getListCategory();
        BrandDAO brandDAO = new BrandDAO();
        ArrayList<Brand> dataBrand = brandDAO.getListBrands();
        req.setAttribute("listCategory", dataCategory);
        req.setAttribute("listBrand", dataBrand);
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
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(numperpage * page, size);

        req.setAttribute("key", req.getParameter("key"));
        req.setAttribute("start", start);
        req.setAttribute("entryperpage", numperpage);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("end", end);

        req.getRequestDispatcher("form-add-san-pham.jsp").forward(req, resp);
    }

}
