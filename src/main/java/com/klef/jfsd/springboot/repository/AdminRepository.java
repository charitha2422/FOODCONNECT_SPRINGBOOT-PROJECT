package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, String>
{
  @Query("select a from Admin a  where  a.username=?1 and a.password=?2")
  //since username is primary and its unique only one record is retrieved so Admin object is return type
   public Admin  checkadminlogin(String uname, String pwd);//it returns the admin object where uname and pwd matches and return null if they are not found
  
}
