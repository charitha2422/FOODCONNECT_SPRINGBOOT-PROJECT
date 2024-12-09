package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.FoodDonations;
import com.klef.jfsd.springboot.model.FoodRequest;
import com.klef.jfsd.springboot.model.Recipient;
import com.klef.jfsd.springboot.service.RecipientService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class RecipientController 
{
	
	@Autowired
	private RecipientService recipientService;
	 @PostMapping("checkrecipientlogin")
	  
	   public  ModelAndView   checkrecipientlogin(HttpServletRequest request)
	   {
		   String email =request.getParameter("remail");
		   String pswd=request.getParameter("rpswd");
		   
	Recipient recipient=recipientService.checkrecipientlogin(email, pswd);

		    if(recipient==null)
		    {

		    	ModelAndView mv=new ModelAndView("recipientlogin");
		    	mv.addObject("message","Login Failed");
		    	return mv;
		    	
		    	
		    }
		    else if(!recipient.getStatus().equals("Accepted"))
		    {
		    	ModelAndView mv=new ModelAndView("recipientlogin");
		    	mv.addObject("message","Awaiting Approval from Admin!!");
		    	return mv;
		    	
		    }
		    else
		    {
		    	HttpSession session=request.getSession();
		    	session.setAttribute("recipient",recipient);
		    	
		    	ModelAndView mv=new ModelAndView();
		    	mv.setViewName("recipientdashboard");
		    	 return mv;		
		    }
		   
		    	
	   }
	 
	 @PostMapping("recipientreg")
	 // as we take input from form(jsp convert to servlet)
	 public ModelAndView  insertrecipient(HttpServletRequest request)
	 {
		String regno=request.getParameter("regno");
		String name= request.getParameter("rname");
		String email=request.getParameter("remail");
		String contact=request.getParameter("rcontact");
		String address=request.getParameter("raddress");
		String pswd=request.getParameter("rpswd");
		String status="Registered";
		Recipient recipient= new Recipient();
		recipient.setAddress(address);
		recipient.setContact(contact);
		recipient.setPassword(pswd);
		recipient.setEmail(email);
		recipient.setRegno(regno);
		recipient.setName(name);
		recipient.setStatus(status);
		  
		String msg=recipientService.addrecipient(recipient);
		
	
		
		ModelAndView mv=new ModelAndView("recipientlogin");
		   return mv;
		
	 }
	 @GetMapping("viewdonations")
	 public ModelAndView viewdonations()
	 {
		List<FoodDonations>donationlist =recipientService.viewalldonations();
		 ModelAndView mv=new ModelAndView();
		 mv.setViewName("viewdonations");
		 mv.addObject("donationlist", donationlist);
		 return mv;
	 }
	 
	 
	 @GetMapping("updaterecipient")
	 public ModelAndView updaterecipient()
	 {
		 ModelAndView mv=new ModelAndView();
		 mv.setViewName("updaterecipient");
		 return mv;
	 }
	 
	 @PostMapping("updaterecipientprofile")
	 public ModelAndView updaterecipientprofile(HttpServletRequest request)
	 {
		 ModelAndView mv=new ModelAndView();
		 try
		 {
			 String regno=request.getParameter("regno");
			 String name=request.getParameter("orgname");
			 String email=request.getParameter("email");
			 String contact=request.getParameter("contact");
			 String address=request.getParameter("address");
			 String password=request.getParameter("password");
			 
			 Recipient r= new Recipient();
			 r.setAddress(address);
			 r.setContact(contact);
			 r.setEmail(email);
			 r.setName(name);
			 r.setPassword(password);
			 r.setRegno(regno);
			 
			String msg= recipientService.updaterecipientProfile(r);
			
		    Recipient recipient=recipientService.displayrecipientbyId(regno);
		 
		     HttpSession session=request.getSession();
		     session.setAttribute("recipient", recipient);
		     mv.setViewName("updaterecipient");
		     mv.addObject("message", msg);
		 
		 }
		 catch(Exception e)
		 {
			 mv.setViewName("updateerror");
			 mv.addObject("message", e);
		 }
		 return mv;
	 }
	
	 
	 @GetMapping("recipientprofile")
	 public ModelAndView recipientprofile()
	 {
		 ModelAndView mv=new ModelAndView();
		 mv.setViewName("recipientprofile");
		 return mv;
	 }
	 
	 @GetMapping("recipientlogout")
	 public ModelAndView donorlogout(HttpServletRequest request)
	 {
		HttpSession session= request.getSession();
		session.removeAttribute("recipient");
		ModelAndView mv= new ModelAndView("homepage");
		return mv;
	 }
	 

	 @GetMapping("recipientsessionexpiry")
	 public ModelAndView donorlogout1()
	 {
		 ModelAndView mv= new ModelAndView();
		 mv.setViewName("recipientsessionexpiry");
		 return mv;
	 }
	 
	 
	 @GetMapping("foodreq")
	 public ModelAndView foodreq()
	 {
		 ModelAndView mv= new ModelAndView();
		List<FoodDonations> dlist= recipientService.viewalldonations();
		 mv.setViewName("requestfoodall");
		 mv.addObject("donationlist", dlist);
		 return mv;
	 }
	 
	 
	 
	 
	 @GetMapping("updatedonat")
	 public ModelAndView foodrequest()
	 {
		 ModelAndView mv= new ModelAndView("foodrequest");
		
		 return mv;
	 }
	 
	 
	 @GetMapping("displayfoodimage")
	 public ResponseEntity<byte[]> displayfoodimagedemo(@RequestParam("id") int id) throws Exception
	 {
	  FoodDonations donations=     recipientService.viewdonationbyID(id);
	   byte [] imageBytes = null;
	   imageBytes =donations.getImage().getBytes(1,(int) donations.getImage().length());

	   return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	   
	   
	 //ResponseEntity means Response Body, HTTP Status Code(200 means Ok), Headers
	 }
	 
	 
    @PostMapping("addfoodreq")
    public ModelAndView addfoodrequest(HttpServletRequest  request)
    {
    	String orgname= request.getParameter("name");
    	String contact= request.getParameter("contact");
    	String email= request.getParameter("email");
    	String orgtype= request.getParameter("orgType");
    	String category= request.getParameter("fcategory");
    	int quantity= Integer.parseInt(request.getParameter("quantity")) ; 
    	String fcondition= request.getParameter("foodCondition");
    	String plocation= request.getParameter("plocation");
    	String date= request.getParameter("neededByDate");
    	String status="Waiting";
    	FoodRequest fr = new FoodRequest();
    	fr.setCondition(fcondition);
    	fr.setContact(contact);
    	fr.setEmail(email);
    	fr.setFcategory(category);
    	fr.setLocation(plocation);
    	fr.setName(orgname);
    	fr.setNeeddate(date);
    	fr.setOrgType(orgtype);
    	fr.setQuantity(quantity);
    	fr.setStatus(status);
    	String msg=recipientService.addfoodrequest(fr);
    	
    	ModelAndView mv= new ModelAndView("foodrequestsuccess");
    	
    	 mv.addObject("msg",msg);
    	 return mv;
    }
    @Autowired 
	   private JavaMailSender mailSender;
    
    @PostMapping("sendremail") 
	   public ModelAndView sendEmail(HttpServletRequest request) throws Exception  
	   { 
	       String recipientname = request.getParameter("recipientorg"); 
	       
	       String toemail = request.getParameter("email");
	       String updatetype = request.getParameter("update-type"); 
	       String responsemethod = request.getParameter("response-method"); 
	       String responsetime = request.getParameter("response-time"); 
	       String subject="FoodConnect-The Platform to ReduceFoodWastage and improve FoodSecurity";
	        MimeMessage mimeMessage = mailSender.createMimeMessage(); 
	        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true); 
	         
	        int otp = (int)(Math.random() * 99999); // random number generation         
	 
	        helper.setTo(toemail); 
	        helper.setSubject(subject); 
	        helper.setFrom("charitha3011sri@gmail.com"); 
	 
	        String htmlContent =  
	                   "<h3>Recieve Updates on Donation</h3>" + 
	                   "<p><strong>OrganizationName:</strong> " + recipientname+ "</p>" + 
	                   "<p><strong>ContactEmail:</strong> " + toemail + "</p>" + 
	                   "<p><strong>Subject:</strong> " + subject + "</p>" + 
	                   "<p><strong>TypeofUpdate:</strong> " + updatetype+ "</p>" + 
	                   "<p><strong>PreferredResponseMethod:</strong> " +responsemethod+ "</p>" + 

	                   "<p><strong>PreferredResponseTime:</strong> " +responsetime+ "</p>" ; 
	 
	 
	           helper.setText(htmlContent, true); 
	           mailSender.send(mimeMessage); 
	          
	           ModelAndView mv = new ModelAndView("thankyou"); 
	           mv.addObject("message", "Email Sent Successfully"); 
	 
	           return mv; 
	   } 
	
	  
	 
	 
	 
}
