package edu.iot.common.test;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseDaoTest<D> extends BaseTest {
	@Autowired
	D dao;
	
	// test 메서드 지정
	@Test
	public void test() {
		// assert 자바의 키워드 검사해서 참이면 통과, false면 다음의 문자열을 예외의 메세지로 사용해서 예외발생시킴
		assert dao != null : 
			dao.getClass().getSimpleName() + " 바인딩 실패";
	}

}
