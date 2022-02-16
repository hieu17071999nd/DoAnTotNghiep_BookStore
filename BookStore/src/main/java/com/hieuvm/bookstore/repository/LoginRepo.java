package com.hieuvm.bookstore.repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.hieuvm.bookstore.model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LoginRepo {

    @Autowired
    private EntityManager em;

    public Customer login(String username, String password) {
        StringBuilder sql = new StringBuilder(" SELECT * FROM customer WHERE UPPER(username) = :username and UPPER(password) = :password ");
        Query query = em.createNativeQuery(sql.toString(), Customer.class);
        query.setParameter("username", username.toUpperCase());
        query.setParameter("password", password.toUpperCase());
        List<Customer> customerList = query.getResultList();
        if (customerList != null) {
            return customerList.get(0);
        }
        return null;
    }

}
