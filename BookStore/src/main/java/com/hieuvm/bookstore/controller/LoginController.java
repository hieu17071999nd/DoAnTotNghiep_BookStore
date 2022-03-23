package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.Product;
import com.hieuvm.bookstore.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private ItemService itemService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginView(ModelMap modelMap) {
        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());

        return "web/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, ModelMap modelMap) {
        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Customer customer = customerService.login(username, password);
        //cookie

        //
        if (customer != null) {
            HttpSession session=request.getSession();
            session.setAttribute("customer",customer);
            session.setAttribute("num_item",itemService.getByCustomerId(customer.getId()).size());
            session.setMaxInactiveInterval(10 * 60);

            Cookie[] cookies = request.getCookies();
            String productIdStr = null;
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("productId")) {
                    productIdStr = cookie.getValue();
                }
            }
            if (productIdStr != null) {
                String url = "redirect:/product/" + productIdStr;
                return url;
            } else {
                return "redirect:/trang-chu";
            }
        } else {
            request.setAttribute("msg", "Sai tên đăng nhập hoặc mật khẩu");
            return "web/login";
        }
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerView(ModelMap modelMap) {
        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());

        modelMap.addAttribute("new_customer", new Customer());
        return "web/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@ModelAttribute("new_customer") Customer customer, HttpServletRequest request, ModelMap modelMap) {
        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());

        List<Customer> customerCheck = customerService.findAllByUsernameAndStatus(customer.getUsername());
        if (customerCheck.size() > 1) {
            request.setAttribute("msg", "Tên đăng nhập này đã tồn tại!");
            return "web/register";
        }
        customer.setStatus(1L);
        boolean check = customerService.insert(customer);
        if (check) {
            request.setAttribute("msg", "Đăng ký thành công");
        } else {
            request.setAttribute("msg", "Đăng ký thất bại");
        }
        return "web/register";
    }

    @RequestMapping(value = "/logout-user",method = RequestMethod.GET )
    public String logout(HttpServletRequest request, ModelMap modelMap){
        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());

        HttpSession session=request.getSession();
        if(session!=null){
            session.invalidate();
        }
        return "redirect:/trang-chu";
    }

    // cookies mua hang va them vao gio hang
    @RequestMapping(value = "/login/buy", method = RequestMethod.GET)
    public String loginViewToBuyOrAddCard(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());

        Long productId= Long.parseLong(request.getParameter("productId"));
        Product product= productService.getById(productId);
        Long n= Long.parseLong(request.getParameter("n"));

        Cookie cookie = new Cookie("productId", String.valueOf(productId));
        cookie.setMaxAge(5 * 60);

        response.addCookie(cookie);
        return "web/login";
    }
}
