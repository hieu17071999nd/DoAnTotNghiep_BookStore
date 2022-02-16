package com.hieuvm.bookstore.repository;

import com.hieuvm.bookstore.model.Ward;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WardRepo extends JpaRepository<Ward, Long> {

    List<Ward> findWardByDistrictId(String districtId);

}
