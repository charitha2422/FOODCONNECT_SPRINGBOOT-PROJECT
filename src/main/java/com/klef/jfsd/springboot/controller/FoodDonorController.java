package com.klef.jfsd.springboot.controller;
import java.sql.Blob;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.FoodDonations;
import com.klef.jfsd.springboot.model.FoodDonor;
import com.klef.jfsd.springboot.model.FoodRequest;
import com.klef.jfsd.springboot.service.FoodDonorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FoodDonorController
{
	@Autowired
	private  FoodDonorService donorService;
	
	
	
	 @PostMapping("checkdonorlogin")
	   //as we take input from from form(servlet/jsp) use this
	   public  ModelAndView   checkadminlogin(HttpServletRequest request)
	   {
		   String email =request.getParameter("demail");
		   String pswd=request.getParameter("dpswd");
		   
		    FoodDonor donor= donorService.checkdonorlogin(email, pswd);
		    if(donor==null)
		    {
		    	ModelAndView mv=new ModelAndView("donorlogin");
		    	mv.addObject("message", "Login Failed");
		    	return mv;
		    	
		    	
		       
		    }
		    else if(!donor.getStatus().equals("Accepted"))
		    {
		    	 // Donor exists but status is not 'Accepted'
		    	ModelAndView mv=new ModelAndView("donorlogin");
		    	mv.addObject("message", "Awaiting Approval from Admin!!");
		    	return mv;
		    	
		    }
		   
		    else
		    {
		    	//donor is there so create the session for that donor user
		    	
		    	HttpSession session=request.getSession();
			    session.setAttribute("donor", donor);
			    ModelAndView mv=new ModelAndView();
			    mv.setViewName("donordashboard");
			    return mv;
		    			
		    }
		    	
	   }
	 
	 
	 @PostMapping("donorreg")
	 // as we take input from form(jsp convert to servlet)
	 public ModelAndView  insertdonor(HttpServletRequest request)
	 {
		String name= request.getParameter("dname");
		String email=request.getParameter("demail");
		String contact=request.getParameter("dcontact");
		String address=request.getParameter("daddress");
		String pswd=request.getParameter("dpswd");
		String status="Registered";
		FoodDonor donor= new FoodDonor();
		donor.setDonorName(name);
		donor.setaddress(address);
		donor.setcontact(contact);
		donor.setEmail(email);
		donor.setPassword(pswd);
		donor.setStatus(status);
		String msg=donorService.adddonor(donor);
		
		ModelAndView mv=new ModelAndView("donorlogin");
		   return mv;
		
	 }
	 
	 
	
	 @PostMapping("adddonation")
	 public ModelAndView adddonation(HttpServletRequest request,@RequestParam("foodimage") MultipartFile file) throws Exception
	 {
		 ModelAndView mv=new ModelAndView();
		 
		 try
		 {
//		  int id=Integer.parseInt(request.getParameter("did"));
		  String name=      request.getParameter("dname");
		  String contact=   request.getParameter("dcontact");
		  String email =    request.getParameter("demail");
		  String frequency= request.getParameter("dfrequency");
		  String category=  request.getParameter("dcategory");
		  String pickuplocation=request.getParameter("dpickuplocation");
		  String fdesc=      request.getParameter("ddesc");
		  
		  String fpickupdate=request.getParameter("dpickupdate");
		  String fexpirydate=request.getParameter("dexpirydate");
		  
		  byte[] bytes = file.getBytes();

		  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		  FoodDonations donations=new FoodDonations();
//		  donations.setId(id);
		  donations.setContact(contact);
		  donations.setDescription(fdesc);
		  donations.setDonationFrequency(frequency);
		  donations.setEmail(email);
		  donations.setExpiryDate(fexpirydate);
		  donations.setFoodCategory(category);
		  donations.setName(name);
		  donations.setPickupDate(fpickupdate);
		  donations.setPickupLocation(pickuplocation);
		  donations.setImage(blob);
		  
		String msg=  donorService.adddonations(donations);
		HttpSession session=   request.getSession();
		  session.setAttribute("donation", session);
		mv.setViewName("donordashboard");
		
		 }
		 catch(Exception e)
		 {
			 String  msg = e.getMessage();
			 System.out.println(msg.toString());
			 mv.setViewName("fooddonationerror");
			 mv.addObject("message", msg);
			 
			   
			   
			
		 }
		return mv;
		  
		
	 }
	 
	 @GetMapping("updatedonors")
	 public ModelAndView updatedonor()
	 {
		 ModelAndView mv= new ModelAndView();
		 mv.setViewName("updatedonors");
		 return mv;
	 }
	 
	 @PostMapping("updatedonorprofile")
	 public ModelAndView updatedonorprofile(HttpServletRequest request)
	 {
		ModelAndView mv= new ModelAndView();
		try
		{
			     int id=Integer.parseInt(request.getParameter("did"));
			     String name=request.getParameter("dname");
			     String email=request.getParameter("demail");
			     String contact=request.getParameter("dcontact");
			     String address=request.getParameter("daddress");
			    
			     String password=request.getParameter("dpass");
			     
			     FoodDonor donor= new FoodDonor();
			     donor.setaddress(address);
			     donor.setcontact(contact);
			     donor.setDonorId(id);
			     donor.setDonorName(name);
			     donor.setEmail(email);
			     donor.setPassword(password);
			     
		   String msg= donorService.updatedonorprofile(donor);
		   FoodDonor d=donorService.displaydonorbyId(id);
		   HttpSession session =request.getSession();
		   session.setAttribute("donor", d);
		   mv.setViewName("updatesuccess");
		   mv.addObject("message", msg);
		   return mv;
			   
		}
		catch(Exception e)
		{
			 mv.setViewName("updateerror");
			 mv.addObject("message", e);
			 return mv;
		}
	 }
	 
	
	 
	 @GetMapping("donorprofile")
	 public ModelAndView donorprofile()
	 {
		 ModelAndView mv=new ModelAndView();
		 mv.setViewName("donorprofile");
		 return mv;
	 }
	 
	 @GetMapping("donorlogout")
	 public ModelAndView donorlogout(HttpServletRequest request)
	 {
		HttpSession session= request.getSession();
		session.removeAttribute("donor");
		ModelAndView mv= new ModelAndView("homepage");
		return mv;
	 }
	 
	 
	 @GetMapping("donorsessionexpiry")
	 public ModelAndView donorlogout1()
	 {
		 ModelAndView mv= new ModelAndView();
		 mv.setViewName("donorsessionexpiry");
		 return mv;
	 }
	 
	 @GetMapping("updatedonationsbydonor")
	 public ModelAndView updatedonationsbydonor(HttpServletRequest request)
	 {
		 ModelAndView mv= new ModelAndView();
		 
		HttpSession session= request.getSession();
		FoodDonor d=(FoodDonor)session.getAttribute("donor");
		FoodDonations donation= donorService.displaydonationbyEmail(d.getEmail());
//	  if donations are not available then in console msg is printed as not donations available
		if (donation == null) {
		    System.out.println("No donations found for email: " + d.getEmail());
		}
    
		mv.setViewName("updatedonationsbydonor");
		
	    mv.addObject("donation", donation);
		 return mv;
		 
	}
	 
	 
	 @GetMapping("updatedona")
	 public ModelAndView updatedona()
	 {
		 ModelAndView mv= new ModelAndView();
		 mv.setViewName("updatedonations");
		 return mv;
		 
	}
	 
	 
	 @PostMapping("updatedonation")
	 public ModelAndView updatedonation(HttpServletRequest request)
	 {
		 int id=Integer.parseInt(request.getParameter("did"));

		 String frequency=request.getParameter("dfrequency");
		 String category=request.getParameter("dcategory");
		 String pickuplocation=request.getParameter("dpickuplocation");
		 String fdesc=      request.getParameter("ddesc");
		  String fpickupdate=request.getParameter("dpickupdate");
		  String fexpirydate=request.getParameter("dexpirydate");
		  
		  
		  
		  FoodDonations donations=new FoodDonations();
		
		  donations.setDescription(fdesc);
		  donations.setDonationFrequency(frequency);
		   donations.setId(id);
		  donations.setExpiryDate(fexpirydate);
           donations.setFoodCategory(category);
		  donations.setPickupDate(fpickupdate);
		  donations.setPickupLocation(pickuplocation);
		  
		   String msg=donorService.updatedontations(donations);
		   
		   ModelAndView mv= new ModelAndView("donordashboard");
		   return mv;
		   
		  
		  
		  
		  
	 }
	 
	
	 @GetMapping("deletedona")
	 public String deletedon(@RequestParam("id") int id)
	 {
		 donorService.deletedonations(id);
		 
		 return "redirect:/deletedonations";
		 
	 }
	 
	 @GetMapping("deletedonations")
	 public ModelAndView deletedonations()
	 {
		 ModelAndView mv= new ModelAndView();
		List<FoodDonations> donationlist=donorService.viewdonordonations();
		mv.setViewName("deletedonations");
		mv.addObject("donationlist", donationlist);
		return mv;
	 }
	 
	 @GetMapping("acceptfoodrequests")
	 public ModelAndView acceptfr()
	 {
	  List<FoodRequest>rlist=donorService.viewfoodrequests();
	  ModelAndView mv = new ModelAndView();
	  mv.setViewName("updaterequeststatus");
	  mv.addObject("rlist", rlist);
	   return mv;
		 
		 
	 }
	 
	  @GetMapping("updatefoodrequeststatus")
	  public String updaterstatus(@RequestParam("email") String email,@RequestParam("status") String status)
	  {
		  donorService.updatefoodrequeststatus(status,email);
		  return "redirect:/acceptfoodrequests";
		  
		  
	  }
	 
	 
	 


}
