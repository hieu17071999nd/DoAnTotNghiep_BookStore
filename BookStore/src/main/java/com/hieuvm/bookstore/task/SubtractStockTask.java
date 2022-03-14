package com.hieuvm.bookstore.task;

import com.hieuvm.bookstore.model.Order;
import com.hieuvm.bookstore.model.OrderItem;
import com.hieuvm.bookstore.model.Product;
import com.hieuvm.bookstore.repository.CustomerRepo;
import com.hieuvm.bookstore.repository.OrderItemRepo;
import com.hieuvm.bookstore.repository.OrderRepo;
import com.hieuvm.bookstore.repository.ProductRepo;
import org.activiti.engine.IdentityService;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateExecution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubtractStockTask extends AbstractTask2 {

    @Override
    public void execute(DelegateExecution execution) throws Exception {

        OrderRepo orderRepo = getBean(OrderRepo.class);
        OrderItemRepo orderItemRepo = getBean(OrderItemRepo.class);
        ProductRepo productRepo = getBean(ProductRepo.class);
        String bpId = execution.getProcessInstanceId();
        Order order = orderRepo.getById(Long.valueOf(bpId));

        List<OrderItem> orderItems = orderItemRepo.findAllByOrderId(order.getId());
        for (OrderItem orderItem : orderItems) {
            Product product = productRepo.getById(orderItem.getProductId());
            product.setQuantily(product.getQuantily() - orderItem.getNumber());
        }
    }
}
