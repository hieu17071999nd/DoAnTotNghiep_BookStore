package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.DTO.OrderDto;
import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.Order;
import com.hieuvm.bookstore.model.OrderItem;
import com.hieuvm.bookstore.service.OrderService;
import com.hieuvm.bookstore.service.CustomerService;
import com.hieuvm.bookstore.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private OrderItemService orderItemService;

    @RequestMapping(value = "/admin/order/get", method = RequestMethod.GET)
    public String getOrderItem(ModelMap modelMap){
        Pageable pageable = PageRequest.of(0, 5);
        modelMap.addAttribute("list", orderService.getAll(pageable));
        int totalPage= (int) Math.ceil((double) orderService.getAllOrder().size()/5);
        modelMap.addAttribute("page_id",1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page",1);

//        List<Order> orders = orderService.findAllByIdIsNotNullOrderByCreateDateDesc();
//        modelMap.addAttribute("orders",orders);
//        int numPage= (int) Math.ceil((double) orders.size()/2);
//        modelMap.addAttribute("num_page",numPage);
//        modelMap.addAttribute("page_id",1);
        return "admin/order_manage";
    }

    @RequestMapping(value = "/admin/order/get2", method = RequestMethod.GET)
    private String getAll2(ModelMap modelMap, @RequestParam("page") int page, @RequestParam("maxPageItem") int maxPageItem) {
        Pageable pageable = PageRequest.of(page - 1, maxPageItem);
        modelMap.addAttribute("list", orderService.getAll(pageable));
        int totalPage= (int) Math.ceil((double) orderService.getAllOrder().size()/maxPageItem);
        modelMap.addAttribute("page_id",maxPageItem * (page -1) + 1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page", page);
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
