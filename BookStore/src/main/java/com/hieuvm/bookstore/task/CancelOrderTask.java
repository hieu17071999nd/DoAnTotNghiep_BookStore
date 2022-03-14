package com.hieuvm.bookstore.task;

import com.hieuvm.bookstore.model.Order;
import com.hieuvm.bookstore.model.OrderItem;
import com.hieuvm.bookstore.model.Product;
import com.hieuvm.bookstore.repository.OrderItemRepo;
import com.hieuvm.bookstore.repository.OrderRepo;
import com.hieuvm.bookstore.repository.ProductRepo;
import org.activiti.engine.delegate.DelegateExecution;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CancelOrderTask extends AbstractTask2 {

    @Override
    public void execute(DelegateExecution execution) throws Exception {

        OrderRepo orderRepo = getBean(OrderRepo.class);
        OrderItemRepo orderItemRepo = getBean(OrderItemRepo.class);
        String bpId = execution.getProcessInstanceId();
        Order order = orderRepo.getById(Long.valueOf(bpId));

        order.setStatus(0L);
        orderRepo.save(order);

        List<OrderItem> orderItems = orderItemRepo.findAllByOrderId(order.getId());
        for (OrderItem orderItem : orderItems) {
            orderItem.setStatus(0L);
            orderItemRepo.save(orderItem);
        }
    }
}
