package com.hieuvm.bookstore.serviceImpl;

import com.hieuvm.bookstore.model.Customer;
import com.hieuvm.bookstore.model.Staff;
import com.hieuvm.bookstore.repository.CustomerRepo;
import com.hieuvm.bookstore.repository.LoginRepo;
import com.hieuvm.bookstore.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepo customerRepo;

    @Autowired
    private LoginRepo loginRepo;

    public List<Customer> getAll(Pageable pageable) {
        return customerRepo.findAll(pageable).getContent();
    }

    public List<Customer> getAllCustomer() {
        return customerRepo.findAll();
    }

    public Boolean insert(Customer customer) {
        customerRepo.save(customer);
        return true;
    }

    public Customer getById(Long id) {
        return customerRepo.getById(id);
    }

    public Boolean save(Customer customer) {
        customerRepo.save(customer);
        return true;
    }

    public Customer login(String username, String password) {
        return loginRepo.login(username,password);
    }

    public List<Customer> findAllByUsernameAndStatus(String username) {
        return customerRepo.findAllByUsername(username);
    }
}
