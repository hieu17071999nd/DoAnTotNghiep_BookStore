package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Category;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CategoryService {

    List<Category> getAll(Pageable pageable);

    List<Category> getAllCategory();

    List<Category> getAllByStatus(Long status);

    Boolean insert(Category category);

    Category getById(Long id);

    Category findAllByCode(String code);

    void deletePost(Long id);

    Category findOne(Long id);

    Boolean save(Category staff);

    int totalItem();

    List<Category> getAllCategoryParents();

    List<Category> getAllCategorySGK();

    List<Category> getAllCategorySTK();
}
