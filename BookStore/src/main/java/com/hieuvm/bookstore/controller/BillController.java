package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.DTO.BillDto;
import com.hieuvm.bookstore.model.*;
import com.hieuvm.bookstore.service.BillService;
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
    private BillService billService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/admin/bill/get", method = RequestMethod.GET)
    public String getBill(ModelMap modelMap){
        List<BillDto> billDTOS = new ArrayList<>();
        List<Bill> billList =billService.getAllBill();
        for (Bill bill : billList) {
            Customer customer = customerService.getById(bill.getCustomerId());
            List<OrderItem> orderItemList = orderItemService.getAllOrderItemByBillId(bill.getId());
            BillDto billDTO = new BillDto(bill, customer, orderItemList);
            billDTOS.add(billDTO);
        }
        modelMap.addAttribute("bills",billDTOS);
        int numPage= (int) Math.ceil((double) billDTOS.size()/2);
        modelMap.addAttribute("num_page",numPage);
        modelMap.addAttribute("page_id",1);
        return "admin/bill_manage";
    }

    @GetMapping("/admin/bill/{billId}")
    public String getDetail(@PathVariable("billId") Long billId, ModelMap modelMap){
        Bill bill= billService.getById(billId);
        Customer customer = customerService.getById(bill.getCustomerId());
        List<OrderItem> orderItemList = orderItemService.getAllOrderItemByBillId(bill.getId());
        BillDto billDTO = new BillDto(bill, customer, orderItemList);
        modelMap.addAttribute("bill",billDTO);
        return "admin/bill_detail";
    }
}
