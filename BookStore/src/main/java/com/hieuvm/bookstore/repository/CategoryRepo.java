package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepo extends JpaRepository<Category, Long> {

    List<Category> findAllByStatus(Long status);

    Category findAllByCode(String code);
}
