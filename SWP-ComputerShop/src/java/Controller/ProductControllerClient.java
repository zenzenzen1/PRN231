/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.BrandDAO;
import DAO.CategoryDAO;
import DAO.GuaranteeDAO;
import DAO.ProductDAO;
import Entity.Brand;
import Entity.Cart;
import Entity.Category;
import Entity.Guarantee;
import Entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductControllerClient extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
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
            request.setAttribute("sizec", cart.getTotalQuantity());
            request.setAttribute("totalCart", cart.getTotalCart());
            request.setAttribute("cart", cart);
            String optionSort = request.getParameter("optionSort");
            String key = request.getParameter("key");
            ArrayList<Product> listAll = new ArrayList<Product>();
            BrandDAO brandDAO = new BrandDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<Brand> listBrand = brandDAO.getListBrands();
            ArrayList<Category> listCategorys = categoryDAO.getListCategory();
            List<Product> list;
            ArrayList<Product> listProduct = new ArrayList<>();
            String[] listPriceCheckBox = {"Dưới 1 triệu",
                "Từ 1-5 triệu",
                "Từ 5-10 triệu",
                "Từ 10-20 triệu",
                "Trên 20 triệu"};

            String[] listRamCheckBox = {
                "4GB",
                "8GB",
                "16GB",
                "32GB"};
            String[] listCPUCheckbox = {"AMD",
                "Intel Core i3",
                "Intel Core i5"};

            ProductDAO pdb = new ProductDAO();
            String[] brandCheck_raw = request.getParameterValues("brands");
            String[] cateagoryCheck_raw = request.getParameterValues("categoris");
            String[] priceCheck_raw = request.getParameterValues("prices");
            String[] ramCheck_raw = request.getParameterValues("rams");
            String[] CPUCheck_raw = request.getParameterValues("cpus");

            boolean[] checkcid = new boolean[listCategorys.size() + 1];
            boolean[] checkbid = new boolean[listBrand.size() + 1];
            boolean[] checkpid = new boolean[listPriceCheckBox.length + 1];
            boolean[] checkrid = new boolean[listRamCheckBox.length + 1];
            boolean[] checkCPUid = new boolean[listCPUCheckbox.length + 1];

            //cate
            int[] categoris = null;
            if (cateagoryCheck_raw != null) {
                categoris = new int[cateagoryCheck_raw.length];
                for (int i = 0; i < categoris.length; i++) {
                    categoris[i] = Integer.parseInt(cateagoryCheck_raw[i]);
                }
            }
            if (cateagoryCheck_raw == null || cateagoryCheck_raw[0].equals("0")) {
                checkcid[0] = true;
            }
            if ((cateagoryCheck_raw != null) && (categoris[0] != 0)) {
                checkcid[0] = false;
                for (int i = 1; i < checkcid.length; i++) {
                    checkcid[i] = ischeck(listCategorys.get(i - 1).getCategoryID(), categoris);
                }
            }
            //brand
            int[] brands = null;
            if (brandCheck_raw != null) {
                brands = new int[brandCheck_raw.length];
                for (int i = 0; i < brands.length; i++) {
                    brands[i] = Integer.parseInt(brandCheck_raw[i]);
                }
            }
            if (brandCheck_raw == null || brandCheck_raw[0].equals("0")) {
                checkbid[0] = true;
            }
            if ((brandCheck_raw != null) && (brands[0] != 0)) {
                checkbid[0] = false;
                for (int i = 1; i < checkbid.length; i++) {
                    checkbid[i] = ischeck(listBrand.get(i - 1).getBrandID(), brands);
                }
            }
            //price
            int[] prices = null;
            if (priceCheck_raw != null) {
                prices = new int[priceCheck_raw.length];
                for (int i = 0; i < prices.length; i++) {
                    prices[i] = Integer.parseInt(priceCheck_raw[i]);
                }

            }

            if (priceCheck_raw == null || priceCheck_raw[0].equals("0")) {
                checkpid[0] = true;
            }

            if ((priceCheck_raw != null) && (prices[0] != 0)) {
                checkpid[0] = false;
                for (int i = 1; i < checkpid.length; i++) {
                    checkpid[i] = ischeck((i), prices);
                }
            }
            //ram
            int[] rams = null;
            if (ramCheck_raw != null) {
                rams = new int[ramCheck_raw.length];
                for (int i = 0; i < rams.length; i++) {
                    rams[i] = Integer.parseInt(ramCheck_raw[i]);
                }

            }

            if (ramCheck_raw == null || ramCheck_raw[0].equals("0")) {
                checkrid[0] = true;
            }

            if ((ramCheck_raw != null) && (rams[0] != 0)) {
                checkrid[0] = false;
                for (int i = 1; i < checkrid.length; i++) {
                    checkrid[i] = ischeck((i), rams);
                }
            }
            //cpu
            int[] cpus = null;
            if (CPUCheck_raw != null) {
                cpus = new int[CPUCheck_raw.length];
                for (int i = 0; i < cpus.length; i++) {
                    cpus[i] = Integer.parseInt(CPUCheck_raw[i]);
                }

            }

            if (CPUCheck_raw == null || CPUCheck_raw[0].equals("0")) {
                checkCPUid[0] = true;
            }

            if ((CPUCheck_raw != null) && (cpus[0] != 0)) {
                checkCPUid[0] = false;
                for (int i = 1; i < checkCPUid.length; i++) {
                    checkCPUid[i] = ischeck((i), cpus);
                }
            }

            //phantrang
            int page, numperpage = 9;
            String xpage = request.getParameter("page");
            int size;

            size = pdb.getSizeOfListProductClientByCategoryId(request.getParameter("key"), cateagoryCheck_raw, brandCheck_raw, priceCheck_raw, ramCheck_raw, CPUCheck_raw);

            int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));

            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(numperpage * page, size);
            if (optionSort == null || optionSort.isEmpty()) {
                optionSort = "0";
            }
            list = pdb.getListProductClient(start, numperpage, request.getParameter("key"), cateagoryCheck_raw, brandCheck_raw, priceCheck_raw, ramCheck_raw, CPUCheck_raw, optionSort);

            //phantrang
            request.setAttribute("optionSort", optionSort);
            request.setAttribute("brandCheck_raw", brandCheck_raw);
            request.setAttribute("checkbid", checkbid);
            request.setAttribute("ramCheck_raw", ramCheck_raw);
            request.setAttribute("checkrid", checkrid);
            request.setAttribute("cateagoryCheck_raw", cateagoryCheck_raw);
            request.setAttribute("checkcid", checkcid);
            request.setAttribute("priceCheckBox", listPriceCheckBox);
            request.setAttribute("checkpid", checkpid);
            request.setAttribute("CPUCheck_raw", CPUCheck_raw);
            request.setAttribute("checkCPUid", checkCPUid);
            request.setAttribute("listCPUCheckbox", listCPUCheckbox);

            request.setAttribute("listRamCheckBox", listRamCheckBox);
            request.setAttribute("listCategorys", listCategorys);

            request.setAttribute("key", request.getParameter("key"));
            request.setAttribute("start", start);
            request.setAttribute("entryperpage", numperpage);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("brand", listBrand);

            request.setAttribute("listProductClient", list);
            request.setAttribute("end", end);
            request.setAttribute("size", size);
            request.setAttribute("id", request.getParameter("id"));
            request.getRequestDispatcher("Product.jsp").forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private boolean ischeck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
            return false;
        }
    }

}
