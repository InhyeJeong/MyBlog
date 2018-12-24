package edu.iot.common.model;

import java.util.Date;

import lombok.Data;

@Data
public class LoginMember {
	private String userId;
	
	private String name;
	private String password;
	private	String salt;
	private String phoneNumber;
	private String email;
	private Date regDate;
	private Date updateDate;

}
