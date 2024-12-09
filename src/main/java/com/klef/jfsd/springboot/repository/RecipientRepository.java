package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Recipient;

import jakarta.transaction.Transactional;

@Repository
public interface RecipientRepository extends JpaRepository<Recipient, String> {
	
	@Query("select r from Recipient r where r.email=?1 and r.password=?2")
	public Recipient checkrecipientlogin(String email,String password);
	
	@Query("update Recipient r set r.status=?1 where r.regno=?2")
	@Modifying
	@Transactional
	public int updaterecipientstatus(String status,String regno);

}
