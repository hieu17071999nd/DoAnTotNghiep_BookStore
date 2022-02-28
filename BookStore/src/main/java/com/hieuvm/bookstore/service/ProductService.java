package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Product;

import java.util.List;

public interface ProductService {

    List<Product> getAllProduct();

    List<Product> findAllByCategoryId(Long categoryId);

    List<Product> findAllByCategoryIdAndStatus(Long categoryId, Long status);

    Boolean insert(Product product);

    Product getById(Long id);

    Boolean save(Product product);

    List<Product> getProductHot();

}
