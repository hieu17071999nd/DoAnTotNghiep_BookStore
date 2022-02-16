package com.hieuvm.bookstore.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hieuvm.bookstore.model.*;
import com.hieuvm.bookstore.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AjaxController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ItemService itemService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private BillService billService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/add-cart")
    @ResponseBody
    public String addCart(HttpServletRequest request){
         Long productId= Long.parseLong(request.getParameter("productId"));
        Product product= productService.getById(productId);
        Long customerId= Long.parseLong(request.getParameter("customerId"));
        Long n= Long.parseLong(request.getParameter("n"));
        Item item=new Item();
        item.setNumber(n);
        item.setName(product.getName());
        item.setImage(product.getImage());
        item.setPrice(product.getPrice());
        item.setCustomerId(customerId);
        item.setProductId(productId);
        boolean check=itemService.insert(item);
        if(check){
            HttpSession session=request.getSession();
            session.setAttribute("num_item",itemService.getByCustomerId(customerId).size());
            return "true";
        }else {
            return "false";
        }
    }

    @RequestMapping("/buy-now")
    @ResponseBody
    public String buyNow(HttpServletRequest request){
        Long productId= Long.parseLong(request.getParameter("productId"));
        Long customerId= Long.parseLong(request.getParameter("customerId"));
        Long n= Long.parseLong(request.getParameter("n"));
        Product product= productService.getById(productId);
        Item item=new Item();
        item.setProductId(productId);
        item.setName(product.getName());
        item.setImage(product.getImage());
        item.setNumber(n);
        item.setPrice(product.getPrice());
        item.setCustomerId(customerId);
        List<Item> items=new ArrayList<>();
        items.add(item);
        HttpSession session=request.getSession();
        session.setAttribute("items",items);
        return "ok";
    }
//
//    @RequestMapping("/update-cart")
//    @ResponseBody
//    public String updateteCart(HttpServletRequest request){
//        int itemId= Integer.parseInt(request.getParameter("itemId"));
//        int number= Integer.parseInt(request.getParameter("number"));
//        Item item=itemService.getById(itemId);
//        item.setNumber(number);
//        boolean check=itemService.update(item);
//        if(check){
//            return "true";
//        }else {
//            return "false";
//        }
//    }
//
    @RequestMapping("/get-list-district")
    @ResponseBody
    public String getListDistrict(HttpServletRequest request){
        String provinceId= request.getParameter("provinceId");
        List<District> districts=addressService.getDistrictByProvince(provinceId);
        ObjectMapper mapper=new ObjectMapper();
        String ajaxResponse="";
        try {
            ajaxResponse=mapper.writeValueAsString(districts);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return ajaxResponse;
    }

    @RequestMapping("/get-list-ward")
    @ResponseBody
    public String getListWard(HttpServletRequest request){
        String districtId= request.getParameter("districtId");
        List<Ward> wards=addressService.getWardByDistrict(districtId);
        ObjectMapper mapper=new ObjectMapper();
        String ajaxResponse="";
        try {
            ajaxResponse=mapper.writeValueAsString(wards);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return ajaxResponse;
    }

    @GetMapping("/getSelectedItem")
    @ResponseBody
    public String getSelectedItem(HttpServletRequest request, @RequestParam("listChecked[]") List<Integer> a){
        List<Item> items=new ArrayList<>();
        for (int i = 0; i < a.size(); i++) {
            Long itemId = Long.valueOf(a.get(i));
            Item item=itemService.getById(itemId);
            items.add(item);
        }
        HttpSession session=request.getSession();
        session.setAttribute("items",items);
        return "";
    }

    @GetMapping("/thanh-toan")
    public String checkout(HttpServletRequest request, ModelMap modelMap) {
        HttpSession session = request.getSession();
        List<Item> items = (List<Item>) session.getAttribute("items");
        Customer customer = (Customer) session.getAttribute("customer");
        modelMap.addAttribute("items", items);
        modelMap.addAttribute("customer", customer);
        modelMap.addAttribute("provinces", addressService.getAllProvince());
        return "web/checkout";
    }

    @PostMapping("/checkout")
    public String checkout(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        Long customerId = Long.parseLong(request.getParameter("customer_id"));
        String address = request.getParameter("address");
        HttpSession session = request.getSession();
        List<Item> items = (List<Item>) session.getAttribute("items");
        Long totalNumber = 0L;
        for (Item item : items) {
            totalNumber += item.getNumber() * item.getPrice();
        }
        Bill bill = new Bill();
        bill.setCustomerId(customerId);
        bill.setDeliveryAddress(address);
        bill.setNumerOrderItem(Long.valueOf(items.size()));
        bill.setTotal(totalNumber);
        Boolean a = billService.insert(bill);
        for (Item item : items) {
            OrderItem orderItem = new OrderItem();
            orderItem.setBillId(bill.getId());
            orderItem.setProductId(item.getProductId());
            orderItem.setName(item.getName());
            orderItem.setImage(item.getImage());
            orderItem.setNumber(item.getNumber());
            orderItem.setPrice(item.getPrice());
            orderItem.setCustomerId(item.getCustomerId());
            orderItemService.insert(orderItem);
            if (item.getId() != null) {
                itemService.deleteItem(item.getId());
            }
            Product product = productService.getById(item.getProductId());
            product.setQuantily(product.getQuantily() - orderItem.getNumber());
            productService.save(product);
        }
        if (bill.getId() != 0) {
            session.setAttribute("num_item", itemService.getByCustomerId(customerId).size());
            session.removeAttribute("items");
            redirectAttributes.addFlashAttribute("msg", "Đặt hàng thành công");
//            String subject = "Xác nhận đơn hàng";
//            String content = "Chào " + customer.getName() + ".Bạn vừa đặt 1 đơn hàng trên Fashi Shop." +
//                    "Đơn hàng sẽ được giao trong vòng 1-5 ngày tới.";
//            emailAPI.sendEmail(customer.getEmail(), subject, content);
        } else {
            redirectAttributes.addFlashAttribute("msg", "Đặt hàng thất bại");
        }
        return "redirect:/thanh-toan";
    }

}
