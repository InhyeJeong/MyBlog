package edu.iot.common.model;

import org.hibernate.validator.constraints.NotEmpty;
//인터셉터를 이용한 로그인 처리
import lombok.Data;

@Data
public class Login {
	@NotEmpty(message="사용자 ID는 필수 항목입니다.")
	private String userId;
	@NotEmpty(message="비밀번호는 필수 항목입니다.")
	private String password;
	
	private String url;
	
	/**안내멘트 saveUrl에 의한 모델추가*/
	private String reason;
}
