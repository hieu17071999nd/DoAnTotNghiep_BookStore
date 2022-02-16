package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderItemRepo extends JpaRepository<OrderItem, Long> {

    List<OrderItem> findAllByStatus(Long status);

    List<OrderItem> findAllByBillId(Long billId);
}
