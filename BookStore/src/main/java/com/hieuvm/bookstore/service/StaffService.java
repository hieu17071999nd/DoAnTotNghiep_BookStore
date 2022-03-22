package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Staff;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface StaffService {

    List<Staff> getAll(Pageable pageable);

    List<Staff> getAllStaff();

    List<Staff> getAllByStatus(Long status);

    List<Staff> findAllByLevelAndStatus(Long level, Long status);

    Boolean insert(Staff staff);

    Staff getById(Long id);

    void deletePost(Long id);

    Staff findOne(Long id);

    Boolean save(Staff staff);

    int totalItem();

    Staff getStaffLogin(String userName, String password);

    Staff getStaffByUsername(String userName);
}
