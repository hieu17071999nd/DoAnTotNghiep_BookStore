package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.Category;
import com.hieuvm.bookstore.model.Order;
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
        StringBuilder sql = new StringBuilder(" SELECT * FROM product WHERE STATUS = 1 AND PRIORITY = 1 ");
        Query query = em.createNativeQuery(sql.toString(), Product.class);
        List<Product> productList = query.getResultList();
        if (productList == null) {
            return new ArrayList<>();
        }
        return productList;
    }

    public List<Product> getProductNew() {
        StringBuilder sql = new StringBuilder(" SELECT * FROM product WHERE STATUS = 1 AND PRIORITY = 2 ");
        Query query = em.createNativeQuery(sql.toString(), Product.class);
        List<Product> productList = query.getResultList();
        if (productList == null) {
            return new ArrayList<>();
        }
        return productList;
    }

    public List<Product> getProductRelative(Long categoryId, Long productId) {
        StringBuilder sql = new StringBuilder(" SELECT * FROM product WHERE STATUS = 1 AND CATEGORY_ID = :categoryId and ID != :productId");
        Query query = em.createNativeQuery(sql.toString(), Product.class);
        query.setParameter("categoryId", categoryId);
        query.setParameter("productId", productId);
        List<Product> productList = query.getResultList();
        if (productList == null) {
            return new ArrayList<>();
        }
        return productList;
    }

    public List<Category> getAllCategoryParents() {
        StringBuilder sql = new StringBuilder(" SELECT * FROM category WHERE STATUS = 1 AND type = 'root_type' and code != 'SGK' and code != 'STK' and code != 'SACHLUYENTHITHPT'");
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

    public List<Product> getProductSearch(String search, String categoryId) {
        StringBuilder sql = new StringBuilder(" SELECT * FROM product WHERE 1 = 1 ");
        if (!search.isEmpty()) {
            sql.append(" and name like :search ");
        }
        if (categoryId != null) {
            sql.append(" and category_id = :categoryId ");
        }
        Query query = em.createNativeQuery(sql.toString(), Product.class);
        if (!search.isEmpty()) {
            query.setParameter("search", "%" + search + "%");
        }
        if (categoryId != null) {
            query.setParameter("categoryId", categoryId);
        }
        List<Product> products = query.getResultList();
        return products;
    }

    public List<Product> getProductSearch2(String search, String page, String maxPageItem, String categoryId) {
        StringBuilder sql = new StringBuilder(" SELECT * FROM product WHERE 1 = 1 ");
        if (!search.isEmpty()) {
            sql.append(" and name like :search ");
        }
        if (categoryId != null) {
            sql.append(" and category_id = :categoryId ");
        }
        if (page != null) {
            sql.append(" LIMIT :maxPageItem");
        } else {
            sql.append(" LIMIT 4 ");
        }
        if (maxPageItem != null) {
            sql.append(" OFFSET  :page ");
        } else {
            sql.append(" OFFSET  0 ");
        }
        Query query = em.createNativeQuery(sql.toString(), Product.class);
        if (!search.isEmpty()) {
            query.setParameter("search", "%" + search + "%");
        }
        if (categoryId != null) {
            query.setParameter("categoryId", categoryId);
        }
        if (page != null) {
            Long a = Long.valueOf(page);
            Long b = Long.valueOf(maxPageItem);
            query.setParameter("page", b * (a -1));
        }
        if (maxPageItem != null) {
            Long b = Long.valueOf(maxPageItem);
            query.setParameter("maxPageItem", b);
        }
        List<Product> products = query.getResultList();
        return products;
    }

    public List<Product> findAllByCategoryId(Long categoryId, String page, String maxPageItem) {
        StringBuilder sql = new StringBuilder(" SELECT * FROM product WHERE 1 = 1 ");
        if (categoryId != null) {
            sql.append(" and category_id = :categoryId ");
        }
        if (page != null) {
            sql.append(" LIMIT :maxPageItem");
        } else {
            sql.append(" LIMIT 4 ");
        }
        if (maxPageItem != null) {
            sql.append(" OFFSET  :page ");
        } else {
            sql.append(" OFFSET  0 ");
        }
        Query query = em.createNativeQuery(sql.toString(), Product.class);
        if (categoryId != null) {
            query.setParameter("categoryId", categoryId);
        }
        if (page != null) {
            Long a = Long.valueOf(page);
            Long b = Long.valueOf(maxPageItem);
            query.setParameter("page", b * (a -1));
        }
        if (maxPageItem != null) {
            Long b = Long.valueOf(maxPageItem);
            query.setParameter("maxPageItem", b);
        }
        List<Product> products = query.getResultList();
        return products;
    }

    public List<Order> getOrderShipper(Long status, String page, String maxPageItem) {
        StringBuilder sql = new StringBuilder(" SELECT * FROM orders WHERE 1 = 1 ");
        if (status != null) {
            sql.append(" and status = :status ");
        }
        if (page != null) {
            sql.append(" LIMIT :maxPageItem");
        } else {
            sql.append(" LIMIT 5 ");
        }
        if (maxPageItem != null) {
            sql.append(" OFFSET  :page ");
        } else {
            sql.append(" OFFSET  0 ");
        }
        Query query = em.createNativeQuery(sql.toString(), Order.class);
        if (status != null) {
            query.setParameter("status", status);
        }
        if (page != null) {
            Long a = Long.valueOf(page);
            Long b = Long.valueOf(maxPageItem);
            query.setParameter("page", b * (a -1));
        }
        if (maxPageItem != null) {
            Long b = Long.valueOf(maxPageItem);
            query.setParameter("maxPageItem", b);
        }
        List<Order> orders = query.getResultList();
        return orders;
    }

    public List<Order> getOrderShipperConfirm(Long status, String page, String maxPageItem, Long staffId) {
        StringBuilder sql = new StringBuilder(" SELECT * FROM orders WHERE 1 = 1 ");
        if (staffId != null) {
            sql.append(" and staff_id = :staffId ");
        }
        if (status != null) {
            sql.append(" and status = :status ");
        }
        if (page != null) {
            sql.append(" LIMIT :maxPageItem");
        } else {
            sql.append(" LIMIT 5 ");
        }
        if (maxPageItem != null) {
            sql.append(" OFFSET  :page ");
        } else {
            sql.append(" OFFSET  0 ");
        }
        Query query = em.createNativeQuery(sql.toString(), Order.class);
        if (staffId != null) {
            query.setParameter("staffId", staffId);
        }
        if (status != null) {
            query.setParameter("status", status);
        }
        if (page != null) {
            Long a = Long.valueOf(page);
            Long b = Long.valueOf(maxPageItem);
            query.setParameter("page", b * (a -1));
        }
        if (maxPageItem != null) {
            Long b = Long.valueOf(maxPageItem);
            query.setParameter("maxPageItem", b);
        }
        List<Order> orders = query.getResultList();
        return orders;
    }

}
