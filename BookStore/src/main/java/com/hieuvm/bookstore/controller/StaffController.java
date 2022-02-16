package com.hieuvm.bookstore.controller;

import com.hieuvm.bookstore.model.Staff;
import com.hieuvm.bookstore.service.StaffService;
import com.hieuvm.bookstore.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class StaffController {

    @Autowired
    private StaffService staffService;

    @Autowired
    private MessageUtil messageUtil;

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

    @RequestMapping(value = "/admin/staff/get", method = RequestMethod.GET)
    private String getAll(ModelMap modelMap) {
        modelMap.addAttribute("list", staffService.getAllStaff());
        int numPage= (int) Math.ceil((double) staffService.getAllStaff().size()/2);
        modelMap.addAttribute("num_page",numPage);
        modelMap.addAttribute("page_id",1);
        return "admin/staff_manage";
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

//    @RequestMapping(value = "/admin/staff/get", method = RequestMethod.GET)
//    private ModelAndView getAll(@RequestParam("page") int page,
//                              @RequestParam("limit") int limit) {
//        PostOutput model = new PostOutput();
//        model.setPage(page);
//        model.setLimit(limit);
//        ModelAndView mav = new ModelAndView("admin/staff/get");
//        Pageable pageable = PageRequest.of(page - 1, limit);
//        model.setPostList(staffService.getAll(pageable));
//        model.setTotalItem(staffService.getAll(pageable).size());
//        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
//        if (request.getParameter("message") != null) {
//            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
//            mav.addObject("message", message.get("message"));
//            mav.addObject("alert", message.get("alert"));
//        }
//        mav.addObject("model", model);
//        return mav;
//    }

//    @RequestMapping(value = "/get", method = RequestMethod.GET)
//    private PostOutput getAll(@RequestParam("page") int page,
//                              @RequestParam("limit") int limit) {
//        PostOutput postOutput = new PostOutput();
//        postOutput.setPage(page);
//        Pageable pageable = PageRequest.of(page - 1, limit);
//        postOutput.setPostList(staffService.getAll(pageable));
//        postOutput.setTotalPage((int) Math.ceil((double) (staffService.totalItem()) / limit));
//        return postOutput;
//    }

//    @GetMapping("/{pageId}")
//    public String viewByPage(ModelMap modelMap, @PathVariable("pageId") int pageId){
//        int total=7;
//        int num=pageId;
//        if(pageId==1){}
//        else{
//            pageId=(pageId-1)*total+1;
//        }
//        int numPage= (int) Math.ceil((double) staffService.getAllByStatus(1L).size()/total);
//        modelMap.addAttribute("num",num);
//        modelMap.addAttribute("page_id",pageId);
//        modelMap.addAttribute("num_page",numPage);
//        modelMap.addAttribute("list",staffService.getByPage(pageId,total));
//        return "admin_view/manage_category";
//    }
//
//    @RequestMapping(value = "/post/get", method = RequestMethod.GET)
//    private List<Post> getAllByStatus() {
//        return postService.getAllByStatus(1L);
//    }
//
////    @PostMapping(value = "/post")
//    @RequestMapping(value = "/post", method = RequestMethod.POST)
//    private Post insert(@RequestBody Post post) {
//        return postService.insert(post);
//    }
//
////    @GetMapping(value = "/post/{id}")
//    @RequestMapping(value = "/post/{id}", method = RequestMethod.GET)
//    private Post getById(@PathVariable Long id) {
//        return postService.getById(id);
//    }
//
////    @DeleteMapping(value = "post/{id}")
//    @RequestMapping(value = "/post/{id}", method = RequestMethod.DELETE)
//    private void delete(@PathVariable("id") Long id) {
//        postService.deletePost(id);
//    }
//
////    @PutMapping(value = "/post/update")
//    @RequestMapping(value = "/post/update ", method = RequestMethod.PUT)
//    private void update(@RequestBody Post post) {
//        Post postOld  = new Post();
//        if (post.getId() != null) {
//            postOld = postService.findOne(post.getId());
//            postOld.setTitle(post.getTitle());
//            postOld.setContent(post.getTitle());
//            postOld.setStatus(post.getStatus());
////            postOld.setUpdateDate();
//            postService.save(postOld);
//        }
//
//    }
}
