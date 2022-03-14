package com.hieuvm.bookstore.serviceImpl;

import com.hieuvm.bookstore.model.OrderItem;
import com.hieuvm.bookstore.repository.OrderItemRepo;
import com.hieuvm.bookstore.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemServiceImpl implements OrderItemService {

    @Autowired
    private OrderItemRepo orderItemRepo;

    @Override
    public List<OrderItem> getAllByStatus(Long status) {
        return orderItemRepo.findAllByStatus(1L);
    }

    public List<OrderItem> getAll(Pageable pageable) {
        return orderItemRepo.findAll(pageable).getContent();
    }

    public List<OrderItem> getAllOrderItem() {
        return orderItemRepo.findAll();
    }

    public List<OrderItem> getAllOrderItemByOrderId(Long orderId) {
        return orderItemRepo.findAllByOrderId(orderId);
    }

    public List<OrderItem> findAllByCustomerIdAndStatus(Long customerId, Long status) {
        return orderItemRepo.findAllByCustomerIdAndStatus(customerId, status);
    }

    public Boolean insert(OrderItem orderItem) {
        orderItemRepo.save(orderItem);
        return true;
    }

    public OrderItem getById(Long id) {
        return orderItemRepo.getById(id);
    }

    public void deleteOrderItem(Long id) {
        orderItemRepo.deleteById(id);
    }

    public OrderItem findOne(Long id) {
        return orderItemRepo.getById(id);
    }

    public Boolean save(OrderItem orderItem) {
        orderItemRepo.save(orderItem);
        return true;
    }

    public int totalItem() {
        return (int) orderItemRepo.count();
    }
}
