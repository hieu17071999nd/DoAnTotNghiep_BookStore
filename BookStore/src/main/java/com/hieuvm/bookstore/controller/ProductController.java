package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.DTO.ProductDto;
import com.hieuvm.bookstore.model.Category;
import com.hieuvm.bookstore.model.Product;
import com.hieuvm.bookstore.service.CategoryService;
import com.hieuvm.bookstore.service.ProductService;
import com.hieuvm.bookstore.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private MessageUtil messageUtil;

    @GetMapping("/admin/product/get")
    public String viewMale(ModelMap modelMap) {
        Pageable pageable = PageRequest.of(0, 5);
        modelMap.addAttribute("list", productService.getAll(pageable));
        int totalPage= (int) Math.ceil((double) productService.getAllProduct().size()/5);
        modelMap.addAttribute("page_id",1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page",1);
        return "admin/product_manage";
    }

    @RequestMapping(value = "/admin/product/get2", method = RequestMethod.GET)
    private String getAll2(ModelMap modelMap, @RequestParam("page") int page, @RequestParam("maxPageItem") int maxPageItem) {
        Pageable pageable = PageRequest.of(page - 1, maxPageItem);
        modelMap.addAttribute("list", productService.getAll(pageable));
        int totalPage= (int) Math.ceil((double) productService.getAllProduct().size()/maxPageItem);
        modelMap.addAttribute("page_id",maxPageItem * (page -1) + 1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page", page);
        return "admin/product_manage";
    }

    @GetMapping("/admin/product/add-product")
    public String addProduct(ModelMap modelMap) {
        Product product = new Product();
        modelMap.addAttribute("product", product);
        modelMap.addAttribute("categories", categoryService.getAllCategory());
        return "admin/product_add";
    }

    //    @PostMapping("/admin/product/add")
    @Autowired
    ServletContext context;

    @RequestMapping(value = "/admin/product/add")
    public String addProduct(RedirectAttributes redirectAttributes, @ModelAttribute("product") Product product,
                             @RequestParam("category_id") Long categoryId, @RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("/resources/images/product/");
        System.out.println(path);
        File newFile = new File(path + file.getOriginalFilename());
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(newFile);
            fileOutputStream.write(file.getBytes());
            fileOutputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        product.setImage(file.getOriginalFilename());
        product.setCategoryId(categoryId);
        boolean check = productService.insert(product);
        if (check) {
            redirectAttributes.addFlashAttribute("msg", "Thêm mới thành công");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Thêm mới thất bại");
        }
        return "redirect:/admin/product/get";
    }

    @GetMapping("admin/product/delete/{id}")
    public String deleteStaff(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        Product product = productService.getById(id);
        product.setStatus(0L);
        boolean check = productService.save(product);
        if (check) {
            redirectAttributes.addFlashAttribute("msg", "Xóa thành công");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Xóa thất bại");
        }
        return "redirect:/admin/product/get";
    }

    @GetMapping("/admin/product/edit-product/{id}")
    public String editProduct(ModelMap modelMap, @PathVariable("id") Long id) {
        Product product = productService.getById(id);
        Category category = categoryService.getById(product.getCategoryId());
        List<Category> categoryList = categoryService.getAllCategory();
        ProductDto productDto = new ProductDto(product, category);
        modelMap.addAttribute("productDto", productDto);
        modelMap.addAttribute("categories", categoryService.getAllCategory());
        return "admin/product_edit";
    }

    @PostMapping("/admin/product/edit")
    public String editProduct(RedirectAttributes redirectAttributes, @ModelAttribute("productDto") ProductDto productDto,
                              @RequestParam("file") MultipartFile file, @RequestParam("category_id") Long categoryId, HttpServletRequest request) {
        String path = request.getSession().getServletContext().getRealPath("/resources/images/product/");
        Product product = productDto.getProduct();
        if (!file.getOriginalFilename().isEmpty()) {
            File newFile = new File(path + file.getOriginalFilename());
            try {
                FileOutputStream fileOutputStream = new FileOutputStream(newFile);
                fileOutputStream.write(file.getBytes());
                fileOutputStream.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            System.out.println(file.getOriginalFilename());
            product.setImage(file.getOriginalFilename());
        }
        product.setCategoryId(categoryId);
        boolean check = productService.save(product);
        if (check) {
            redirectAttributes.addFlashAttribute("msg", "Sửa thành công");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Sửa thất bại");
        }
        return "redirect:/admin/product/get";
    }

    public String getNameCategory(Long categoryId) {
        Category category = new Category();
        category = categoryService.getById(categoryId);
        return category.getName();
    }
}
