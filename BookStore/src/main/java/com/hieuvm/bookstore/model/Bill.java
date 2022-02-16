package com.hieuvm.bookstore.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "BILL")
public class Bill extends BaseEntity {

    @Column(name = "CUSTOMER_ID")
    private Long customerId;

    @Column(name = "DELIVERY_ADDRESS")
    private String deliveryAddress;

    @Column(name = "NUMBER_ORDER_ITEM")
    private Long numerOrderItem;

    @Column(name = "TOTAL")
    private Long total;

    @Column(name = "STATUS")
    private Long status;

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public Long getNumerOrderItem() {
        return numerOrderItem;
    }

    public void setNumerOrderItem(Long numerOrderItem) {
        this.numerOrderItem = numerOrderItem;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }
}
