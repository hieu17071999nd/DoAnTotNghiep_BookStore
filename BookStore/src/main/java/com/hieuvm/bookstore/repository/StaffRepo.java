package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.Staff;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StaffRepo extends JpaRepository<Staff, Long> {

    List<Staff> findAllByStatus(Long status);

    List<Staff> findAllByLevelAndStatus(Long level, Long status);

    Staff getStaffByUsernameAndPassword(String userName, String password);

    Staff getStaffByUsername(String userName);
}
