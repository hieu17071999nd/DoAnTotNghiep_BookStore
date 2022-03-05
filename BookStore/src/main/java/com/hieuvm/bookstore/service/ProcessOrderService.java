package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Employee;
import com.hieuvm.bookstore.model.OrderItem;
import com.hieuvm.bookstore.model.Product;
import com.hieuvm.bookstore.repository.EmployeeRepository;
import org.activiti.engine.*;
import org.activiti.engine.runtime.ProcessInstance;
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

	@PostConstruct
	void init() {
		int i = 1;
//		runtimeService.startProcessInstanceByKey("simple-process", new HashMap<>());
	}

	public void startBookOrder(OrderItem orderItem) {
		Product product = productService.getById(orderItem.getProductId());

		// put bien kiem tra dieu kien
		Map<String, Object> variables = new HashMap<>();
		variables.put("var_numberProductOrder", orderItem.getNumber());
		variables.put("var_numberProductOld", product.getQuantily());

		String bpId = runtimeService.startProcessInstanceByKey("bookOrder", variables).getProcessInstanceId();
		orderItem.setId(Long.parseLong(bpId));
//		runtimeService.setVariable(bpId, "hhh", 1);
		orderItemService.insert(orderItem);


	}

	public List<Task> getTasks(String assignee) {
		return taskService.createTaskQuery().taskAssignee(assignee).list();
	}

	// complete the task
	public void completeTask(String taskId) {
		taskService.complete(taskId);
	}

}
