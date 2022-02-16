package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.model.Category;
import com.hieuvm.bookstore.model.Product;
import com.hieuvm.bookstore.service.CategoryService;
import com.hieuvm.bookstore.service.StaffService;
import com.hieuvm.bookstore.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CategoryController {

    @Autowired
    private StaffService staffService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private MessageUtil messageUtil;

    @RequestMapping(value = "/admin/category/get", method = RequestMethod.GET)
    private String getAll(ModelMap modelMap) {
        modelMap.addAttribute("list", categoryService.getAllCategory());
        int numPage= (int) Math.ceil((double) categoryService.getAllCategory().size()/2);
        modelMap.addAttribute("num_page",numPage);
        modelMap.addAttribute("page_id",1);
        return "admin/category_manage";
    }

    @GetMapping("/add-category")
    public String addStaff(ModelMap modelMap) {
        modelMap.addAttribute("categories", categoryService.getAllCategoryParents());
        return "admin/category_add";
    }

    @RequestMapping(value = "/admin/category/add", method = RequestMethod.POST)
    private String insert(RedirectAttributes redirectAttributes, @RequestParam("code") String code,
                          @RequestParam("name") String name, @RequestParam("priority") Long priority,
                         @RequestParam("description") String description, @RequestParam("type") String type,
                         @RequestParam("status") Long status) {
        Category category = new Category();
        category.setCode(code);
        category.setName(name);
        category.setPriority(priority);
        category.setDescription(description);
        category.setType(type);
        category.setStatus(status);
        boolean check = categoryService.insert(category);
        if (check) {
            redirectAttributes.addFlashAttribute("msg", "Thêm mới thành công");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Thêm mới thất bại");
        }
        return "redirect:/admin/category/get";
    }

    @GetMapping("/delete-category/{id}")
    public String deleteCategory(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        Category category = categoryService.getById(id);
        category.setStatus(0L);
        boolean check = categoryService.save(category);
        if (check) {
            redirectAttributes.addFlashAttribute("msg", "Xóa thành công");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Xóa thất bại");
        }
        return "redirect:/admin/category/get";
    }

    @GetMapping("/admin/category/edit-category/{id}")
    public String editStaff(ModelMap modelMap, @PathVariable("id") Long id) {
        Category category = categoryService.getById(id);
        modelMap.addAttribute("category", category);
        return "admin/category_edit";
    }

    @PostMapping("/admin/category/edit-category")
    public String editStaff(RedirectAttributes redirectAttributes, @ModelAttribute("category") Category category) {
        boolean check = categoryService.save(category);
        if (check) {
            redirectAttributes.addFlashAttribute("msg", "Sửa thành công");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Sửa thất bại");
        }
        return "redirect:/admin/category/get";
    }

}
