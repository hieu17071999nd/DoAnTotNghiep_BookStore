package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.DTO.OrderDto;
import com.hieuvm.bookstore.model.*;
import com.hieuvm.bookstore.service.OrderService;
import com.hieuvm.bookstore.service.CustomerService;
import com.hieuvm.bookstore.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class BillController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private CustomerService customerService;

//    @RequestMapping(value = "/admin/bill/get", method = RequestMethod.GET)
//    public String getBill(ModelMap modelMap){
//        List<OrderDto> orderDtos = new ArrayList<>();
//        List<Order> orderList =orderService.getAllOrder();
//        for (Order order : orderList) {
//            Customer customer = customerService.getById(order.getCustomerId());
//            List<OrderItem> orderItemList = orderItemService.getAllOrderItemByBillId(order.getId());
//            OrderDto billDTO = new OrderDto(order, customer, orderItemList);
//            orderDtos.add(billDTO);
//        }
//        modelMap.addAttribute("orderDtos",orderDtos);
//        int numPage= (int) Math.ceil((double) orderDtos.size()/2);
//        modelMap.addAttribute("num_page",numPage);
//        modelMap.addAttribute("page_id",1);
//        return "admin/bill_manage";
//    }
//
//    @GetMapping("/admin/bill/{orderId}")
//    public String getDetail(@PathVariable("orderId") Long orderId, ModelMap modelMap){
//        Order order= orderService.getById(orderId);
//        Customer customer = customerService.getById(order.getCustomerId());
//        List<OrderItem> orderItemList = orderItemService.getAllOrderItemByBillId(order.getId());
//        OrderDto orderDTO = new OrderDto(order, customer, orderItemList);
//        modelMap.addAttribute("orderDTO",orderDTO);
//        return "admin/bill_detail";
//    }
}
