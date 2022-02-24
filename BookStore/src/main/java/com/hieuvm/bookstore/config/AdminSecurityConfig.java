package com.hieuvm.bookstore.config;

import com.hieuvm.bookstore.service.StaffUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
//import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;

import javax.sql.DataSource;

//@Configuration
//@EnableWebSecurity
//public class AdminSecurityConfig extends WebSecurityConfigurerAdapter {
public class AdminSecurityConfig  {

//    @Autowired
//    StaffUserDetailService staffUserDetailService;
//
//    @Autowired
//    private DataSource dataSource;
//
////    public void configureViewResolvers(ViewResolverRegistry registry) {
////        registry.jsp().prefix("/WEB-INF/views/").suffix(".jsp");
////    }
////
////    public void addViewControllers(ViewControllerRegistry registry) {
////        registry.addViewController("/login").setViewName("login");
////    }
//
//    @Bean
//    public BCryptPasswordEncoder passwordEncoder() {
//        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
//        return bCryptPasswordEncoder;
//    }
//
//    @Autowired
//    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//        auth.userDetailsService(staffUserDetailService).passwordEncoder(passwordEncoder());
//
////        // account kai/admin1234
////        auth.inMemoryAuthentication().passwordEncoder(passwordEncoder()).withUser("kai")
////                .password("123").roles("ADMIN");
////        // account sena/123456
////        auth.inMemoryAuthentication().passwordEncoder(passwordEncoder()).withUser("sena")
////                .password("123.").roles("USER");
////        // auth.inMemoryAuthentication().passwordEncoder(NoOpPasswordEncoder.getInstance()).withUser("sena").password("123456").roles("USER");
//
//
//    }
//    protected void configure(HttpSecurity http) throws Exception {
//        http.authorizeRequests().antMatchers("/admin/**").authenticated()
//                .anyRequest().permitAll().and()
//                .formLogin().loginPage("/admin/login").permitAll()
//                .defaultSuccessUrl("/login?success=true")
//                .failureUrl("/login?success=fail")
//                .loginProcessingUrl("/check");
//
//        // Cấu hình security/form login cho url /admin/**
//        // Cấu hình cho Login Form.
////        http.antMatcher("/admin/**").authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN").and().formLogin()//
////                .loginProcessingUrl("/admin/login")//
////                .loginPage("/admin/login");//
//////                .defaultSuccessUrl("/admin")//
//////                .failureUrl("/login?message=error")//
//////                .usernameParameter("username")//
//////                .passwordParameter("password")
//////                .and().exceptionHandling().accessDeniedPage("/403")
//////                .and().logout().logoutUrl("/admin/login").logoutSuccessUrl("/admin");
//
//        // Cấu hình Remember Me.
//        http.authorizeRequests().and() //
//                .rememberMe().tokenRepository(this.persistentTokenRepository()) //
//                .tokenValiditySeconds(1 * 30 * 60); // 30'
//    }
//
//    //    Có 2 cách thông dụng để Spring lưu trữ các thông tin này:
////    c1:Memory
//    @Bean
//    public PersistentTokenRepository persistentTokenRepository() {
//        JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
//        db.setDataSource(dataSource);
//        return db;
//    }
//
////    c2: Database
////    // Token stored in Memory (Of Web Server).
////    @Bean
////    public PersistentTokenRepository persistentTokenRepository() {
////        InMemoryTokenRepositoryImpl memory = new InMemoryTokenRepositoryImpl();
////        return memory;
////    }
}
