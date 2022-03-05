package com.hieuvm.bookstore;

import com.hieuvm.bookstore.repository.StaffRepo;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Test {
    @Autowired
    StaffRepo staffRepo;

    public static void main(String[] args) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        System.out.println(dtf.format(now));
        System.out.println();
        java.util.Date date = new java.util.Date();
        System.out.println(date);

//        staffRepo.findAll()
    }
}
