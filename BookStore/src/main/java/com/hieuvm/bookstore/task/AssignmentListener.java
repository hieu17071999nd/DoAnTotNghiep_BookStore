package com.hieuvm.bookstore.task;

import com.hieuvm.bookstore.model.Order;
import com.hieuvm.bookstore.model.Product;
import com.hieuvm.bookstore.repository.OrderRepo;
import com.hieuvm.bookstore.repository.ProductRepo;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.DelegateTask;

public class AssignmentListener extends AbstractTaskListener {
    @Override
    public void notify(DelegateTask delegateTask) {
//        TaskService taskService = getBean(TaskService.class);
//        DelegateExecution execution = delegateTask.getExecution();
//        OrderRepo orderRepo = getBean(OrderRepo.class);
//        ProductRepo productRepo = getBean(ProductRepo.class);
//
//        Order order = orderRepo.findOne(execution.getProcessInstanceId());
//
//        //set assign cho user task
//        taskService.setAssignee(delegateTask.getId(), DataUtil.safeToString(order.getStaffId()));



    }
}
