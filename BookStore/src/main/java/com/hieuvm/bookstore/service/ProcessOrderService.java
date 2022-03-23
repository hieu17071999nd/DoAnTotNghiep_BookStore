package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.Order;
import com.hieuvm.bookstore.repository.EmployeeRepository;
import org.activiti.engine.*;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProcessOrderService {

	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	private RuntimeService runtimeService;

	@Autowired
	private TaskService taskService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private CustomerService customerService;

	@PostConstruct
	void init() {
		int i = 1;
//		runtimeService.startProcessInstanceByKey("simple-process", new HashMap<>());
	}

	public void startBookOrder(Order order) {
//		Customer customer = customerService.getById(order.getCustomerId());
//		Map<String, Object> variables = new HashMap<>();
//		variables.put("customer_email", customer.getEmail().toLowerCase());

		String bpId = runtimeService.startProcessInstanceByKey("bookOrder").getProcessInstanceId();
		order.setId(Long.parseLong(bpId));
		orderService.insert(order);
	}

	public List<Task> getTasks(String assignee) {
		return taskService.createTaskQuery().taskAssignee(assignee).list();
	}

	// complete the task
	public void completeTask(String taskId) {
		taskService.complete(taskId);
	}

}
