package com.hieuvm.bookstore.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product extends BaseEntity {
    @Column(name = "NAME")
    private String name;

    @Column(name = "PRICE")
    private Long price;

    @Column(name = "IMAGE")
    private String image;

    @Column(name = "DESCRIPTION")
    private String description;

    @Column(name = "QUANTITY")
    private Long quantily;

    @Column(name = "AUTHOR")
    private String author; //tac gia

    @Column(name = "STATUS")
    private Long status;

    @Column(name = "CATEGORY_ID")
    private Long categoryId;

    @Column(name = "CUSTOMER_ID")
    private Long customerId;

    @Column(name = "COMMENT_ID")
    private Long commentId;

    @Column(name = "STAFF_ID")
    private Long staffId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public Long getQuantily() {
        return quantily;
    }

    public void setQuantily(Long quantily) {
        this.quantily = quantily;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }
}
