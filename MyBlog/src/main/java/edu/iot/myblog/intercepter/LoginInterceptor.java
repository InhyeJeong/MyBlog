package edu.iot.myblog.intercepter;

/**인터셉터를 이용한 로그인 처리 */
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;


@Component
public class LoginInterceptor extends BaseIntercepter {
	
	//base에서 context autowired

	// 통과하면 null 안하면 문자열로 이유 리턴
	@Override
	public String check(HttpServletRequest request) {
		if(getUser(request) == null) {
			return "로그인 확인이 필요한 서비스입니다.";
		}
		return null;
	}
	
	

}
