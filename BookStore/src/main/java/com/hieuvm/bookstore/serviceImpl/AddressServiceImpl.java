package com.hieuvm.bookstore.serviceImpl;

import com.hieuvm.bookstore.model.District;
import com.hieuvm.bookstore.model.Province;
import com.hieuvm.bookstore.model.Ward;
import com.hieuvm.bookstore.repository.DistrictRepo;
import com.hieuvm.bookstore.repository.ProvinceRepo;
import com.hieuvm.bookstore.repository.WardRepo;
import com.hieuvm.bookstore.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    private ProvinceRepo provinceRepo;

    @Autowired
    private DistrictRepo districtRepo;

    @Autowired
    private WardRepo wardRepo;

     public List<Province> getAllProvince() {
         return provinceRepo.findAll();
    }

    public List<District> getDistrictByProvince(String provinceId) {
        return districtRepo.findDistrictByProvinceId(provinceId);
    }
    public List<Ward> getWardByDistrict(String districtId) {
        return wardRepo.findWardByDistrictId(districtId);
    }

}
