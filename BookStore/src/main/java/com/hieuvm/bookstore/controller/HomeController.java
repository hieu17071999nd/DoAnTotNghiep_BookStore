package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.service.CategoryService;
import com.hieuvm.bookstore.service.CustomerService;
import com.hieuvm.bookstore.service.ItemService;
import com.hieuvm.bookstore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public ModelAndView home(HttpSession session, ModelMap modelMap) {
        Customer customer= (Customer) session.getAttribute("customer");
        modelMap.addAttribute("customer",customer);
        modelMap.addAttribute("list_product",productService.getProductHot());
        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        ModelAndView mav = new ModelAndView("web/home");
        return mav;
    }

    @GetMapping("/product/{id}")
    public String detail(ModelMap modelMap, @PathVariable("id") Long id){
        modelMap.addAttribute("product",productService.getById(id));
        modelMap.addAttribute("categories", categoryService.getAllCategory());
        return "web/detail";
    }

    @RequestMapping(value = "/product-detail", method = RequestMethod.GET)
    public ModelAndView ProductDetail(ModelMap modelMap) {
        ModelAndView mav = new ModelAndView("web/detail");
        return mav;
    }

    @RequestMapping(value = "/product/category/{id}", method = RequestMethod.GET)
    public ModelAndView getProductCategory(HttpSession session, ModelMap modelMap, @PathVariable("id") Long id) {
        Customer customer= (Customer) session.getAttribute("customer");
        modelMap.addAttribute("customer",customer);
        modelMap.addAttribute("list_product",productService.findAllByCategoryId(id));
        modelMap.addAttribute("categories", categoryService.getAllCategory());
        ModelAndView mav = new ModelAndView("web/product");
        return mav;
    }



}
