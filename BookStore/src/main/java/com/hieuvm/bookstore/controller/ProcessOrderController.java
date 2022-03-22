package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.DTO.ItemDto;
import com.hieuvm.bookstore.model.*;
import com.hieuvm.bookstore.repository.BaseQueryRepo;
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
import org.springframework.web.bind.annotation.*;
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

	@Autowired
	private BaseQueryRepo baseQueryRepo;

	// tao don hang moi cua khach hang

	@RequestMapping(value = "/processOrder")
	public String checkout(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Long customerId = Long.parseLong(request.getParameter("customer_id"));
		String address = request.getParameter("address");
		HttpSession session = request.getSession();
		List<ItemDto> itemDtos = (List<ItemDto>) session.getAttribute("itemDtos");
		Long totalNumber = 0L;
		for (ItemDto itemDto : itemDtos) {
			totalNumber += itemDto.getItem().getNumber() * itemDto.getProduct().getPrice();
			// check number product
			Item item = itemDto.getItem();
			Product productOld = productService.getById(itemDto.getProduct().getId());
		}
		Order order = new Order();
		order.setCustomerId(customerId);
		order.setDeliveryAddress(address); //dia chi giao hang
		order.setNumerOrderItem(Long.valueOf(itemDtos.size())); // so san pham mua
		order.setTotal(totalNumber);
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

	// phe duyet don hang

	@RequestMapping(value = "/approve/{id}")
	public String approveOrder(@PathVariable("id") Long id, HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		String username= (String) session.getAttribute("username");
		Staff staff = staffService.getStaffByUsername(username);
		Map<String, Object> variables = new HashMap<>();
		variables.put("var_approveOrder", true);
		List<Task> tasks = taskService.createTaskQuery().taskDefinitionKey("approveOrdersTask").list();
		for (Task task: tasks) {
			taskService.complete(task.getId(), variables);
		}
		Order order = orderService.getById(id);
		order.setStatus(2L);
		orderService.save(order);
		List<Order> orders = orderService.getAllByStatus(1L);
		modelMap.addAttribute("orders",orders);
		modelMap.addAttribute("page_id",1);
		modelMap.addAttribute("msg", "Phê duyệt đơn hàng thành công");
		return "redirect:/admin/order/get";
	}

	@RequestMapping(value = "/cancel/{id}")
	public String cancelOrder(@PathVariable("id") Long id, HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		String username= (String) session.getAttribute("username");
		Staff staff = staffService.getStaffByUsername(username);
		Map<String, Object> variables = new HashMap<>();
		variables.put("var_approveOrder", false);
		List<Task> tasks = taskService.createTaskQuery().taskDefinitionKey("approveOrdersTask").list();
		for (Task task: tasks) {
			taskService.complete(task.getId(), variables);
		}
		Order order = orderService.getById(id);
		order.setStatus(0L);
		orderService.save(order);
		List<Order> orders = orderService.getAllByStatus(1L);
		modelMap.addAttribute("orders", orders);
		int numPage= (int) Math.ceil((double) orders.size()/2);
		modelMap.addAttribute("num_page",numPage);
		modelMap.addAttribute("page_id",1);
		modelMap.addAttribute("msg", "Hủy đơn hàng thành công");
		return "redirect:/admin/order/get";
	}

	//chuyen giao cho don vi van chuyen

	@RequestMapping(value = "/choose/transportOrder/{id}")
	public String chooseTransportOrder(@PathVariable("id") Long id, ModelMap modelMap) {
		modelMap.addAttribute("id", id);
		modelMap.addAttribute("staffTransports", staffService.findAllByLevelAndStatus(3L, 1L));
		return "admin/order_choose_transport";
	}

	@RequestMapping(value = "/transportOrder")
	public String transportOrder(@RequestParam("id") Long id, @RequestParam("staff_id") Long staff_id, HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		String username= (String) session.getAttribute("username");
		Staff staff = staffService.getStaffByUsername(username);
		List<Task> tasks = taskService.createTaskQuery().taskDefinitionKey("assignedStaffTransportTask").list();
		for (Task task: tasks) {
			taskService.complete(task.getId());
		}
		Order order = orderService.getById(id);
		order.setStatus(3L);
		order.setStaffId(staff_id);
		orderService.save(order);

		//quay lai trang
		String page = request.getParameter("page");
		String maxPageItem = request.getParameter("maxPageItem");
		modelMap.addAttribute("list", baseQueryRepo.getOrderShipper(2L, page, maxPageItem));
		int totalPage= (int) Math.ceil((double) orderService.getAllByStatus(2L).size()/5);
		modelMap.addAttribute("page_id",1);
		modelMap.addAttribute("totalPage",totalPage);
		modelMap.addAttribute("page",1);
		return "admin/order_transport_shipper";
	}

	// shipper giao hang

	@RequestMapping(value = "/successfulDeliveryConfirm/{id}")
	public String successfulDeliveryConfirm(@PathVariable("id") Long id, HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		String username= (String) session.getAttribute("username");
		Staff staff = staffService.getStaffByUsername(username);
		Map<String, Object> variables = new HashMap<>();
		variables.put("var_delivery", true);
		List<Task> tasks = taskService.createTaskQuery().taskDefinitionKey("successfulDeliveryConfirmationTask").list();
		for (Task task: tasks) {
			taskService.complete(task.getId(), variables);
		}
		Order order = orderService.getById(id);
		order.setStatus(4L);
		order.setStaffId(staff.getId());
		orderService.save(order);
		List<Order> orders = orderService.getAllByStatus(1L);
		modelMap.addAttribute("orders", orders);
		int numPage= (int) Math.ceil((double) orders.size()/2);
		modelMap.addAttribute("num_page",numPage);
		modelMap.addAttribute("page_id",1);
		modelMap.addAttribute("msg", "Đơn hàng đã được giao thành công");
		return "redirect:/admin/order/shipper/get";
	}

	@RequestMapping(value = "/cancel2/{id}")
	public String cancelOrder2(@PathVariable("id") Long id, HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		String username= (String) session.getAttribute("username");
		Staff staff = staffService.getStaffByUsername(username);
		Map<String, Object> variables = new HashMap<>();
		variables.put("var_delivery", false);
		List<Task> tasks = taskService.createTaskQuery().taskDefinitionKey("successfulDeliveryConfirmationTask").list();
		for (Task task: tasks) {
			taskService.complete(task.getId(), variables);
		}
		Order order = orderService.getById(id);
		order.setStatus(0L);
		orderService.save(order);
		List<Order> orders = orderService.getAllByStatus(1L);
		modelMap.addAttribute("orders", orders);
		int numPage= (int) Math.ceil((double) orders.size()/2);
		modelMap.addAttribute("num_page",numPage);
		modelMap.addAttribute("page_id",1);
		modelMap.addAttribute("msg", "Hủy đơn hàng thành công");
		return "redirect:/admin/order/shipper/get";
	}

	//	xem luong don hang
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
