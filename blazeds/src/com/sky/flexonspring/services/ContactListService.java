package com.sky.flexonspring.services;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sky.flexonspring.domain.Contact;

public class ContactListService implements Serializable, IContactListService {

	private static final long serialVersionUID = 3552207441192189726L;
	List<Contact> guestList = new ArrayList<Contact>();
	
	public List<Contact> getContactList() {
		
		guestList.add(new Contact("Contact One", "darkness@qq.com", new Date()));
		guestList.add(new Contact("Contact Two", "darkness@gmail.com", new Date()));
		guestList.add(new Contact("Contact Three", "darkness@163.com", new Date()));
		guestList.add(new Contact("Contact Four", "darkness@126.com", new Date()));
		return guestList;
	}
	
	public boolean saveContact(Contact contact){
		System.out.println("添加新用户成功！姓名：" + contact.getFullname() + "，邮件：" + contact.getEmailaddress() + ", 日期：" + contact.getAddcontactDate());
		guestList.add(contact);
		return guestList.size() % 2 == 0;
	}
}
