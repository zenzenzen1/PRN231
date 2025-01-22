
package Controller;


import DAO.BlogDao;
import Entity.Cart;
import Entity.New;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

public class Blog extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] c = request.getCookies();
        String txt = "";
        if (c != null) {
            for (Cookie i : c) {
                if (i.getName().equals("cart")) {
                    txt += i.getValue();
                }
            }
        }
        Cart cart = new Cart(txt);
        request.setAttribute("size", cart.getTotalQuantity());
        request.setAttribute("totalCart", cart.getTotalCart());
        request.setAttribute("cart", cart);
        try {
            BlogDao blogDao = new BlogDao();
            ArrayList<New> newestBlogs = blogDao.getNewestBlogs(6);

            request.setAttribute("newestBlogs", newestBlogs);
            request.getRequestDispatcher("Blog.jsp").forward(request, response);
        } catch (Exception ex) {
            // Handle the exception appropriately
        }
    }
}