package com.hieuvm.bookstore.model;

import javax.persistence.*;

@Entity
@Table(name = "ORDER_ITEM")
public class OrderItem extends BaseEntity{

    @Column(name = "ORDER_ID")
    private Long orderId;

    @Column(name = "PRODUCT_ID")
    private Long productId;

    @Column(name = "NAME")
    private String name;

    @Column(name = "IMAGE")
    private String image;

    @Column(name = "NUMBER")
    private Long number;

    @Column(name = "PRICE")
    private Long price;

    @Column(name = "CUSTOMER_ID")
    private Long customerId;

    @Column(name = "STATUS")
    private Long status;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getNumber() {
        return number;
    }

    public void setNumber(Long number) {
        this.number = number;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double  getItemMoney(){
        return price * number;
    }

}
