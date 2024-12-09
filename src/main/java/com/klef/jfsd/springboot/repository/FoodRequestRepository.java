package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.springboot.model.FoodRequest;

import jakarta.transaction.Transactional;

public interface FoodRequestRepository extends JpaRepository<FoodRequest, String> {
	
	@Query("update FoodRequest f set f.status=?1 where f.email=?2")
	@Modifying
	@Transactional
	public int updatefrstatus(String status,String email);
	

}
