package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Order;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface OrderService {

    List<Order> getAll(Pageable pageable);

    List<Order> getAllOrder();

    List<Order> getAllByStatus(Long status);

    List<Order> findAllByIdIsNotNullOrderByCreateDateDesc();

    Boolean insert(Order order);

    Order getById(Long id);

    void deletePost(Long id);

    Order findOne(Long id);

    Boolean save(Order bill);

    int totalItem();
}
