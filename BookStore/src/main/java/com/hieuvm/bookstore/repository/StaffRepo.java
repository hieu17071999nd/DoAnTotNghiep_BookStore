package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.Staff;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StaffRepo extends JpaRepository<Staff, Long> {

    List<Staff> findAllByStatus(Long status);

    Staff getStaffByUsernameAndPassword(String userName, String password);

    List<Staff> getStaffByUsername(String userName);
}
