package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.FoodDonations;
import com.klef.jfsd.springboot.model.FoodRequest;
import com.klef.jfsd.springboot.model.Recipient;

public interface RecipientService {
	public String addrecipient(Recipient recipient);
   public Recipient checkrecipientlogin(String email,String pswd);
   public List<FoodDonations> viewalldonations();
   public String updaterecipientProfile(Recipient recipient);
   public Recipient displayrecipientbyId(String regno);
   public FoodDonations viewdonationbyID(int donationid);
   public String addfoodrequest(FoodRequest foodRequest);
   
}
