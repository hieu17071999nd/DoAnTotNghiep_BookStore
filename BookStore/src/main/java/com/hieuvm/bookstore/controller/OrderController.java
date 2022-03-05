package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.DTO.OrderDto;
import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.Order;
import com.hieuvm.bookstore.model.OrderItem;
import com.hieuvm.bookstore.service.OrderService;
import com.hieuvm.bookstore.service.CustomerService;
import com.hieuvm.bookstore.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderService billService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private OrderItemService orderItemService;

    @RequestMapping(value = "/admin/order/get", method = RequestMethod.GET)
    public String getOrderItem(ModelMap modelMap){
        List<Order> orders = orderService.getAllByStatus(1L);
        modelMap.addAttribute("orders",orders);
        int numPage= (int) Math.ceil((double) orders.size()/2);
        modelMap.addAttribute("num_page",numPage);
        modelMap.addAttribute("page_id",1);
        return "admin/order_manage";
    }



    @GetMapping("/admin/order/{orderId}")
    public String getDetail(@PathVariable("orderId") Long orderId, ModelMap modelMap){
        Order order= orderService.getById(orderId);
        Customer customer = customerService.getById(order.getCustomerId());
        List<OrderItem> orderItemList = orderItemService.getAllOrderItemByOrderId(order.getId());
        OrderDto orderDto = new OrderDto(order, customer, orderItemList);
        modelMap.addAttribute("orderDto",orderDto);
        return "admin/order_detail";
    }
}
