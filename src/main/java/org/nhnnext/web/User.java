package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {
	
	
	@Id
	@Column(length = 50, nullable = false)
	private String userId;
	
	@Column(length = 1000, nullable = false)
	private String password;
	
//	@Column(length = 100, nullable = false)
//	private String name;
	
	public String getUserId() {
		// TODO Auto-generated method stub
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean matchPassword(String password){
		return this.password.equals(password);
	}
	

}
