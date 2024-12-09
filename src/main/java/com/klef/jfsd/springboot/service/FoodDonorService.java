package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.FoodDonations;
import com.klef.jfsd.springboot.model.FoodDonor;
import com.klef.jfsd.springboot.model.FoodRequest;

public interface FoodDonorService {
	public String adddonor(FoodDonor donor);
    public FoodDonor checkdonorlogin(String email,String pswd);
    public String adddonations(FoodDonations donations);
    public String updatedonorprofile(FoodDonor donor);
    public FoodDonations displaydonationbyEmail(String email);
    public String updatedontations(FoodDonations donations);
    public String deletedonations(int did);
    public List<FoodDonations> viewdonordonations();

    public List<FoodRequest> viewfoodrequests();
    public String  updatefoodrequeststatus(String status,String email);
    public FoodDonor displaydonorbyId(int id);
  
}
