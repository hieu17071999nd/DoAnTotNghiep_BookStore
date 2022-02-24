package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.model.Staff;
import com.hieuvm.bookstore.service.CustomerService;
import com.hieuvm.bookstore.service.ItemService;
import com.hieuvm.bookstore.service.ProductService;
import com.hieuvm.bookstore.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private StaffService staffService;

    @RequestMapping(value = "/admin/home", method = RequestMethod.GET)
    public ModelAndView homePage() {
        ModelAndView mav = new ModelAndView("admin/home");
        return mav;
    }

    @GetMapping("/admin/login")
    public String loginAdmin() {
        return "admin/login";
    }

    @RequestMapping(value = "/check", method = RequestMethod.POST)
    public String login(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Staff staff = staffService.getStaffLogin(username, password);
        if (staff != null) {
            if (staff.getStatus() == 1) {
                HttpSession session=request.getSession();
                session.setAttribute("username", username);
                return "redirect:/admin/home";
            } else {
                request.setAttribute("check", "Tài khoản không còn hiệu lực");
                return "admin/login";
            }
        } else {
            request.setAttribute("check", "Sai tên đăng nhập hoặc mật khẩu");
            return "admin/login";
        }
    }

    @GetMapping("/logout-admin")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/admin/login";
    }
}
