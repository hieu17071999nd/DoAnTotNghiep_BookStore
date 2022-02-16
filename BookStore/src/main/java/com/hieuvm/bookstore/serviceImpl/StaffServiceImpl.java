package com.hieuvm.bookstore.serviceImpl;

import com.hieuvm.bookstore.model.Staff;
import com.hieuvm.bookstore.repository.StaffRepo;
import com.hieuvm.bookstore.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StaffServiceImpl implements StaffService {

    @Autowired
    private StaffRepo staffRepo;

    @Override
    public List<Staff> getAllByStatus(Long status) {
        return staffRepo.findAllByStatus(1L);
    }

    public List<Staff> getAll(Pageable pageable) {
        return staffRepo.findAll(pageable).getContent();
    }

    public List<Staff> getAllStaff() {
        return staffRepo.findAll();
    }

    public Boolean insert(Staff staff) {
        staffRepo.save(staff);
        return true;
    }

    public Staff getById(Long id) {
        return staffRepo.getById(id);
    }

    public void deletePost(Long id) {
        staffRepo.deleteById(id);
    }

    public Staff findOne(Long id) {
        return staffRepo.getById(id);
    }

    public Boolean save(Staff staff) {
        staffRepo.save(staff);
        return true;
    }

    public int totalItem() {
        return (int) staffRepo.count();
    }

    public Staff getStaffLogin(String userName, String password) {
        return staffRepo.getStaffByUsernameAndPassword(userName, password);
    }
}
