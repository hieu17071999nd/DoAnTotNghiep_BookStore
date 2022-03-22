package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.DTO.OrderDto;
import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.Order;
import com.hieuvm.bookstore.model.OrderItem;
import com.hieuvm.bookstore.repository.BaseQueryRepo;
import com.hieuvm.bookstore.service.OrderService;
import com.hieuvm.bookstore.service.CustomerService;
import com.hieuvm.bookstore.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private BaseQueryRepo baseQueryRepo;

    //get all tat ca don hang
    @RequestMapping(value = "/admin/order/get", method = RequestMethod.GET)
    public String getOrder(ModelMap modelMap){
        Pageable pageable = PageRequest.of(0, 5);
        modelMap.addAttribute("list", orderService.getAll(pageable));
        int totalPage= (int) Math.ceil((double) orderService.getAllOrder().size()/5);
        modelMap.addAttribute("page_id",1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page",1);
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

    // get all don hang moi
    @RequestMapping(value = "/admin/order/approve/get", method = RequestMethod.GET)
    public String getOrderApprove(ModelMap modelMap, HttpServletRequest request){
        String page = request.getParameter("page");
        String maxPageItem = request.getParameter("maxPageItem");
        modelMap.addAttribute("list", baseQueryRepo.getOrderShipper(1L, page, maxPageItem));
        int totalPage= (int) Math.ceil((double) orderService.getAllByStatus(1L).size()/5);
        modelMap.addAttribute("page_id",1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page",1);
        return "admin/order_approve_manage";
    }

    @RequestMapping(value = "/admin/order/approve/get2", method = RequestMethod.GET)
    private String getAllApprove2(ModelMap modelMap, @RequestParam("page") int page, @RequestParam("maxPageItem") int maxPageItem) {
        modelMap.addAttribute("list", baseQueryRepo.getOrderShipper(1L, String.valueOf(page), String.valueOf(maxPageItem)));
        int totalPage= (int) Math.ceil((double) orderService.getAllByStatus(1L).size()/5);
        modelMap.addAttribute("page_id",maxPageItem * (page -1) + 1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page", page);
        return "admin/order_approve_manage";
    }

    // chi tiet don hang
    @GetMapping("/admin/order/{orderId}")
    public String getDetail(@PathVariable("orderId") Long orderId, ModelMap modelMap){
        Order order= orderService.getById(orderId);
        Customer customer = customerService.getById(order.getCustomerId());
        List<OrderItem> orderItemList = orderItemService.getAllOrderItemByOrderId(order.getId());
        OrderDto orderDto = new OrderDto(order, customer, orderItemList);
        modelMap.addAttribute("orderDto",orderDto);
        return "admin/order_detail";
    }

    // get all don hang giao cho shipper
    @RequestMapping(value = "/admin/order/transport/shipper/get", method = RequestMethod.GET)
    public String getOrderTransportShipper(ModelMap modelMap, HttpServletRequest request){
        String page = request.getParameter("page");
        String maxPageItem = request.getParameter("maxPageItem");
        modelMap.addAttribute("list", baseQueryRepo.getOrderShipper(2L, page, maxPageItem));
        int totalPage= (int) Math.ceil((double) orderService.getAllByStatus(2L).size()/5);
        modelMap.addAttribute("page_id",1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page",1);
        return "admin/order_transport_shipper";
    }

    @RequestMapping(value = "/admin/order/transport/shipper/get2", method = RequestMethod.GET)
    private String getOrderTransportShipper2(ModelMap modelMap, @RequestParam("page") int page, @RequestParam("maxPageItem") int maxPageItem) {
        modelMap.addAttribute("list", baseQueryRepo.getOrderShipper(2L, String.valueOf(page), String.valueOf(maxPageItem)));
        int totalPage= (int) Math.ceil((double) orderService.getAllByStatus(2L).size()/5);
        modelMap.addAttribute("page_id",maxPageItem * (page -1) + 1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page", page);
        return "admin/order_transport_shipper";
    }

    //shipper confirm
    @RequestMapping(value = "/admin/order/shipper/get", method = RequestMethod.GET)
    public String getOrderShipper(ModelMap modelMap, HttpServletRequest request){
        String page = request.getParameter("page");
        String maxPageItem = request.getParameter("maxPageItem");

        modelMap.addAttribute("list", baseQueryRepo.getOrderShipper(3L, page, maxPageItem));
        int totalPage= (int) Math.ceil((double) orderService.getAllByStatus(3L).size()/5);
        modelMap.addAttribute("page_id",1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page",1);
        return "admin/order_shipper_manage";
    }

    @RequestMapping(value = "/admin/order/shipper/get2", method = RequestMethod.GET)
    public String getOrderShipper2(ModelMap modelMap, @RequestParam("page") int page, @RequestParam("maxPageItem") int maxPageItem){
        modelMap.addAttribute("list", baseQueryRepo.getOrderShipper(3L, String.valueOf(page), String.valueOf(maxPageItem)));
        int totalPage= (int) Math.ceil((double) orderService.getAllByStatus(3L).size()/5);
        modelMap.addAttribute("page_id",1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page",1);
        return "admin/order_shipper_manage";
    }
}
