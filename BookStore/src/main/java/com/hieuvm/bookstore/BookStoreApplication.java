package com.hieuvm.bookstore;

import org.activiti.spring.boot.SecurityAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class BookStoreApplication {
//    @ImportResource({"classpath*:activity_config.xml"})
    public static void main(String[] args) {
        SpringApplication.run(BookStoreApplication.class, args);
    }
}
