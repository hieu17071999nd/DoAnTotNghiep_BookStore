package com.hieuvm.bookstore.service;

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
	private RepositoryService repositoryService;

	@Autowired
	private ProductService productService;

	@Autowired
	private OrderItemService orderItemService;

	@Autowired
	private OrderService orderService;

	@PostConstruct
	void init() {
		int i = 1;
//		runtimeService.startProcessInstanceByKey("simple-process", new HashMap<>());
	}

	public void startBookOrder(Order order) {
		Map<String, Object> variables = new HashMap<>();
		variables.put("var_checkNumberProduct", order.getCheckProduct());

//		variables.put("emailAddressCustomer", "hieumv99nd@gmail.com");
//		variables.put("customerName", "hieu dtrai");

		String bpId = runtimeService.startProcessInstanceByKey("bookOrder", variables).getProcessInstanceId();
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
