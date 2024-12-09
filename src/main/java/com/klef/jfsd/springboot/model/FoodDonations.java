package com.klef.jfsd.springboot.model;
import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "fooddonations_table")
public class FoodDonations 
{
	 @Id
     @GeneratedValue(strategy=GenerationType.IDENTITY)
     
	 private int id;
	 @Column(name="donororg_name",length =40,nullable = false )
	 private String name;
	 @Column(name="donor_contact",length =50,nullable = false ,unique = true)
     private String contact;
	 @Column(name="donor_email",length =50,nullable = false ,unique = true)
     private String email;
	 @Column(name="donation_frequency",length =50,nullable = false )
     private String donationFrequency;
	 @Column(name="foodcategory",length =50,nullable = false )
    private String foodCategory;
	 @Column(name="pickuplocation",length =50,nullable = false )
    private String pickupLocation;
	 @Column(name="donation_desc",length=300 ,nullable = false )
    private String description;
	 @Column(name ="food_image",nullable = false)
	 private Blob image;
	 @Column(name="food_pickupdate",nullable = false )
    private String pickupDate;
	 @Column(name="food_expirydate",nullable = false )
    private String expiryDate;
	public String getname() {
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
	public String getDonationFrequency() {
		return donationFrequency;
	}
	public void setDonationFrequency(String donationFrequency) {
		this.donationFrequency = donationFrequency;
	}
	public String getFoodCategory() {
		return foodCategory;
	}
	public void setFoodCategory(String foodCategory) {
		this.foodCategory = foodCategory;
	}
	public String getPickupLocation() {
		return pickupLocation;
	}
	public void setPickupLocation(String pickupLocation) {
		this.pickupLocation = pickupLocation;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPickupDate() {
		return pickupDate;
	}
	public void setPickupDate(String pickupDate) {
		this.pickupDate = pickupDate;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}  

}
