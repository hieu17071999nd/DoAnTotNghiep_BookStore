package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.Staff;
import com.hieuvm.bookstore.service.CustomerService;
import com.hieuvm.bookstore.service.StaffService;
import com.hieuvm.bookstore.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService ;

    @GetMapping("/add-customer")
    public String addStaff() {
        return "admin/staff_customer";
    }

    @RequestMapping(value = "/admin/customer/add", method = RequestMethod.POST)
    private String insert(RedirectAttributes redirectAttributes, @RequestParam("name") String name,
                         @RequestParam("address") String address,
                         @RequestParam("phone") Long phone,
                         @RequestParam("avatar") String avatar,
                         @RequestParam("username") String username,
                         @RequestParam("password") String password,
                         @RequestParam("status") Long status) {
        Customer customer = new Customer();
        customer.setName(name);
        customer.setAddress(address);
        customer.setPhone(phone);
        customer.setAvatar(avatar);
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setStatus(status);
        boolean check = customerService.insert(customer);
        if (check) {
            redirectAttributes.addFlashAttribute("msg", "Thêm mới thành công");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Thêm mới thất bại");
        }
        return "redirect:/admin/staff/get";
    }

    @RequestMapping(value = "/admin/customer/get", method = RequestMethod.GET)
    private String getAll(ModelMap modelMap) {
        modelMap.addAttribute("list", customerService.getAllCustomer());
        int numPage= (int) Math.ceil((double) customerService.getAllCustomer().size()/2);
        modelMap.addAttribute("num_page",numPage);
        modelMap.addAttribute("page_id",1);
        return "admin/customer_manage";
    }

    @GetMapping("/delete-customer/{id}")
    public String deleteStaff(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        Customer customer = customerService.getById(id);
        customer.setStatus(0L);
        boolean check = customerService.save(customer);
        if (check) {
            redirectAttributes.addFlashAttribute("msg", "Xóa thành công");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Xóa thất bại");
        }
        return "redirect:/admin/customer/get";
    }

    @GetMapping("/admin/customer/edit-customer/{id}")
    public String editStaff(ModelMap modelMap, @PathVariable("id") Long id) {
        Customer customer = customerService.getById(id);
        modelMap.addAttribute("customer", customer);
        return "admin/customer_edit";
    }

    @PostMapping("/admin/customer/edit-customer")
    public String editStaff(RedirectAttributes redirectAttributes, @ModelAttribute("customer") Customer customer) {
        boolean check = customerService.save(customer);
        if (check) {
            redirectAttributes.addFlashAttribute("msg", "Sửa thành công");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Sửa thất bại");
        }
        return "redirect:/admin/customer/get";
    }
}
