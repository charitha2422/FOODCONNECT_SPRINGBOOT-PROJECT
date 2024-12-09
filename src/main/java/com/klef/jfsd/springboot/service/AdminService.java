package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.FoodDonor;
import com.klef.jfsd.springboot.model.Recipient;

public interface AdminService {
	public Admin checkadminlogin(String uname,String pswd);
	
    public List<FoodDonor> ViewallDonors();
    public List<Recipient> ViewallRecipients();
    public String AddAdmin(Admin admin);
    public String updaterecipientstatus(String status,String regno);
    public String updatedonortstatus(String status,int id);
    public long recipientcount();
    public long donorcount();
    public String deleterecipient(String rid);
    public String deletedonor(int did);
    
} 
