package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.DTO.BillDto;
import com.hieuvm.bookstore.model.Bill;
import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.OrderItem;
import com.hieuvm.bookstore.service.BillService;
import com.hieuvm.bookstore.service.CustomerService;
import com.hieuvm.bookstore.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderItemController {

    @Autowired
    private BillService billService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/admin/order/get", method = RequestMethod.GET)
    public String getOrderItem(ModelMap modelMap){
        List<OrderItem> orderItems = orderItemService.getAllByStatus(1L);
        modelMap.addAttribute("orderItems",orderItems);
        int numPage= (int) Math.ceil((double) orderItems.size()/2);
        modelMap.addAttribute("num_page",numPage);
        modelMap.addAttribute("page_id",1);
        return "admin/order_manage";
    }

//    @GetMapping("/admin/bill/{billId}")
//    public String getDetail(@PathVariable("billId") Long billId, ModelMap modelMap){
//        Bill bill= billService.getById(billId);
//        Customer customer = customerService.getById(bill.getCustomerId());
//        List<OrderItem> orderItemList = orderItemService.getAllOrderItemByBillId(bill.getId());
//        BillDto billDTO = new BillDto(bill, customer, orderItemList);
//        modelMap.addAttribute("bill",billDTO);
//        return "admin/bill_detail";
//    }
}
