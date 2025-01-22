/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author wth0z
 */
public class OrderDetail {
    private Product sp;
    private Order order;
    private int quantity;
    private String toltalPrice;
    private int discount;

    public OrderDetail() {
    }

    public OrderDetail(Product sp, Order order, int quantity, String toltalPrice, int discount) {
        this.sp = sp;
        this.order = order;
        this.quantity = quantity;
        this.toltalPrice = toltalPrice;
        this.discount = discount;
    }

    public Product getSp() {
        return sp;
    }

    public void setSp(Product sp) {
        this.sp = sp;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getToltalPrice() {
        return toltalPrice;
    }

    public void setToltalPrice(String toltalPrice) {
        this.toltalPrice = toltalPrice;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }
    
    
}
