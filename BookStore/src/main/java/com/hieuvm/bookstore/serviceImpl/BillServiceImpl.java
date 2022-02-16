package com.hieuvm.bookstore.serviceImpl;

import com.hieuvm.bookstore.model.Bill;
import com.hieuvm.bookstore.repository.BillRepo;
import com.hieuvm.bookstore.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillServiceImpl implements BillService {

    @Autowired
    private BillRepo billRepo;

    @Override
    public List<Bill> getAllByStatus(Long status) {
        return billRepo.findAllByStatus(1L);
    }

    public List<Bill> getAll(Pageable pageable) {
        return billRepo.findAll(pageable).getContent();
    }

    public List<Bill> getAllBill() {
        return billRepo.findAll();
    }

    public Boolean insert(Bill bill) {
        billRepo.save(bill);
        return true;
    }

    public Bill getById(Long id) {
        return billRepo.getById(id);
    }

    public void deletePost(Long id) {
        billRepo.deleteById(id);
    }

    public Bill findOne(Long id) {
        return billRepo.getById(id);
    }

    public Boolean save(Bill bill) {
        billRepo.save(bill);
        return true;
    }

    public int totalItem() {
        return (int) billRepo.count();
    }
}
