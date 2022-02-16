package com.hieuvm.bookstore.DTO;

import com.hieuvm.bookstore.model.Bill;
import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.OrderItem;

import java.util.List;

public class BillDto {
    private Bill bill;

    private Customer customer;

    private List<OrderItem> orderItems;

    public BillDto() {
    }

    public BillDto(Bill bill, Customer customer, List<OrderItem> orderItems) {
        this.bill = bill;
        this.customer = customer;
        this.orderItems = orderItems;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
