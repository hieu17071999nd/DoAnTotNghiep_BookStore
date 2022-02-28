package com.hieuvm.bookstore;

import com.hieuvm.bookstore.service.EmployeeService;
import org.activiti.spring.boot.SecurityAutoConfiguration;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class BookStoreApplication {
//    @ImportResource("classpath:activiti_cfg.xml")

    public static void main(String[] args) {
        SpringApplication.run(BookStoreApplication.class, args);
    }

    @Bean
    public CommandLineRunner init(final EmployeeService employeeService) {

        return new CommandLineRunner() {
            public void run(String... strings) throws Exception {
                employeeService.createEmployee();
            }
        };
    }

}
