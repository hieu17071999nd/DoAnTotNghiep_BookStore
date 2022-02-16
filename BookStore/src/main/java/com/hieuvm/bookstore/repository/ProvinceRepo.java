package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.Province;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProvinceRepo extends JpaRepository<Province, Long> {

}
