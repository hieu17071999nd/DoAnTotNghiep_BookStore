package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.Bill;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BillRepo extends JpaRepository<Bill, Long> {

    List<Bill> findAllByStatus(Long status);
}
