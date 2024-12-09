package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.FoodDonor;
import com.klef.jfsd.springboot.model.Recipient;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.FoodDonorRepository;
import com.klef.jfsd.springboot.repository.RecipientRepository;

@Service
public class AdminServiceImpl implements AdminService {
     @Autowired
     private AdminRepository adminRepository;
	 
     @Autowired
     private FoodDonorRepository donorRepository;
     
     @Autowired
     private RecipientRepository recipientRepository;
	
	
	@Override
	public Admin checkadminlogin(String email, String pswd) {
	   
		return adminRepository.checkadminlogin(email, pswd);
	}






	@Override
	public List<FoodDonor> ViewallDonors() {
		// TODO Auto-generated method stub
		return donorRepository.findAll();
	}



	@Override
	public List<Recipient> ViewallRecipients() {
		// TODO Auto-generated method stub
		return recipientRepository.findAll();
	}



	@Override
	public String AddAdmin(Admin admin) {
		// TODO Auto-generated method stub
		adminRepository.save(admin);
		return "Admin Added Successfully";
	}






	@Override
	public String updaterecipientstatus(String status, String regno) {
		
		recipientRepository.updaterecipientstatus(status, regno);
		
		return "Recipient Status Updated Successfully ";
	}






	@Override
	public long recipientcount() {
		// TODO Auto-generated method stub
		return recipientRepository.count();
	}






	@Override
	public long donorcount() {
		// TODO Auto-generated method stub
		return donorRepository.count();
	}






	@Override
	public String deleterecipient(String rid) {
		 recipientRepository.deleteById(rid);;
		return "Recipient Deleted Successfully";
	}






	@Override
	public String deletedonor(int did) {
	    donorRepository.deleteById(did);
		return "Donor deleted Successfully";
	}






	@Override
	public String updatedonortstatus(String status, int id) {
		donorRepository.updatedstatus(status, id);
		
		return "Updated Donor Status Successfully";
	}






	

}
