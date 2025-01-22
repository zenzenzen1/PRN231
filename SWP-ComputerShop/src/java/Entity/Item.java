/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author wth0z
 */
public class Item {
    private Product product;
    private int quantity;
    private String price;
    private String pricediscount;

    public Item() {
    }

    public String getPricediscount() {
        return pricediscount;
    }

    public void setPricediscount(String pricediscount) {
        this.pricediscount = pricediscount;
    }

    public Item(Product product, int quantity, String price, String pricediscount) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.pricediscount = pricediscount;
    }


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
    
    
}
