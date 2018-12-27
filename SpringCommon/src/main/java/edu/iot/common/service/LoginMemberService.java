package edu.iot.common.service;

import edu.iot.common.model.LoginMember;

public interface LoginMemberService {
	
	LoginMember login(String userId, String password) throws Exception;
	
	LoginMember findById(String userId) throws Exception;
}
