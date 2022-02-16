package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Item;

import java.util.List;

public interface ItemService {

    List<Item> getAllItem();

    List<Item> getByCustomerId(Long customerId);

    Boolean insert(Item item);

    Item getById(Long id);

    Item getByProductId(Long id);

    void deleteItem(Long id);

    Boolean save(Item item);

}
