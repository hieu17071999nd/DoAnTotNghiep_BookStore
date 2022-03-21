package com.hieuvm.bookstore.model;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "ORDERS")
public class Order {

    @Id
    private Long id;

    @Column(name = "CUSTOMER_ID")
    private Long customerId;

    @Column(name = "STAFF_ID")
    private Long staffId;

    @Column(name = "DELIVERY_ADDRESS")
    private String deliveryAddress;

    @Column(name = "NUMBER_ORDER_ITEM")
    private Long numerOrderItem;

    @Column(name = "TOTAL")
    private Long total;

    /*
    Trạng thái đơn hàng
    0. Đơn hàng đã bị hủy
    1. Hiệu lực, đã đặt, chờ phê duyệt
    2. Đã phê duyệt, chờ đợi giao cho nhân viên vận chuyển
    3. Đã giao cho nhân viên vận chuyển, chờ giao hàng
    4. Đã giao hàng thành công
     */
    @Column(name = "STATUS")
    private Long status;

    @Column
    @CreatedBy
    private String createBy;

    @Column
    @CreatedDate
    private Date createDate;

    @Column
    @LastModifiedBy
    private String updateBy;

    @Column
    @LastModifiedBy
    private Date updateDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public Long getNumerOrderItem() {
        return numerOrderItem;
    }

    public void setNumerOrderItem(Long numerOrderItem) {
        this.numerOrderItem = numerOrderItem;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Long getStaffId() {
        return staffId;
    }

    public void setStaffId(Long staffId) {
        this.staffId = staffId;
    }
}
