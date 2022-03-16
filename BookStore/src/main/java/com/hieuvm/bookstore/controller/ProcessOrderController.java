package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.DTO.ItemDto;
import com.hieuvm.bookstore.model.*;
import com.hieuvm.bookstore.repository.EmployeeRepository;
import com.hieuvm.bookstore.repository.StaffRepo;
import com.hieuvm.bookstore.service.*;
import com.hieuvm.bookstore.task.AbstractTaskListener;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//@RestController
@Controller
public class ProcessOrderController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ItemService itemService;

	@Autowired
	private AddressService addressService;

	@Autowired
	private OrderItemService orderItemService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private StaffService staffService;

	@Autowired
	private ProcessOrderService processOrderService;

	@Autowired
	private TaskManagementController taskManagementController;

	@Autowired
	private TaskProcessService taskProcessService;

	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	private RuntimeService runtimeService;

	@Autowired
	private TaskService taskService;

	@Autowired
	private RepositoryService repositoryService;

	@RequestMapping(value = "/processOrder")
	public String checkout(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Long customerId = Long.parseLong(request.getParameter("customer_id"));
		String address = request.getParameter("address");
		HttpSession session = request.getSession();
		List<ItemDto> itemDtos = (List<ItemDto>) session.getAttribute("itemDtos");
		Long totalNumber = 0L;
		Boolean checkProduct = true;
		for (ItemDto itemDto : itemDtos) {
			totalNumber += itemDto.getItem().getNumber() * itemDto.getProduct().getPrice();
			// check number product
			Item item = itemDto.getItem();
			Product productOld = productService.getById(itemDto.getProduct().getId());
			if (item.getNumber() > productOld.getQuantily()) {
				checkProduct = false;
			}
		}
		Order order = new Order();
		order.setCustomerId(customerId);
		order.setDeliveryAddress(address); //dia chi giao hang
		order.setNumerOrderItem(Long.valueOf(itemDtos.size())); // so san pham mua
		order.setTotal(totalNumber);
		order.setCheckProduct(checkProduct);
		order.setStatus(1L);
		order.setCreateDate(new java.util.Date());
		processOrderService.startBookOrder(order);

		for (ItemDto itemDto : itemDtos) {
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderId(order.getId());
			orderItem.setProductId(itemDto.getItem().getProductId());
			orderItem.setName(itemDto.getProduct().getName());
			orderItem.setImage(itemDto.getProduct().getImage());
			orderItem.setNumber(itemDto.getItem().getNumber());
			orderItem.setPrice(itemDto.getProduct().getPrice());
			orderItem.setCustomerId(itemDto.getItem().getCustomerId());
			orderItem.setStatus(1L);
			orderItem.setCreateDate(new java.util.Date());
			orderItemService.insert(orderItem);
			if (itemDto.getItem().getId() != null) {
				itemService.deleteItem(itemDto.getItem().getId());
			}
		}
		if (order.getId() != 0) {
			session.setAttribute("num_item", itemService.getByCustomerId(customerId).size());
			session.removeAttribute("itemDtos");
			redirectAttributes.addFlashAttribute("msg", "Đơn hàng của bạn đã được xác nhận! ");
		} else {
			redirectAttributes.addFlashAttribute("msg", "Đặt hàng thất bại");
		}
		return "redirect:/thanh-toan";
	}

	@RequestMapping(value = "/approve/{id}")
	public String approveOrder(@PathVariable("id") Long id, HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		String username= (String) session.getAttribute("username");
		Staff staff = staffService.getStaffByUsername(username);
		Order order = orderService.getById(id);
		order.setCheckProduct(true);
		order.setStatus(2L);
		orderService.save(order);
		Map<String, Object> variables = new HashMap<>();
		variables.put("var_checkNumberProduct2", order.getCheckProduct());
		List<Task> tasks = taskService.createTaskQuery().taskDefinitionKey("approveOrderTask5").list();
		for (Task task: tasks) {
			taskService.complete(task.getId(), variables);
		}
		List<Order> orders = orderService.getAllByStatus(1L);
		modelMap.addAttribute("orders",orders);
		modelMap.addAttribute("page_id",1);
		modelMap.addAttribute("msg", "Phê duyệt đơn hàng thành công");
//		return "admin/order_manage";
		return "redirect:/admin/order/get";
	}

	@RequestMapping(value = "/cancel/{id}")
	public String cancelOrder(@PathVariable("id") Long id, HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		String username= (String) session.getAttribute("username");
		Staff staff = staffService.getStaffByUsername(username);
		Order order = orderService.getById(id);
		order.setCheckProduct(false);
		order.setStatus(0L);
		orderService.save(order);
		Map<String, Object> variables = new HashMap<>();
		List<Task> tasks = taskService.createTaskQuery().taskDefinitionKey("approveOrderTask").list();
		for (Task task: tasks) {
			variables.put("var_checkNumberProduct2", order.getCheckProduct());
			taskService.complete(task.getId(), variables);
		}
		List<Order> orders = orderService.getAllByStatus(1L);
		modelMap.addAttribute("orders", orders);
		int numPage= (int) Math.ceil((double) orders.size()/2);
		modelMap.addAttribute("num_page",numPage);
		modelMap.addAttribute("page_id",1);
		modelMap.addAttribute("msg", "Hủy đơn hàng thành công");
//		return "admin/order_manage";
		return "redirect:/admin/order/get";
	}

	@RequestMapping(value = "/transportOrder/{id}")
	public String transportOrder(@PathVariable("id") Long id, HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		String username= (String) session.getAttribute("username");
		Staff staff = staffService.getStaffByUsername(username);
		Order order = orderService.getById(id);
		order.setStatus(3L);
		order.setStaffId(staff.getId());
		orderService.save(order);
		List<Task> tasks = taskService.createTaskQuery().taskDefinitionKey("assignedStaffTransportTask").list();
		List<Task> tasks2 = taskService.createTaskQuery().taskAssignee("assignedStaffTransportTask").list();
		for (Task task: tasks) {
			taskService.complete(task.getId());
		}
		List<Order> orders = orderService.getAllByStatus(1L);
		modelMap.addAttribute("orders", orders);
		int numPage= (int) Math.ceil((double) orders.size()/2);
		modelMap.addAttribute("num_page",numPage);
		modelMap.addAttribute("page_id",1);
		modelMap.addAttribute("msg", "Đã giao cho nhân viên vận chuyển");
//		return "admin/order_manage";
		return "redirect:/admin/order/get";
	}

	@RequestMapping(value = "/successfulDeliveryConfirm/{id}")
	public String successfulDeliveryConfirm(@PathVariable("id") Long id, HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		String username= (String) session.getAttribute("username");
		Staff staff = staffService.getStaffByUsername(username);
		Order order = orderService.getById(id);
		order.setStatus(4L);
		order.setStaffId(staff.getId());
		orderService.save(order);
		List<Task> tasks = taskService.createTaskQuery().taskDefinitionKey("successfulDeliveryConfirmationTask").list();
		for (Task task: tasks) {
			taskService.complete(task.getId());
		}
		List<Order> orders = orderService.getAllByStatus(1L);
		modelMap.addAttribute("orders", orders);
		int numPage= (int) Math.ceil((double) orders.size()/2);
		modelMap.addAttribute("num_page",numPage);
		modelMap.addAttribute("page_id",1);
		modelMap.addAttribute("msg", "Đơn hàng đã được giao thành công");
//		return "admin/order_manage";
		return "redirect:/admin/order/get";
	}

	@RequestMapping(value = "/getXMLOrder/{id}")
	public String getXMLOrder(@PathVariable("id") Long id, ModelMap modelMap) throws Exception {
		//id ở đây là id của đơn hàng: bpId kiểu String
		taskManagementController.setDiagramUrl(null);
		String processDefinitionId = taskProcessService.getProcessDefinitionIdByProcessId(id.toString());
		byte[] diagramByteArray = taskProcessService.generateDiagram(processDefinitionId, id.toString());
		if (diagramByteArray == null) {
			return "admin/order_bpmn";
		}
		taskManagementController.setDiagramUrl("data:" + "image/" + "png" + ";base64," + Base64.getEncoder().encodeToString(diagramByteArray));
		String imgBPMN = taskManagementController.getDiagramUrl();
		modelMap.addAttribute("imgBPMN", imgBPMN);
		return "admin/order_bpmn";
	}

}
