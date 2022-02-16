package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.District;
import com.hieuvm.bookstore.model.Province;
import com.hieuvm.bookstore.model.Ward;

import java.util.List;

public interface AddressService {

    List<Province> getAllProvince();

    List<District> getDistrictByProvince(String provinceId);

    List<Ward> getWardByDistrict(String districtId);

}
