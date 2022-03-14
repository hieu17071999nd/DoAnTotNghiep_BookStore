package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Product;
import com.hieuvm.bookstore.model.Staff;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductService {

    List<Product> getAll(Pageable pageable);

    List<Product> getAllProduct();

    List<Product> findAllByCategoryId(Long categoryId);

    List<Product> findAllByCategoryIdAndStatus(Long categoryId, Long status);

    Boolean insert(Product product);

    Product getById(Long id);

    Boolean save(Product product);

    List<Product> getProductHot();

    List<Product> getProductSearch(String search);
}
