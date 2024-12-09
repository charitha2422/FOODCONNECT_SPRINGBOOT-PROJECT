package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.FoodDonations;
import com.klef.jfsd.springboot.model.FoodRequest;
import com.klef.jfsd.springboot.model.Recipient;
import com.klef.jfsd.springboot.repository.FoodDonationsRepository;
import com.klef.jfsd.springboot.repository.FoodRequestRepository;
import com.klef.jfsd.springboot.repository.RecipientRepository;

@Service
public class RecipientServiceImpl  implements RecipientService

{
	@Autowired
	private RecipientRepository recipientRepository;
	
     @Autowired
     private FoodDonationsRepository donationsRepository;
     
     @Autowired
     private FoodRequestRepository foodRequestRepository;
	
	

	@Override
	public Recipient checkrecipientlogin(String email, String pswd) {
		// TODO Auto-generated method stub
		return recipientRepository.checkrecipientlogin(email, pswd);
	}

	@Override
	public String addrecipient(Recipient recipient) {
		recipientRepository.save(recipient);
		return "Recipient registered Successfully";
	}

	@Override
	public List<FoodDonations> viewalldonations() {
		 return donationsRepository.findAll();
	
	}

	@Override
	public String updaterecipientProfile(Recipient recipient) {
		Recipient r=   recipientRepository.findById(recipient.getRegno()).get();
		r.setAddress(recipient.getAddress());
		r.setContact(recipient.getContact());
		r.setEmail(recipient.getEmail());
		r.setName(recipient.getname());
		r.setPassword(recipient.getPassword());
           recipientRepository.save(r);
		return "Recipient Updated Successfully";
	}

	@Override
	public Recipient displayrecipientbyId(String regno) {
		// TODO Auto-generated method stub
		return recipientRepository.findById(regno).get();
	}

	@Override
	public FoodDonations viewdonationbyID(int donationid) {
		// TODO Auto-generated method stub
		return donationsRepository.findById(donationid).get();
	}

	@Override
	public String addfoodrequest(FoodRequest foodRequest) {
		// TODO Auto-generated method stub
		 foodRequestRepository.save(foodRequest);
		 return "Donation request was waiting for the approval !!";
	}
	
	

}
