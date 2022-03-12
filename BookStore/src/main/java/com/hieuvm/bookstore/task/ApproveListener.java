package com.hieuvm.bookstore.task;

import com.hieuvm.bookstore.model.Customer;
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
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.identity.User;
import org.activiti.engine.task.Task;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ApproveListener extends AbstractTaskListener {
    @Override
    public void notify(DelegateTask delegateTask) {
        TaskService taskService = getBean(TaskService.class);
        DelegateExecution execution = delegateTask.getExecution();
        OrderRepo orderRepo = getBean(OrderRepo.class);
        OrderItemRepo orderItemRepo = getBean(OrderItemRepo.class);
        ProductRepo productRepo = getBean(ProductRepo.class);
        CustomerRepo customerRepo = getBean(CustomerRepo.class);
        IdentityService identityService = getBean(IdentityService.class);

        String bpId = execution.getProcessInstanceId();
        Order order = orderRepo.getById(Long.valueOf(bpId));

//        order.setStaffId(1L); //set ID nhan vien duyet don hang
        order.setStatus(2L);  // chuyen doi trang thai don hang thanh 2: da duyet don
        orderRepo.save(order);

        // khi don hang da duoc duyet thi ta se tru so luong cua san pham con trong kho di voi so luong san pham da mua
        List<OrderItem> orderItems = orderItemRepo.findAllByOrderId(order.getId());
        for (OrderItem orderItem : orderItems) {
            Product product = productRepo.getById(orderItem.getProductId());
            product.setQuantily(product.getQuantily() - orderItem.getNumber());
            productRepo.save(product);
        }

        Task task = taskService.createTaskQuery().taskCandidateGroup("staffs").singleResult();
        System.out.println("Task" + task.getId());

//        vd usser la "admin"
        User user = identityService.newUser("admin");
        identityService.saveUser(user);
        taskService.addCandidateUser(task.getId(), "admin");
        task = taskService.createTaskQuery().taskCandidateUser("admin").singleResult();
        taskService.claim(task.getId(), "admin");

        Map<String, Object> variables = new HashMap<>();
        Customer customer = customerRepo.getById(order.getCustomerId());
//        variables.put("customerName", customer.getName());
//        variables.put("emailAddressCustomer", customer.getAddress());

//        hoan thanhf task
        taskService.complete(task.getId(), variables);

//        taskService.setAssignee(delegateTask.getId(), DataUtil.safeToString(order.getStaffId()));
    }
}
