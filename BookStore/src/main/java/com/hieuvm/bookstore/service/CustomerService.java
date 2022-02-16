package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Customer;

import java.util.List;

public interface CustomerService {

    List<Customer> getAllCustomer();

    Boolean insert(Customer customer);

    Customer getById(Long id);

    Boolean save(Customer customer);

    Customer login(String username, String password);

}
