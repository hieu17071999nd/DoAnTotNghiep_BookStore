package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.model.Staff;
import com.hieuvm.bookstore.repository.StaffRepo;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

//@Service
//public class StaffUserDetailService implements UserDetailsService {
public class StaffUserDetailService {

//    @Autowired
//    StaffRepo staffRepo;
//
//    @Override
//    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
//        List<Staff> staffList = staffRepo.getStaffByUsername(s);
//        if (staffList.size() > 0) {
//            Staff staff = staffList.get(0);
//
//            List<GrantedAuthority> grantedAuthorityList = new ArrayList<GrantedAuthority>();
//            GrantedAuthority authority = new SimpleGrantedAuthority("ADMIN");
//            grantedAuthorityList.add(authority);
//
//            UserDetails userDetails = new User(s, staff.getPassword(), grantedAuthorityList);
//            return userDetails;
//        } else {
//            new UsernameNotFoundException("Login fail");
//        }
//        return null;
//    }
}
