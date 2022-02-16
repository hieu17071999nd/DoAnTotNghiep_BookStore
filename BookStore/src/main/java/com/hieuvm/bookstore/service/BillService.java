package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Bill;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BillService {

    List<Bill> getAll(Pageable pageable);

    List<Bill> getAllBill();

    List<Bill> getAllByStatus(Long status);

    Boolean insert(Bill bill);

    Bill getById(Long id);

    void deletePost(Long id);

    Bill findOne(Long id);

    Boolean save(Bill bill);

    int totalItem();
}
