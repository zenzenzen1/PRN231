/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.BrandDAO;
import DAO.ProductDAO;
import Entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class LoadBrandAjax extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String brandID = req.getParameter("brandID");
        BrandDAO brandDAO = new BrandDAO();
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> listProduct = new ArrayList<>();
        if (brandID.equals("0")) {
            listProduct = productDAO.getListProductClient();
        } else {
            listProduct = productDAO.getListProductByBrandId(brandID);
        }

        PrintWriter out = resp.getWriter();
        for (Product o : listProduct) {
            out.println(" <div class=\"col-xl-3 col-lg-4 col-md-4 col-12\">\n"
                    + "                                                <div class=\"single-product\">\n"
                    + "                                                    <div class=\"product-img\">\n"
                    + "                                                        <a href=\"product-details.jsp\">\n"
                    + "                                                            <img style=\"width: 269px; height: 367px;\"class=\"default-img\" src=\"imageProduct/" + o.getLargeImage() + "\" alt=\"#\">\n"
                    + "                                                            <img style=\"width: 269px; height: 367px;\"class=\"hover-img\" src=\"imageProduct/" + o.getLargeImage() + "\" alt=\"#\">\n"
                    + "                                                        </a>\n"
                    + "                                                        <div class=\"button-head\">\n"
                    + "                                                            <div class=\"product-action\">\n"
                    + "                                                                <a data-toggle=\"modal\" data-target=\"#exampleModal\" title=\"Quick View\" href=\"#\"><i class=\" ti-eye\"></i><span>Quick Shop</span></a>\n"
                    + "                                                                <a title=\"Wishlist\" href=\"#\"><i class=\" ti-heart \"></i><span>Add to Wishlist</span></a>\n"
                    + "                                                                <a title=\"Compare\" href=\"#\"><i class=\"ti-bar-chart-alt\"></i><span>Add to Compare</span></a>\n"
                    + "                                                            </div>\n"
                    + "                                                            <div class=\"product-action-2\">\n"
                    + "                                                                <a title=\"Add to cart\" onclick=\"buy('${item.getProductID()}', '${item.getQuantity()}');CartShow()\">Add to cart</a>\n"
                    + "                                                            </div>\n"
                    + "                                                        </div>\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"product-content\">\n"
                    + "                                                        <h3><a href=\"product-details.jsp\"></a></h3>\n"
                    + "                                                        <div class=\"product-price\">\n"
                    + "                                                            <h6 style=\"font-weight: bold; color: red;\">" + o.getPrice() + " đ</h6><br>\n"
                    + "                                                            <h5 style=\"font-weight: bold\">" + o.getProductName() + "</h5>\n"
                    + "                                                        </div>\n"
                    + "                                                    </div>\n"
                    + "                                                </div>\n"
                    + "                                            </div>");
        }
    }

}
