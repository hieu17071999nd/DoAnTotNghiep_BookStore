package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepo extends JpaRepository<Order, Long> {

    List<Order> findAllByStatus(Long status);

    List<Order> findAllByIdIsNotNullOrderByCreateDateDesc();
}
