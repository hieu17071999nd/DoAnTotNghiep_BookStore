package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.District;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DistrictRepo extends JpaRepository<District, Long> {

    List<District> findDistrictByProvinceId(String provinceId);

}
