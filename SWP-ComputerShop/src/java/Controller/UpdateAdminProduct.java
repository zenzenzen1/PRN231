/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import jakarta.servlet.annotation.MultipartConfig;
import DAO.BrandDAO;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import Entity.Admin;
import Entity.Brand;
import Entity.Category;
import Entity.Product;
import jakarta.servlet.ServletException;
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
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class UpdateAdminProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("acc");
        int adminId = admin.getAdminID();
        int productID = (Integer) session.getAttribute("productId");
        String largeBefore = (String) session.getAttribute("large");
        String productName = req.getParameter("name");
        String quantity = req.getParameter("quantity");
        String category = req.getParameter("category");
        String brand = req.getParameter("brand");
        String price = req.getParameter("price");
        String discount = req.getParameter("discount");
        String guarantee = req.getParameter("guarantee");
        String otherDes = req.getParameter("motangan");
        String description = req.getParameter("motachitiet");
        String imgDetails = req.getParameter("imageDetails");
        String fileBefore = (String) session.getAttribute("file");
      
        ProductDAO productDAO = new ProductDAO();
        Part fileProduct = req.getPart("tailieu");
        String fileProductPath = fileProduct.getSubmittedFileName();
        if (fileProductPath != null && !fileProductPath.isEmpty()) {
              fileProduct.write("D:\\SWP391_LapTop\\web\\FileProduct\\" + fileProductPath);
        } else {
           fileProductPath = fileBefore;
        } 
        Part largeImg = req.getPart("largeimage");
        String fileLargeImg = largeImg.getSubmittedFileName();
        System.out.println("anh" + fileLargeImg);
        if (fileLargeImg != null && !fileLargeImg.isEmpty()) {
              largeImg.write("D:\\SWP391_LapTop\\web\\imageProduct\\" + fileLargeImg);
        } else {
           fileLargeImg = largeBefore;
        }
        
        productDAO.updateProduct(adminId, productID, productName, quantity, category, brand, price, discount, guarantee, otherDes, description, imgDetails, fileLargeImg,fileProductPath);

        int check = Integer.parseInt(req.getParameter("check"));
        if (check == 1) {
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
            req.getRequestDispatcher("table-delete-product.jsp").forward(req, resp);
        } else {
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
            System.out.println("page = " + page);
            System.out.println("");
            start = (page - 1) * numperpage;
            end = Math.min(numperpage * page, size);
            List<Product> list = productDAO.getListByPage(start, numperpage, req.getParameter("key"));
            req.setAttribute("key", req.getParameter("key"));
            req.setAttribute("start", start);
            req.setAttribute("entryperpage", numperpage);
            req.setAttribute("page", page);
            req.setAttribute("data", list);
            req.setAttribute("num", num);
            req.setAttribute("end", end);
            req.getRequestDispatcher("table-data-product.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        session.setAttribute("productId", id);
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductById(id);
        session.setAttribute("file", product.getFile());
        session.setAttribute("large", product.getLargeImage());
        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> dataCategory = categoryDAO.getListCategory();
        BrandDAO brandDAO = new BrandDAO();
        ArrayList<Brand> dataBrand = brandDAO.getListBrands();
        req.setAttribute("listCategory", dataCategory);
        req.setAttribute("listBrand", dataBrand);
        int check = Integer.parseInt(req.getParameter("check"));
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
        System.out.println(product.getBrandName());
        req.setAttribute("key", req.getParameter("key"));
        req.setAttribute("start", start);
        req.setAttribute("entryperpage", numperpage);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("end", end);
        req.setAttribute("check", check);
        req.setAttribute("Product", product);
        req.getRequestDispatcher("form-update-san-pham.jsp").forward(req, resp);
    }

}
