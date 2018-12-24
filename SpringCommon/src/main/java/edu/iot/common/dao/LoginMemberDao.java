package edu.iot.common.dao;


import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.iot.common.model.LoginMember;


public interface LoginMemberDao {

	//	findByID
	@Select("select * from loginmember where user_id = #{userID}")
	LoginMember findById(String userId) throws Exception;

}
