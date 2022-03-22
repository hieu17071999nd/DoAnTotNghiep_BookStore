package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.Staff;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {

    List<Customer> getAll(Pageable pageable);

    List<Customer> getAllCustomer();

    Boolean insert(Customer customer);

    Customer getById(Long id);

    Boolean save(Customer customer);

    Customer login(String username, String password);

    List<Customer> findAllByUsernameAndStatus(String username);

}
