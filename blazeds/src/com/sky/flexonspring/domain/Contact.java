package com.sky.flexonspring.domain;

import java.io.Serializable;
import java.util.Date;

public class Contact implements Serializable {
	private static final long serialVersionUID = 2847087180295614974L;
	
	private String fullname ;//联系人姓名
	private String emailaddress  ;//联系人Email
	private Date addcontactDate  ;//添加时间
	
	public Contact(){
		
	}
	
	public Contact(String fullname, String emailaddress, Date addcontactDate){
		this.fullname = fullname;
		this.emailaddress = emailaddress;
		this.addcontactDate = addcontactDate;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmailaddress() {
		return emailaddress;
	}
	public void setEmailaddress(String emailaddress) {
		this.emailaddress = emailaddress;
	}
	public Date getAddcontactDate() {
		return addcontactDate;
	}
	public void setAddcontactDate(Date addcontactDate) {
		this.addcontactDate = addcontactDate;
	}

}
