package com.hieuvm.bookstore.serviceImpl;

import com.hieuvm.bookstore.model.Category;
import com.hieuvm.bookstore.repository.BaseQueryRepo;
import com.hieuvm.bookstore.repository.CategoryRepo;
import com.hieuvm.bookstore.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryRepo categoryRepo;

    @Autowired
    private BaseQueryRepo baseQueryRepo;

    @Override
    public List<Category> getAllByStatus(Long status) {
        return categoryRepo.findAllByStatus(1L);
    }

    public List<Category> getAll(Pageable pageable) {
        return categoryRepo.findAll(pageable).getContent();
    }

    public List<Category> getAllCategory() {
        return categoryRepo.findAll();
    }

    public Boolean insert(Category category) {
        categoryRepo.save(category);
        return true;
    }

    public Category getById(Long id) {
        return categoryRepo.getById(id);
    }

    public Category findAllByCode(String code) {
        return categoryRepo.findAllByCode(code);
    }

    public void deletePost(Long id) {
        categoryRepo.deleteById(id);
    }

    public Category findOne(Long id) {
        return categoryRepo.getById(id);
    }

    public Boolean save(Category category) {
        categoryRepo.save(category);
        return true;
    }

    public int totalItem() {
        return (int) categoryRepo.count();
    }

    public List<Category> getAllCategoryParents() {
        return baseQueryRepo.getAllCategoryParents();
    }

    public List<Category> getAllCategorySGK() {
        return baseQueryRepo.getAllCategorySGK();
    }

    public List<Category> getAllCategorySTK() {
        return baseQueryRepo.getAllCategorySTK();
    }
}
