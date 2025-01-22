/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import DAO.ProductDAO;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class Cart {

    private List<Item> cart;
    private String totalCart;

    public Cart() {
        cart = new ArrayList<>();
    }

    public String getTotalCart() {
        return totalCart;
    }

    public void setTotalCart(String totalCart) {
        this.totalCart = totalCart;
    }

    public Cart(List<Item> cart) {
        this.cart = cart;
    }

    public List<Item> getCart() {
        return cart;
    }

    public void setCart(List<Item> cart) {
        this.cart = cart;
    }

    private Item getItemByID(int id) {
        for (Item i : cart) {
            if (i.getProduct().getProductID() == id) {
                return i;
            }
        }
        return null;
    }

    public int getTotalQuantity() {
        if (cart == null) {
            return 0;
        }
        return cart.size();
    }

    public void addItem(Item t) {
        if (getItemByID(t.getProduct().getProductID()) != null) {
            Item m = getItemByID(t.getProduct().getProductID());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            cart.add(t);
        }
    }

    public static String withLargeIntegers(double value) {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(value);
    }

    private String getTotal() {
        double total = 0;
        if (cart != null) {
            for (int i = 0; i < cart.size(); i++) {
                String price = cart.get(i).getPrice().replaceAll(",", "");
                total += Double.parseDouble(price);
            }
        }
        return withLargeIntegers(total);
    }

    public void removeItem(int id) {
        if (getItemByID(id) != null) {
            cart.remove(getItemByID(id));
        }
    }

    public Cart(String txt) {
        cart = new ArrayList<>();
        List<Item> items = new ArrayList<>();
        ProductDAO pdb = new ProductDAO();
        try {
            if (txt != null && !txt.isEmpty()) {
                if (txt.contains(":")) {
                    String[] s = txt.split(":");
                    for (String i : s) {
                        String[] n = i.split("-");
                        int id = Integer.parseInt(n[0]);
                        int quantity = Integer.parseInt(n[1]);
                        Product p = pdb.getProductByIdForCart(id);
                        double price = Double.parseDouble(p.getPrice());
                        double sum = (price - (price * p.getDiscount() / 100)) * quantity;
                        double pricediscount = (price - (price * p.getDiscount() / 100));
                        p.setPrice(withLargeIntegers(price));
                        Item t = new Item(p, quantity, withLargeIntegers(sum),withLargeIntegers(pricediscount));
                        items.add(t);
                    }
                    int i = 0;
                    while (!items.isEmpty()) {
                        cart.add(items.get(0));
                        items.remove(0);
                        for (int j = 0; j < items.size();) {
                            if (items.get(j).getProduct().getProductID()
                                    == cart.get(i).getProduct().getProductID()) {
                                cart.get(i).setQuantity(cart.get(i).getQuantity() + items.get(j).getQuantity());
                                items.remove(j);
                                if (j == 0) {
                                    j = 0;
                                } else {
                                    j--;
                                }
                            } else {
                                j++;
                            }
                        }
                        i++;
                    }
                    totalCart = getTotal();
                } else {
                    String[] n = txt.split("-");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    Product p = pdb.getProductByIdForCart(id);
                    double price = Double.parseDouble(p.getPrice());
                    double sum = (price - (price * p.getDiscount() / 100)) * quantity;
                    double pricediscount = (price - (price * p.getDiscount() / 100));
                    p.setPrice(withLargeIntegers(price));
                    Item t = new Item(p, quantity, withLargeIntegers(sum),withLargeIntegers(pricediscount));
                    cart.add(t);
                    totalCart = getTotal();
                }
            } else {
                cart = null;
                totalCart = getTotal();
            }
        } catch (Exception e) {
            System.out.println("Cart: " + e);
        }
    }
}
