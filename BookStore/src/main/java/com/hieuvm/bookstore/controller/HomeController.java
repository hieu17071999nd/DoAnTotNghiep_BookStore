package com.hieuvm.bookstore.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hieuvm.bookstore.model.Category;
import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.Product;
import com.hieuvm.bookstore.repository.BaseQueryRepo;
import com.hieuvm.bookstore.service.CategoryService;
import com.hieuvm.bookstore.service.CustomerService;
import com.hieuvm.bookstore.service.ItemService;
import com.hieuvm.bookstore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private BaseQueryRepo baseQueryRepo;

    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public ModelAndView home(HttpSession session, ModelMap modelMap) {
        modelMap.addAttribute("products",productService.getProductHot());

        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());

        modelMap.addAttribute("productNews", baseQueryRepo.getProductNew());
        ModelAndView mav = new ModelAndView("web/home");
        return mav;
    }

    @GetMapping("/product/{id}")
    public String detail(ModelMap modelMap, @PathVariable("id") Long id){
        modelMap.addAttribute("product",productService.getById(id));
        Product product = productService.getById(id);
        modelMap.addAttribute("productCategory", categoryService.getById(product.getCategoryId()));
        modelMap.addAttribute("categories", categoryService.getAllCategory());
        modelMap.addAttribute("productRelatives", baseQueryRepo.getProductRelative(product.getCategoryId(), id));

        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());

        return "web/detail";
    }

    @RequestMapping(value = "/product-detail", method = RequestMethod.GET)
    public ModelAndView ProductDetail(ModelMap modelMap) {
        ModelAndView mav = new ModelAndView("web/detail");
        return mav;
    }

    @RequestMapping(value = "/product/category/{id}", method = RequestMethod.GET)
    public ModelAndView getProductCategory(ModelMap modelMap, @PathVariable("id") Long id, HttpServletRequest request) {
        String page = request.getParameter("page");
        String maxPageItem = request.getParameter("maxPageItem");
        modelMap.addAttribute("products", baseQueryRepo.findAllByCategoryId(id, page, maxPageItem));
        modelMap.addAttribute("categories", categoryService.getAllCategory());
        modelMap.addAttribute("categoryId", id);
        int totalPage= (int) Math.ceil((double) productService.findAllByCategoryId(id).size()/4);
        if (page == null) {
            modelMap.addAttribute("totalPage", totalPage);
            modelMap.addAttribute("page", 1);
        } else {
            modelMap.addAttribute("totalPage", totalPage);
            modelMap.addAttribute("page", page);
        }

        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());

        ModelAndView mav = new ModelAndView("web/product");
        return mav;
    }

    @RequestMapping(value = "/product/hot", method = RequestMethod.GET)
    public ModelAndView getProductCategoryHot(ModelMap modelMap) {
        modelMap.addAttribute("products",productService.getProductHot());
        modelMap.addAttribute("categories", categoryService.getAllCategory());

        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());

        ModelAndView mav = new ModelAndView("web/product");
        return mav;
    }

    @RequestMapping(value = "/product/new", method = RequestMethod.GET)
    public ModelAndView getProductCategoryNew(ModelMap modelMap) {
        modelMap.addAttribute("products",baseQueryRepo.getProductNew());
        modelMap.addAttribute("categories", categoryService.getAllCategory());

        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());

        ModelAndView mav = new ModelAndView("web/product");
        return mav;
    }

    @GetMapping(value = "/searchProduct")
    public String searchProduct(@RequestParam("search") String search, ModelMap modelMap, HttpServletRequest request) {
        String page = request.getParameter("page");
        String maxPageItem = request.getParameter("maxPageItem");
        String categoryId = request.getParameter("categoryId");
        List<Product> products = baseQueryRepo.getProductSearch2(search, page, maxPageItem, categoryId);
        modelMap.addAttribute("products", products);
        modelMap.addAttribute("search", search);
        modelMap.addAttribute("categoryId", categoryId);
        int totalPage= (int) Math.ceil((double) baseQueryRepo.getProductSearch(search, categoryId).size()/4);
        if (page == null) {
            modelMap.addAttribute("totalPage", totalPage);
            modelMap.addAttribute("page", 1);
        } else {
            modelMap.addAttribute("totalPage", totalPage);
            modelMap.addAttribute("page", page);
        }

        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        return "web/product";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public ModelAndView contact(ModelMap modelMap) {
        modelMap.addAttribute("categoryParents",categoryService.getAllCategoryParents());
        modelMap.addAttribute("categorySGKs",categoryService.getAllCategorySGK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());
        modelMap.addAttribute("categorySTKs",categoryService.getAllCategorySTK());

        ModelAndView mav = new ModelAndView("web/contact");
        return mav;
    }
}
