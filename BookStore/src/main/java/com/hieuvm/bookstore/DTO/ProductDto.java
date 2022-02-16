package com.hieuvm.bookstore.DTO;

import com.hieuvm.bookstore.model.Category;
import com.hieuvm.bookstore.model.Product;
import com.hieuvm.bookstore.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ProductDto {

    private Product product;
    private Category category;

    public ProductDto() {
    }

    public ProductDto(Product product, Category category) {
        this.product = product;
        this.category = category;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
