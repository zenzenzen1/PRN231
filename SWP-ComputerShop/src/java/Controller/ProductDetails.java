/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import Entity.Cart;
import Entity.Image;
import Entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 *
 * @author Admin
 */
public class ProductDetails extends HttpServlet {
    public static String withLargeIntegers(double value) {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(value);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] c = req.getCookies();
        String txt = "";
        if (c != null) {
            for (Cookie i : c) {
                if (i.getName().equals("cart")) {
                    txt += i.getValue();
                }
            }
        }
        Cart cart = new Cart(txt);
        req.setAttribute("size", cart.getTotalQuantity());
        req.setAttribute("totalCart", cart.getTotalCart());
        req.setAttribute("cart", cart);
        ProductDAO productdao = new ProductDAO();
        
        Product p = productdao.getProductByName(req.getPathInfo().substring(1).replaceAll("-", " "));
        int id = p.getProductID();
        Product product = productdao.getProductById(id);
        if (cart.getCart() != null) {
            boolean check = false;
            for (int i = 0; i < cart.getCart().size(); i++) {
                if (cart.getCart().get(i).getProduct().getProductID() == product.getProductID()) {
                    req.setAttribute("max", product.getQuantity() - cart.getCart().get(i).getQuantity());
                    check = true;
                }
                if(!check){
                    req.setAttribute("max", product.getQuantity());
                }
            }
            
        }
        else{
            req.setAttribute("max", product.getQuantity());
        }
        double price =Double.parseDouble(product.getPrice().replaceAll(",", ""));
        double afterdiscount = price - (price * product.getDiscount()/100);
        req.setAttribute("pricediscount", withLargeIntegers(afterdiscount));
        String imgDe = product.getSmallImage();
        if (imgDe != null) {
            Document doc = Jsoup.parse(imgDe);
            Elements imgElements = doc.select("img[src]");
            String[] srcArray = new String[imgElements.size()];
            ArrayList<String> image = new ArrayList<>();
            for (int i = 0; i < imgElements.size(); i++) {
                Element img = imgElements.get(i);
                String src = img.attr("src");
                srcArray[i] = src;
                image.add(src);
            }
            req.setAttribute("data", image);
        }
        req.setAttribute("product", product);
        req.setAttribute("nametab", req.getPathInfo().substring(1).replaceAll("-", " "));
        req.getRequestDispatcher("../product-detail.jsp").forward(req, resp);
    }

}
