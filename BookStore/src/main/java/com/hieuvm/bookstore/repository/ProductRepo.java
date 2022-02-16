package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepo extends JpaRepository<Product, Long> {

    List<Product> findAllByStatus(Long status);

    List<Product> findAllByCategoryId(Long categoryId);


}
