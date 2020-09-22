package com.abctravelagency.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.abctravelagency.model.Status;
import com.abctravelagency.model.User;

public interface StatusRepository extends JpaRepository<Status, Long> {
	List<Status> findAllByAccessOrderByIdDesc(int access);
	List<Status> findAllByUserOrderByIdDesc(User user);
	
//    @Modifying
//    @Query("UPDATE Company c SET c.address = :address WHERE c.id = :companyId")
//    int updateAddress(@Param("companyId") int companyId, @Param("address") String address);
}