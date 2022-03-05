package com.hieuvm.bookstore.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.ManagedBean;

@Component
@ManagedBean
public class TaskManagementController {
    private String diagramUrl;

    public String getDiagramUrl() {
        return diagramUrl;
    }

    public void setDiagramUrl(String diagramUrl) {
        this.diagramUrl = diagramUrl;
    }
}
