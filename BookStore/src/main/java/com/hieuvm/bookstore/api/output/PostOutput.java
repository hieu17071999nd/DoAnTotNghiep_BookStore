package com.hieuvm.bookstore.api.output;

import com.hieuvm.bookstore.model.Staff;

import java.util.ArrayList;
import java.util.List;

public class PostOutput {

    private int page;
    private int totalPage;
    private List<Staff> postList = new ArrayList<>();
    private int limit;
    private int totalItem;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<Staff> getPostList() {
        return postList;
    }

    public void setPostList(List<Staff> postList) {
        this.postList = postList;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getTotalItem() {
        return totalItem;
    }

    public void setTotalItem(int totalItem) {
        this.totalItem = totalItem;
    }
}
