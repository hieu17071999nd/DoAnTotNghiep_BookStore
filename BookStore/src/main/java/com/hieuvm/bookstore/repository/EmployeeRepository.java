package com.hieuvm.bookstore.repository;


import com.hieuvm.bookstore.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

	public Employee findByName(String name);

}
