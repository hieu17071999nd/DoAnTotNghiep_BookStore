package com.hieuvm.bookstore.serviceImpl;

import com.hieuvm.bookstore.model.Product;
import com.hieuvm.bookstore.model.Staff;
import com.hieuvm.bookstore.repository.BaseQueryRepo;
import com.hieuvm.bookstore.repository.ProductRepo;
import com.hieuvm.bookstore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private BaseQueryRepo baseQueryRepo;

    public List<Product> getAllProduct() {
        return productRepo.findAll();
    }

    public List<Product> getAll(Pageable pageable) {
        return productRepo.findAll(pageable).getContent();
    }

    public List<Product> findAllByCategoryId(Long categoryId) {
        return productRepo.findAllByCategoryId(categoryId);
    }

    public List<Product> findAllByCategoryIdAndStatus(Long categoryId, Long status) {
        return productRepo.findAllByCategoryIdAndStatus(categoryId, status);
    }

    public Boolean insert(Product product) {
        productRepo.save(product);
        return true;
    }

    public Product getById(Long id) {
        return productRepo.getById(id);
    }

    public Boolean save(Product product) {
        productRepo.save(product);
        return true;
    }

    public List<Product> getProductHot() {
        return baseQueryRepo.getProductHot();
    }
    public List<Product> getProductSearch(String search) {
        return productRepo.getProductSearch(search);
    }

}
