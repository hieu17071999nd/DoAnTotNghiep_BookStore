package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.Item;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ItemRepo extends JpaRepository<Item, Long> {

    List<Item> findAllByStatus(Long status);

    Item getItemByProductId(Long productId);

    List<Item> getAllByCustomerId(Long customerId);

    Item getAllByCustomerIdAndProductId(Long customerId, Long productId);
}
