package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.FoodDonations;

@Repository
public interface FoodDonationsRepository extends JpaRepository<FoodDonations, Integer> 
{
    @Query("select d from FoodDonations d where d.email=?1")
    public FoodDonations checkdonationswithemail(String email);

  
}
