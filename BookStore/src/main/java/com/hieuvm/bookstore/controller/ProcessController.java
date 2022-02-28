package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.service.ProcessService;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ProcessController {

	@Autowired
	private ProcessService processService;

	@RequestMapping(value = "/process")
	public String startProcessInstance(@RequestParam String assignee) {
		return processService.startTheProcess(assignee);
	}

	@RequestMapping(value = "/tasks")
	public String getTasks(@RequestParam String assignee) {
		List<Task> tasks = processService.getTasks(assignee);
		return tasks.toString();
	}

	// Complete the task by their ID
	@RequestMapping(value = "/completetask")
	public String completeTask(@RequestParam String taskId) {
		processService.completeTask(taskId);
		return "Task with id " + taskId + " has been completed!";
	}

	@RequestMapping(value = "/getXMLOrder")
	public String getXMLOrder(@RequestParam String taskId) {
		processService.completeTask(taskId);
		return "Task with id " + taskId + " has been completed!";
	}
}
