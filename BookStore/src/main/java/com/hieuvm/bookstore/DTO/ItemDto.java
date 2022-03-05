package com.hieuvm.bookstore.DTO;

import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.Item;
import com.hieuvm.bookstore.model.Product;

public class ItemDto {

    private Item item;
    private Product product;
    private Customer customer;

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public double getItemMoney(){
        return product.getPrice() * item.getNumber();
    }
}
