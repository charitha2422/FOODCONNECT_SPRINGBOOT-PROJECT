package com.klef.jfsd.springboot.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "foodrequest_table")
public class FoodRequest 
{
	 @Id
	 @Column(name="recipient_email",length =40 )
	private String email;
	@Column(name="recipientorg_name",length =40,nullable = false )
	private String name;
	 @Column(name="recipient_contact",length =40,nullable = false,unique = true )
	private String contact;
	
	 @Column(name="recipient_orgtype",length =40,nullable = false)
	private String orgType;
	 @Column(name="food_categorytype",length =40,nullable = false)
	private String fcategory;
	 @Column(name="food_quantity",nullable = false )
	private double quantity;
	 @Column(name="food_condition",length =40,nullable = false )
	private String condition;
	 @Column(name="recipient_pickuplocation",length =60,nullable = false )
	private String location;
	 @Column(name="food_neededbydate",length =40,nullable = false )
	private String needdate;
	 
	 @Column(name="request_status",nullable = false,length = 50)
     private  String status;
	 
	 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOrgType() {
		return orgType;
	}
	public void setOrgType(String orgType) {
		this.orgType = orgType;
	}
	public String getFcategory() {
		return fcategory;
	}
	public void setFcategory(String fcategory) {
		this.fcategory = fcategory;
	}
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getNeeddate() {
		return needdate;
	}
	public void setNeeddate(String needdate) {
		this.needdate = needdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
