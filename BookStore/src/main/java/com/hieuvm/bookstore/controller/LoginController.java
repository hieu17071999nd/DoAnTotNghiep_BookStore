package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.service.CustomerService;
import com.hieuvm.bookstore.service.ItemService;
import com.hieuvm.bookstore.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private ItemService itemService;

    @Autowired
    private StaffService staffService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginView() {
        return "web/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Customer customer = customerService.login(username, password);
        if (customer != null) {
            HttpSession session=request.getSession();
            session.setAttribute("customer",customer);
            session.setAttribute("num_item",itemService.getByCustomerId(customer.getId()).size());
            return "redirect:/trang-chu";
        } else {
            request.setAttribute("msg", "Sai tên đăng nhập hoặc mật khẩu");
            return "web/login";
        }
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerView(ModelMap modelMap) {
        modelMap.addAttribute("new_customer", new Customer());
        return "web/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@ModelAttribute("new_customer") Customer customer, HttpServletRequest request) {
//        if (customerService.checkDuplicate(customer)) {
//            request.setAttribute("msg", "Đã tồn tại tên đăng nhập");
//        } else {
//            boolean check = customerService.register(customer);
//            if (check) {
//                request.setAttribute("msg", "Đăng ký thành công");
//            } else {
//                request.setAttribute("msg", "Đăng ký thất bại");
//            }
//        }
        boolean check = customerService.insert(customer);
        if (check) {
            request.setAttribute("msg", "Đăng ký thành công");
        } else {
            request.setAttribute("msg", "Đăng ký thất bại");
        }
        return "web/register";
    }

    @RequestMapping(value = "/logout-user",method = RequestMethod.GET )
    public String logout(HttpServletRequest request){
        HttpSession session=request.getSession();
        if(session!=null){
            session.invalidate();
        }
        return "redirect:/trang-chu";
    }
}
