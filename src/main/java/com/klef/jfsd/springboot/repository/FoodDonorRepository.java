package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.FoodDonor;

import jakarta.transaction.Transactional;

@Repository
public interface FoodDonorRepository extends JpaRepository<FoodDonor, Integer> 
{

	@Query("select d from FoodDonor d where d.email=?1 and d.password=?2 ")
	public FoodDonor checkdonorlogin(String email,String pwd);
	
	@Query("update FoodDonor d set d.status=?1 where d.id=?2")
	@Modifying
	@Transactional
	public int updatedstatus(String status,int id);

}


