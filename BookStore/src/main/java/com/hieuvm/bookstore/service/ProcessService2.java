package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Employee;
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
public class ProcessService2 {

	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	private RuntimeService runtimeService;

	@Autowired
	private TaskService taskService;

	@Autowired
	private RepositoryService repositoryService;

	@PostConstruct
	void init() {
		int i = 1;
//		runtimeService.startProcessInstanceByKey("simple-process", new HashMap<>());
	}

	public void startBookOrder() {
		ProcessEngine processEngine = ProcessEngineConfiguration
				.createStandaloneInMemProcessEngineConfiguration()
				.buildProcessEngine(); //create Activity engine

		RuntimeService runtimeService = processEngine.getRuntimeService();
		RepositoryService repositoryService = processEngine.getRepositoryService();
		repositoryService.createDeployment()
				.addClasspathResource("chapter1/bookorder.simple.bpmn20.xml")
				.deploy(); // deploy simplebookorder process definition

		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("simplebookorder"); // start bookorder process instance
//		assertNotNull(processInstance.getId());
		System.out.println("id " + processInstance.getId() + " " + processInstance.getProcessDefinitionId());
//		-> id 4 simplebookorder: 1: 3
//		Thông báo này có nghĩa là ID phiên bản quy trình (process instance ID) là 4
//		và định nghĩa quy trình (the process definition) được sử dụng để tạo phiên bản (instance) là định nghĩa đơn hàng đặt hàng (simplebookorder definition) với version 1
//		và ID cơ sở dữ liệu định nghĩa quy trình (process definition database ID) là 3
	}


//	----------------------------------------------------------

	// start the process and set employee as variable
	public String startTheProcess(String assignee) {

		Employee employee = employeeRepository.findByName(assignee);

		Map<String, Object> variables = new HashMap<>();
		variables.put("employee", employee);

		String bpId = runtimeService.startProcessInstanceByKey("simple-process", variables).getProcessInstanceId();
		 runtimeService.setVariable(bpId, "hhh", 1);

		return processInformation();
	}

	// fetching process and task information
	public String processInformation() {

		List<Task> taskList = taskService.createTaskQuery().orderByTaskCreateTime().asc().list();

		StringBuilder processAndTaskInfo = new StringBuilder();
		
		processAndTaskInfo.append("Number of process definition available: "
				+ repositoryService.createProcessDefinitionQuery().count() + " | Task Details= ");

		taskList.forEach(task -> {

			processAndTaskInfo.append("ID: " + task.getId() + ", Name: " + task.getName() + ", Assignee: "
					+ task.getAssignee() + ", Description: " + task.getDescription());
			//them
//			processAndTaskInfo.append("ID test: " + )
		});

		return processAndTaskInfo.toString();
	}

	// fetch task assigned to employee
	public List<Task> getTasks(String assignee) {
		return taskService.createTaskQuery().taskAssignee(assignee).list();
	}

	// complete the task
	public void completeTask(String taskId) {
		taskService.complete(taskId);
	}
}
