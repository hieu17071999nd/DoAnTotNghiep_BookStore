package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.model.Staff;
import com.hieuvm.bookstore.service.StaffService;
import com.hieuvm.bookstore.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
public class StaffController {

    @Autowired
    private StaffService staffService;

    @Autowired
    private MessageUtil messageUtil;

    @RequestMapping(value = "/admin/staff/get", method = RequestMethod.GET)
    private String getAll(ModelMap modelMap) {
        Pageable pageable = PageRequest.of(0, 5);
        modelMap.addAttribute("list", staffService.getAll(pageable));
        int totalPage= (int) Math.ceil((double) staffService.getAllStaff().size()/5);
        modelMap.addAttribute("page_id",1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page",1);
        return "admin/staff_manage";
    }

    @RequestMapping(value = "/admin/staff/get2", method = RequestMethod.GET)
    private String getAll2(ModelMap modelMap, @RequestParam("page") int page, @RequestParam("maxPageItem") int maxPageItem) {
        Pageable pageable = PageRequest.of(page - 1, maxPageItem);
        modelMap.addAttribute("list", staffService.getAll(pageable));
        int totalPage= (int) Math.ceil((double) staffService.getAllStaff().size()/maxPageItem);
        modelMap.addAttribute("page_id",maxPageItem * (page -1) + 1);
        modelMap.addAttribute("totalPage",totalPage);
        modelMap.addAttribute("page", page);
        return "admin/staff_manage";
    }

    @GetMapping("/add-staff")
    public String addStaff() {
        return "admin/staff_add";
    }

    @RequestMapping(value = "/admin/staff/add", method = RequestMethod.POST)
    private String insert(RedirectAttributes redirectAttributes, @RequestParam("code") String code,
                         @RequestParam("name") String name,
                         @RequestParam("address") String address,
                         @RequestParam("phone") Long phone,
                         @RequestParam("avatar") String avatar,
                         @RequestParam("username") String username,
                         @RequestParam("password") String password,
                         @RequestParam("status") Long status) {
        Staff staff = new Staff();
        staff.setCode(code);
        staff.setName(name);
        staff.setAddress(address);
        staff.setPhone(phone);
        staff.setAvatar(avatar);
        staff.setUsername(username);
        staff.setPassword(password);
        staff.setStatus(status);
        boolean check = staffService.insert(staff);
        if (check) {
            redirectAttributes.addFlashAttribute("msg", "Thêm mới thành công");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Thêm mới thất bại");
        }
        return "redirect:/admin/staff/get";
    }

    @GetMapping("/delete-staff/{id}")
    public String deleteStaff(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        Staff staff = staffService.getById(id);
        staff.setStatus(0L);
        boolean check = staffService.save(staff);
        if (check) {
            redirectAttributes.addFlashAttribute("msg", "Xóa thành công");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Xóa thất bại");
        }
        return "redirect:/admin/staff/get";
    }

    @GetMapping("/admin/staff/edit-staff/{id}")
    public String editStaff(ModelMap modelMap, @PathVariable("id") Long id) {
        Staff staff = staffService.getById(id);
        modelMap.addAttribute("staff", staff);
        return "admin/staff_edit";
    }

    @PostMapping("/admin/staff/edit-staff")
    public String editStaff(RedirectAttributes redirectAttributes, @ModelAttribute("staff") Staff staff) {
        boolean check = staffService.save(staff);
        if (check) {
            redirectAttributes.addFlashAttribute("msg", "Sửa thành công");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Sửa thất bại");
        }
        return "redirect:/admin/staff/get";
    }
}
