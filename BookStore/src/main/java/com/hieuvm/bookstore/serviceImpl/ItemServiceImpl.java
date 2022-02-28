package com.hieuvm.bookstore.serviceImpl;

import com.hieuvm.bookstore.model.Item;
import com.hieuvm.bookstore.repository.ItemRepo;
import com.hieuvm.bookstore.repository.LoginRepo;
import com.hieuvm.bookstore.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private ItemRepo itemRepo;

    @Autowired
    private LoginRepo loginRepo;

    public List<Item> getAllItem() {
        return itemRepo.findAll();
    }

    public List<Item> getByCustomerId(Long customerId) {
        return itemRepo.getAllByCustomerId(customerId);
    }

    public Item getAllByCustomerIdAndProductId(Long customerId, Long productId) {
        return itemRepo.getAllByCustomerIdAndProductId(customerId, productId);
    }

    public Boolean insert(Item item) {
        itemRepo.save(item);
        return true;
    }

    public Item getById(Long id) {
        return itemRepo.getById(id);
    }

    public Item getByProductId(Long productId) {
        return itemRepo.getItemByProductId(productId);
    }

    public void deleteItem(Long id) {
        itemRepo.deleteById(id);
    }

    public Boolean save(Item item) {
        itemRepo.save(item);
        return true;
    }
}
