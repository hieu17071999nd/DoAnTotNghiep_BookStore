package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.Category;
import com.hieuvm.bookstore.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BaseQueryRepo {

    @Autowired
    private EntityManager em;

    public List<Product> getProductHot() {
        StringBuilder sql = new StringBuilder(" SELECT * FROM product WHERE STATUS = 1 AND QUANTITY > 1 ");
        Query query = em.createNativeQuery(sql.toString(), Product.class);
        List<Product> productList = query.getResultList();
        if (productList == null) {
            return new ArrayList<>();
        }
        return productList;
    }

    public List<Category> getAllCategoryParents() {
        StringBuilder sql = new StringBuilder(" SELECT * FROM category WHERE STATUS = 1 AND type = 'root_type' and code != 'SGK' and code != 'STK' ");
        Query query = em.createNativeQuery(sql.toString(), Category.class);
        List<Category> categoryList = query.getResultList();
        if (categoryList == null) {
            return new ArrayList<>();
        }
        return categoryList;
    }

    public List<Category> getAllCategorySGK() {
        StringBuilder sql = new StringBuilder(" SELECT * FROM category WHERE STATUS = 1 AND type = 'SGK' ");
        Query query = em.createNativeQuery(sql.toString(), Category.class);
        List<Category> categoryList = query.getResultList();
        if (categoryList == null) {
            return new ArrayList<>();
        }
        return categoryList;
    }

    public List<Category> getAllCategorySTK() {
        StringBuilder sql = new StringBuilder(" SELECT * FROM category WHERE STATUS = 1 AND type = 'STK' ");
        Query query = em.createNativeQuery(sql.toString(), Category.class);
        List<Category> categoryList = query.getResultList();
        if (categoryList == null) {
            return new ArrayList<>();
        }
        return categoryList;
    }

    public List<Category> getAllCategorySLTTHPT() {
        StringBuilder sql = new StringBuilder(" SELECT * FROM category WHERE STATUS = 1 AND type = 'SLT_THPT' ");
        Query query = em.createNativeQuery(sql.toString(), Category.class);
        List<Category> categoryList = query.getResultList();
        if (categoryList == null) {
            return new ArrayList<>();
        }
        return categoryList;
    }

}
