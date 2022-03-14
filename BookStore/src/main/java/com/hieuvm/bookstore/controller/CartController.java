package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.DTO.ItemDto;
import com.hieuvm.bookstore.DTO.OrderDto;
import com.hieuvm.bookstore.model.*;
import com.hieuvm.bookstore.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CartController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ItemService itemService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private OrderService billService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CustomerService customerService;

    @GetMapping("/taikhoan")
    public String profile(ModelMap modelMap, HttpServletRequest request){
        HttpSession session=request.getSession();
        Customer customer= (Customer) session.getAttribute("customer");
        modelMap.addAttribute("customer",customer);
        List<Province> provinces=addressService.getAllProvince();
        modelMap.addAttribute("provinces",provinces);
        return "web/profile";
    }

    @PostMapping("/update-profile")
    public String updateProfile(@ModelAttribute("customer") Customer customer, @RequestParam("file") MultipartFile file,
                                HttpServletRequest request, RedirectAttributes redirectAttributes){
        String path=request.getServletContext().getRealPath("/resources/images/user/");
        if(!file.getOriginalFilename().isEmpty()){
            File newFile=new File(path+file.getOriginalFilename());
            try {
                FileOutputStream fileOutputStream=new FileOutputStream(newFile);
                fileOutputStream.write(file.getBytes());
                fileOutputStream.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            customer.setAvatar(file.getOriginalFilename());
        }
        boolean check=customerService.save(customer);
        if(check){
            redirectAttributes.addFlashAttribute("msg","Cập nhật thành công");
        }else {
            redirectAttributes.addFlashAttribute("msg","Cập nhật thất bại");
        }
        HttpSession session=request.getSession();
        session.setAttribute("customer",customer);
        return "redirect:/taikhoan";
    }

    @GetMapping("/giohang")
    public String cart(ModelMap modelMap, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        List<Item> items = itemService.getByCustomerId(customer.getId());
        session.setAttribute("num_item", items.size());

        List<ItemDto> itemDtos = new ArrayList<>();
        for (Item item : items) {
            ItemDto itemDto = new ItemDto();
            itemDto.setItem(item);
            itemDto.setCustomer(customer);
            Product product = productService.getById(item.getProductId());
            itemDto.setProduct(product);
            itemDtos.add(itemDto);
        }
        modelMap.addAttribute("itemDtos", itemDtos);
        return "web/cart";
    }

    @GetMapping("/donhangdangdat")
    public String ordered(ModelMap modelMap, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        List<OrderDto> orderDtos = new ArrayList<>();
        List<Order> orders1 = orderService.findAllByCustomerIdAndStatus(customer.getId(), 1L);
        List<Order> orders2 = orderService.findAllByCustomerIdAndStatus(customer.getId(), 2L);
        if (orders1.size() > 0) {
            for (Order order : orders1) {
                List<OrderItem> orderItems = orderItemService.getAllOrderItemByOrderId(order.getId());
                OrderDto orderDto = new OrderDto(order, customer, orderItems);
                orderDtos.add(orderDto);
            }
        }
//        if (orders2.size() > 0) {
//            for (Order order : orders1) {
//                List<OrderItem> orderItems = orderItemService.getAllOrderItemByOrderId(order.getId());
//                OrderDto orderDto = new OrderDto(order, customer, orderItems);
//                orderDtos.add(orderDto);
//            }
//        }
        modelMap.addAttribute("orderDtos", orderDtos);
        return "web/ordered";
    }

    @GetMapping("/donhangdamua")
    public String orderedHistory(ModelMap modelMap, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        List<OrderItem> orderItems = orderItemService.findAllByCustomerIdAndStatus(customer.getId(), 3L);
        modelMap.addAttribute("orderItems", orderItems);
        return "web/order_history";
    }

}
