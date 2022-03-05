package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.OrderItem;
import com.hieuvm.bookstore.model.Staff;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface OrderItemService {

//    List<Staff> getAll(Pageable pageable);
    List<OrderItem> getAll(Pageable pageable);

    List<OrderItem> getAllOrderItem();

    List<OrderItem> getAllOrderItemByOrderId(Long orderId);

    List<OrderItem> getAllByStatus(Long status);

    Boolean insert(OrderItem orderItem);

    OrderItem getById(Long id);

    void deleteOrderItem(Long id);

    OrderItem findOne(Long id);

    Boolean save(OrderItem orderItem);

    int totalItem();
}
