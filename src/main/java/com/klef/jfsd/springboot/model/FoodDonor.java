package com.klef.jfsd.springboot.model;



import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="donor_table")
public class FoodDonor 
{
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name="donor_id")
	    private int donorId;
        @Column(name="donor_name",length =50,nullable = false )
	    private String donorName;
        @Column(name="donor_email",length =50,nullable = false,unique = true )
	    private String email;
        @Column(name="donor_contact",length =50,nullable = false,unique = true  )
	    private String contact;
        @Column(name="donor_address",length =50,nullable = false )
	    private String address;
        @Column(name="donor_password",length =50,nullable = false )
	    private String password;
        @Column(name="donor_status",nullable = false,length = 50)
        private  String status;
	    
	 
	    public int getDonorId() {
	        return donorId;
	    }

	    public void setDonorId(int donorId) {
	        this.donorId = donorId;
	    }

	    public String getDonorName() {
	        return donorName;
	    }

	    public void setDonorName(String donorName) {
	        this.donorName = donorName;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getcontact() {
	        return contact;
	    }

	    public void setcontact(String contact) {
	        this.contact = contact;
	    }

	    public String getaddress() {
	        return address;
	    }

	    public void setaddress(String address) {
	        this.address = address;
	    }

	
	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

	   

	   
	}

	   
	   


