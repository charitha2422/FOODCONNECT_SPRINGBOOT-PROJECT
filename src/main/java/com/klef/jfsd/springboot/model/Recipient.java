package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name = "recipientorg_table")
public class Recipient
{
    
    @Id
    @Column(name="recipient_regno")
    private String regno;
    @Column(name="recipient_name",length =50,nullable = false )
    private String name;
    @Column(name="recipient_email",length =50,nullable = false,unique = true )
    private String email;
    @Column(name="recipient_contact",length =50,nullable = false,unique = true  )
    private String contact;
    @Column(name="recipient_address",length =80,nullable = false )
    private String address;
    @Column(name="recipient_password",length =50,nullable = false )
    private String password;
    @Column(name="recipient_status",nullable = false,length = 50)
    private  String status;
    public String getRegno() {
		return regno;
	}
	public void setRegno(String regno) {
		this.regno = regno;
	}
	public String getname() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
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
