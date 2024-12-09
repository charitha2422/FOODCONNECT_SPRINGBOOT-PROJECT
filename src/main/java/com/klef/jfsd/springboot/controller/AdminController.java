package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.FoodDonor;
import com.klef.jfsd.springboot.model.Recipient;
import com.klef.jfsd.springboot.service.AdminService;


import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
   @Autowired
   private AdminService adminService;
   
   
   
   
	 @Autowired 
	   private JavaMailSender mailSender;
   
   @GetMapping("/")
   public ModelAndView home()
   {
	   ModelAndView mv= new ModelAndView("homepage");
	
	   
	   return mv;
   }
   
   @GetMapping("admindashboard")
   public ModelAndView adminhome()
   {
	   ModelAndView mv=new ModelAndView();
	   mv.setViewName("admindashboard");
	   long count1=adminService.recipientcount();
	   long count2=adminService.donorcount();
	   long count3=count1+count2;
	   mv.addObject("recipientcount", count1);
	   mv.addObject("donorcount", count2);
	   mv.addObject("totalcount", count3);
	   return mv;
	   
   }
   
   
   @PostMapping("checkadminlogin")
   //as we take input from from form(servlet/jsp) use this
   public  ModelAndView   checkadminlogin(HttpServletRequest request)
   {
	   String uname=request.getParameter("auname");
	   String pswd=request.getParameter("apswd");
	   
	    Admin admin= adminService.checkadminlogin(uname, pswd);
	    if(admin!=null)
	    {
	    	HttpSession session=request.getSession();
	    	session.setAttribute("admin", admin);
	    	
	    	
	    	ModelAndView mv=new ModelAndView();
	    	mv.setViewName("admindashboard");
	    	long count1=adminService.recipientcount();
		   	   long count2=adminService.donorcount();
		   	   long count3=count1+count2;
		   	   mv.addObject("recipientcount", count1);
		   	   mv.addObject("donorcount", count2);
		   	   mv.addObject("totalcount", count3);
	    	 return mv;
	    }
	    else
	    {
	    	ModelAndView mv=new ModelAndView("adminlogin");
	    	mv.addObject("message", "Login Failed Try Again!!");
	    	return mv;
	    			
	    }
   }
	    
	  @GetMapping("viewalldonors")
	  public ModelAndView viewalldonors()
	  {
		  ModelAndView mv=new ModelAndView();
		  
		  List<FoodDonor> donorlist=adminService.ViewallDonors();
		  mv.setViewName("viewdonors");
		  mv.addObject("donorlist", donorlist);//firstargument any variable name where the value 2nd attribute is stored to access this in model (jsp page)
		  return mv;
	  }
	  
	  @GetMapping("viewallrecipients")
	  
	  public ModelAndView viewallrecipients()
	  {
		  ModelAndView mv=new ModelAndView();
		List<Recipient>recipientlist= adminService.ViewallRecipients();
		mv.setViewName("viewrecipients");
		mv.addObject("reciplist", recipientlist);
		return mv;
		
	  }
	  
	  @PostMapping("addadmin")
	  public ModelAndView addadmin(HttpServletRequest request)
	  {
		String uname=  request.getParameter("auname");
		 String pswd= request.getParameter("apswd");
		 Admin admin=new  Admin();
		 admin.setUsername(uname);
		 admin.setPassword(pswd);
		String msg= adminService.AddAdmin(admin);
		 ModelAndView mv=new ModelAndView("admin home");
		 return mv;
	  }
	  
	
	  
	  @GetMapping("updaterecipientstatus")
	  public ModelAndView updaterecipientstatus()
	  {
		  ModelAndView mv=new ModelAndView();
		List<Recipient>reclist= adminService.ViewallRecipients();
		mv.setViewName("updaterecipientstatus");
		mv.addObject("reciplist", reclist);
		return mv;
	  }
	  
	  @GetMapping("updaterstatus")
	  public String updaterstatus(@RequestParam("regno") String regno,@RequestParam("status") String status)
	  {
		  adminService.updaterecipientstatus(status,regno );
		  return "redirect:/updaterecipientstatus";
		  
		  
	  }
	  
	  @GetMapping("deleterecip")
	  public String deleterecip(@RequestParam("id") String id)
	  {
		  adminService.deleterecipient(id);
		  return "redirect:/deleterecipient";
		  
	  }
	  
	  
	  @GetMapping("deleterecipient")
	  public ModelAndView deleterecipient()
	  {
		  ModelAndView mv=new ModelAndView();
		 List<Recipient>rlist=  adminService.ViewallRecipients();
		  mv.addObject("reciplist", rlist);
		  return mv;
		
	  }
	  @GetMapping("deletedon")
	  public String deletedon(@RequestParam("id") int did)
	  {
		  adminService.deletedonor(did);
		  return "redirect:/deletedonors";
	  }
	  
	  @GetMapping("deletedonors")
	  public ModelAndView deletedonor()
	  {
		  ModelAndView mv=new ModelAndView("deletedonor");
		  
		List<FoodDonor>donorlist=  adminService.ViewallDonors();
		  mv.addObject("donorlist", donorlist);
		  return mv;
	  }
	  
	  
	  @GetMapping("updatedonorstatus")
	  public ModelAndView updatedonorstatus()
	  {
		  ModelAndView mv=new ModelAndView();
		List<FoodDonor>dlist= adminService.ViewallDonors();
		mv.setViewName("updatedonorstatus");
		mv.addObject("dlist", dlist);
		return mv;
	  }
	  
	  @GetMapping("updatedstatus")
	  public String updatedstatus(@RequestParam("id") int id,@RequestParam("status") String status)
	  {
		  adminService.updatedonortstatus(status, id);
		  return "redirect:/updatedonorstatus";
		  
		  
	  }
	  
	  
	  @GetMapping("adminlogout")
	  public ModelAndView adminlogout(HttpServletRequest request)
	  {
		 HttpSession session= request.getSession();
		 session.removeAttribute("admin");
		 ModelAndView mv=new ModelAndView();
		 mv.setViewName("homepage");
		 return mv;
		 
	  }
	  
	  @GetMapping("adminsessionexpiry")
	  public ModelAndView adminlogout1()
	  {
		  ModelAndView mv=new ModelAndView();
		  mv.setViewName("adminsessionexpiry");
		  return mv;
	  }
		

	  
	  
	  @PostMapping("sendemail") 
	   public ModelAndView sendEmail(HttpServletRequest request) throws Exception  
	   { 
	       String name = request.getParameter("name"); 
	       String toemail = request.getParameter("email"); 
	       String subject = request.getParameter("subject"); 
	       String msg = request.getParameter("message"); 
	 
	        MimeMessage mimeMessage = mailSender.createMimeMessage(); 
	        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true); 
	         
	        int otp = (int)(Math.random() * 99999); // random number generation         
	 
	        helper.setTo(toemail); 
	        helper.setSubject(subject); 
	        helper.setFrom("charitha3011sri@gmail.com"); 
	 
	        String htmlContent =  
	                   "<h3>Contact Form Details</h3>" + 
	                   "<p><strong>Name:</strong> " + name + "</p>" + 
	                   "<p><strong>Email:</strong> " + toemail + "</p>" + 
	                   "<p><strong>Subject:</strong> " + subject + "</p>" + 
	                   "<p><strong>Message:</strong> " + msg + "</p>" + 
	                   "<p><strong>OTP:</strong> " + otp + "</p>"; 
	 
	 
	           helper.setText(htmlContent, true); 
	           mailSender.send(mimeMessage); 
	          
	           ModelAndView mv = new ModelAndView("mailsuccess"); 
	           mv.addObject("message", "Email Sent Successfully"); 
	 
	           return mv; 
	   } 
	
	  
	  
	  
	 
   }

