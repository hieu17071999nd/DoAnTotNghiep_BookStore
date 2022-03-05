package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.DTO.ItemDto;
import com.hieuvm.bookstore.model.Order;
import com.hieuvm.bookstore.model.OrderItem;
import com.hieuvm.bookstore.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Base64;
import java.util.List;

@RestController
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
	private OrderService billService;

	@Autowired
	private ProcessOrderService processOrderService;

	@Autowired
	private TaskManagementController taskManagementController;

	@Autowired
	private TaskProcessService taskProcessService;

	@RequestMapping(value = "/processOrder")
	public void startProcessInstance(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Long customerId = Long.parseLong(request.getParameter("customer_id"));
		String address = request.getParameter("address");
		HttpSession session = request.getSession();
		List<ItemDto> itemDtos = (List<ItemDto>) session.getAttribute("itemDtos");
		Long totalNumber = 0L;
		for (ItemDto itemDto : itemDtos) {
			totalNumber += itemDto.getItem().getNumber() * itemDto.getProduct().getPrice();
		}
		Order order = new Order();
		order.setCustomerId(customerId);
		order.setDeliveryAddress(address); //dia chi giao hang
		order.setNumerOrderItem(Long.valueOf(itemDtos.size())); // so san pham mua
		order.setTotal(totalNumber);
		order.setCreateDate(new java.util.Date());
		Boolean a = billService.insert(order);

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
//            Product product = productService.getById(item.getProductId());
//            product.setQuantily(product.getQuantily() - orderItem.getNumber());
//            productService.save(product);
		}
//		processOrderService.startBookOrder(orderItem);
	}

	@RequestMapping(value = "/getXMLOrder/{id}")
	public void getXMLOrder(@PathVariable("id") Long id) throws Exception {
		//id ở đây là id của đơn hàng: bpId kiểu String
		taskManagementController.setDiagramUrl(null);
		String processDefinitionId = taskProcessService.getProcessDefinitionIdByProcessId(id.toString());
		byte[] diagramByteArray = taskProcessService.generateDiagram(processDefinitionId, id.toString());
		if (diagramByteArray == null) {
			return ;
		}
		taskManagementController.setDiagramUrl("data:" + "image/" + "png" + ";base64," + Base64.getEncoder().encodeToString(diagramByteArray));
//		return"";
	}

	@RequestMapping(value = "/approve/{id}")
	public String approveOrder(@PathVariable("id") Long id) {

		return "Phê duyệt đơn hàng thành công";
	}

	@RequestMapping(value = "/cancle/{id}")
	public String cancleOrder(@PathVariable("id") Long id) {

		return "Hủy đơn hàng thành công";
	}

}
