package com.hieuvm.bookstore.serviceImpl;

import com.hieuvm.bookstore.model.Order;
import com.hieuvm.bookstore.repository.OrderRepo;
import com.hieuvm.bookstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepo orderRepo;

    @Override
    public List<Order> getAllByStatus(Long status) {
        return orderRepo.findAllByStatus(1L);
    }

    public List<Order> getAll(Pageable pageable) {
        return orderRepo.findAll(pageable).getContent();
    }

    public List<Order> getAllOrder() {
        return orderRepo.findAll();
    }

    public Boolean insert(Order order) {
        orderRepo.save(order);
        return true;
    }

    public Order getById(Long id) {
        return orderRepo.getById(id);
    }

    public void deletePost(Long id) {
        orderRepo.deleteById(id);
    }

    public Order findOne(Long id) {
        return orderRepo.getById(id);
    }

    public Boolean save(Order bill) {
        orderRepo.save(bill);
        return true;
    }

    public int totalItem() {
        return (int) orderRepo.count();
    }
}
