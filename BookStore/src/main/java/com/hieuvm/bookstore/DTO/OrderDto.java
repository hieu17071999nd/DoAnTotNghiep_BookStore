package com.hieuvm.bookstore.DTO;

import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.Order;
import com.hieuvm.bookstore.model.OrderItem;

import java.util.List;

public class OrderDto {
    private Order order;

    private Customer customer;

    private List<OrderItem> orderItems;

    public OrderDto() {
    }

    public OrderDto(Order order, Customer customer, List<OrderItem> orderItems) {
        this.order = order;
        this.customer = customer;
        this.orderItems = orderItems;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
}
