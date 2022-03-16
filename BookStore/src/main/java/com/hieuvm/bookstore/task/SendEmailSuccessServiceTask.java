package com.hieuvm.bookstore.task;

import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.Order;
import com.hieuvm.bookstore.model.OrderItem;
import com.hieuvm.bookstore.model.Product;
import com.hieuvm.bookstore.repository.CustomerRepo;
import com.hieuvm.bookstore.repository.OrderItemRepo;
import com.hieuvm.bookstore.repository.OrderRepo;
import com.hieuvm.bookstore.repository.ProductRepo;
import com.hieuvm.bookstore.service.EmailService;
import org.activiti.engine.delegate.DelegateExecution;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SendEmailSuccessServiceTask extends AbstractTask2 {

    @Override
    public void execute(DelegateExecution execution) throws Exception {
        OrderRepo orderRepo = getBean(OrderRepo.class);
        CustomerRepo customerRepo = getBean(CustomerRepo.class);
        EmailService emailService = getBean(EmailService.class);
        String bpId = execution.getProcessInstanceId();
        Order order = orderRepo.getById(Long.valueOf(bpId));
        Customer customer = customerRepo.getById(order.getCustomerId());

        String subject = "Xác nhận đơn hàng";
        String content = "Chào " + customer.getName()
                + " .Bạn vừa đặt 1 đơn hàng sách tại cửa hàng Minh Hiếu. "
                + "Đơn hàng sẽ được giao trong vòng 1-5 ngày tới.";
        emailService.sendEmail(customer.getEmail(), subject, content);
    }
}
