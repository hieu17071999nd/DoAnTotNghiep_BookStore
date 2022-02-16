package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepo extends JpaRepository<Customer, Long> {

    List<Customer> findAllByStatus(Long status);
}
