package edu.iot.common.service;

import edu.iot.common.model.LoginMember;

public interface LoginMemberService {
	
	// 성공 : 멤버리턴 ,실패 : 예외던지기 or null리턴
	LoginMember login(String userId, String password) throws Exception;
	
	LoginMember findById(String userId) throws Exception;
}