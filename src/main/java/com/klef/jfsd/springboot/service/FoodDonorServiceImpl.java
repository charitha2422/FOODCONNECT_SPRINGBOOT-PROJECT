package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.FoodDonations;
import com.klef.jfsd.springboot.model.FoodDonor;
import com.klef.jfsd.springboot.model.FoodRequest;
import com.klef.jfsd.springboot.repository.FoodDonationsRepository;
import com.klef.jfsd.springboot.repository.FoodDonorRepository;
import com.klef.jfsd.springboot.repository.FoodRequestRepository;

@Service
public class FoodDonorServiceImpl implements FoodDonorService {

	@Autowired
	private FoodDonorRepository donorRepository;
	
	@Autowired
	private FoodDonationsRepository donationsRepository;
	
	@Autowired
	private FoodRequestRepository foodRequestRepository;
	@Override
	public FoodDonor checkdonorlogin(String email, String pswd) {
		// TODO Auto-generated method stub
		return donorRepository.checkdonorlogin(email, pswd);
	}
	@Override
	public String adddonor(FoodDonor donor) {
		
		 donorRepository.save(donor);
		return "Donor Registered Successfully";
	}
	@Override
	public String adddonations(FoodDonations donations) {
		
		donationsRepository.save(donations);
		return  "Donation Added Successfully";
	}
	@Override
	public String updatedonorprofile(FoodDonor donor) {
	 FoodDonor d=donorRepository.findById(donor.getDonorId()).get();
	    d.setDonorId(donor.getDonorId());
		 d.setaddress(donor.getaddress());
		 d.setcontact(donor.getcontact());
		 d.setDonorName(donor.getDonorName());
		 d.setEmail(donor.getEmail());
		 d.setPassword(donor.getPassword());
		 
		 donorRepository.save(d);
	
	 
		return "Donor details Updated Successfully";
	}
	@Override
	public FoodDonor displaydonorbyId(int id) {
		// TODO Auto-generated method stub
		return donorRepository.findById(id).get();
	}
	@Override
	public String updatedontations(FoodDonations donations) {
	   //here Id means @Id
	FoodDonations d=donationsRepository.findById(donations.getId()).get();
	d.setId(donations.getId());
	d.setDescription(donations.getDescription());
	d.setDonationFrequency(donations.getDonationFrequency());
	d.setExpiryDate(donations.getExpiryDate());
	d.setFoodCategory(donations.getFoodCategory());
	d.setPickupDate(donations.getPickupDate());
	d.setPickupLocation(donations.getPickupLocation());

	
	    donationsRepository.save(d);
	
		
		
		
		return "Donations Updated Successfully";
	}
	@Override
	public String deletedonations(int did) {
		
	   donationsRepository.deleteById(did);
		return "Donation Deleted Successfully";
	}
	@Override
	public List<FoodDonations> viewdonordonations() {
		// TODO Auto-generated method stub
		return donationsRepository.findAll();
	}
	@Override
	public FoodDonations displaydonationbyEmail(String email) {
		// TODO Auto-generated method stub
		return donationsRepository.checkdonationswithemail(email);
	}
	

	@Override
	public List<FoodRequest> viewfoodrequests() {
		// TODO Auto-generated method stub
		return foodRequestRepository.findAll();
	}
	@Override
	public String updatefoodrequeststatus(String status, String email) {
		// TODO Auto-generated method stub
		foodRequestRepository.updatefrstatus(status, email);
		return "Food Request Status Updated Successfully" ;
	}
	
	
	
	
	
	

}
