package com.hieuvm.bookstore.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hieuvm.bookstore.DTO.ItemDto;
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
    private OrderService billService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private CustomerService customerService;

    /*
    Status của Item:
    1: Đang ở trong giỏ hàng của khách hàng
    2. Khách hàng đã đặt hàng chờ đợi được admin duyệt đơn hàng
    3. Đơn hàng được duyệt chờ đợi shipper giao hàng
     */

    @RequestMapping("/delete-item/{id}")
    public String addCart(HttpServletRequest request, @PathVariable("id") Long id){
        itemService.deleteItem(id);
        return "redirect:/giohang";
    }

    @RequestMapping("/add-cart")
    @ResponseBody
    public String addCart(HttpServletRequest request){
        Long productId= Long.parseLong(request.getParameter("productId"));
        Product product= productService.getById(productId);
        Long customerId= Long.parseLong(request.getParameter("customerId"));
        Long n= Long.parseLong(request.getParameter("n"));

        //kiem tra xem san pham co trong gio hang hay chua
        Item itemCheck = itemService.getAllByCustomerIdAndProductId(customerId, productId);
        if (itemCheck != null) {
            itemCheck.setNumber(itemCheck.getNumber() + n);
            itemService.save(itemCheck);
            return "true";
        } else {
            Item item=new Item();
            item.setNumber(n);
//            item.setName(product.getName());
//            item.setImage(product.getImage());
//            item.setPrice(product.getPrice());
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
    }

    @RequestMapping("/buy-now")
    @ResponseBody
    public String buyNow(HttpServletRequest request){
        Long productId= Long.parseLong(request.getParameter("productId"));
        Long customerId= Long.parseLong(request.getParameter("customerId"));
        Long n= Long.parseLong(request.getParameter("n"));
        Product product= productService.getById(productId);
        Customer customer = customerService.getById(customerId);

        Item item=new Item();
        item.setProductId(productId);
//        item.setName(product.getName());
//        item.setImage(product.getImage());
        item.setNumber(n);
//        item.setPrice(product.getPrice());
        item.setCustomerId(customerId);
        List<ItemDto> itemDtos=new ArrayList<>();
        ItemDto itemDto = new ItemDto();
        itemDto.setItem(item);
        itemDto.setProduct(product);
        itemDto.setCustomer(customer);
        itemDtos.add(itemDto);
        HttpSession session=request.getSession();
        session.setAttribute("itemDtos",itemDtos);
        return "ok";
    }

    @GetMapping("/getSelectedItem")
    @ResponseBody
    public String getSelectedItem(HttpServletRequest request, @RequestParam("listChecked[]") List<Integer> a){
        HttpSession session=request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        List<ItemDto> itemDtos=new ArrayList<>();
        for (int i = 0; i < a.size(); i++) {
            Long itemId = Long.valueOf(a.get(i));
            Item item=itemService.getById(itemId);
            Product product = productService.getById(item.getProductId());
            ItemDto itemDto = new ItemDto();
            itemDto.setItem(item);
            itemDto.setProduct(product);
            itemDto.setCustomer(customer);
            itemDtos.add(itemDto);
        }
        session.setAttribute("itemDtos",itemDtos);
        return "";
    }

    @GetMapping("/thanh-toan")
    public String checkout(HttpServletRequest request, ModelMap modelMap) {
        HttpSession session = request.getSession();
        List<ItemDto> itemDtos = (List<ItemDto>) session.getAttribute("itemDtos");
        Customer customer = (Customer) session.getAttribute("customer");
        modelMap.addAttribute("itemDtos", itemDtos);
        modelMap.addAttribute("customer", customer);
        modelMap.addAttribute("provinces", addressService.getAllProvince());
        return "web/checkout";
    }

    @PostMapping("/checkout")
    public String checkout(HttpServletRequest request, RedirectAttributes redirectAttributes) {
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
        order.setStatus(1L);
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
        if (order.getId() != 0) {
            session.setAttribute("num_item", itemService.getByCustomerId(customerId).size());
            session.removeAttribute("itemDtos");
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

}
