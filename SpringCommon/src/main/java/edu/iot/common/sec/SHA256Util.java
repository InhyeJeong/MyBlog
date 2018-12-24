package edu.iot.common.sec;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;



//암호화 salt생성 (사용자 입력 비밀번호 + salt값) : 입력된 비밀번호가 항상 다른 값이 되도록 하는 역할

public class SHA256Util {
	
	
	public static String generateSalt() {
		Random random = new Random();// 랜덤 8바이트 데이터 생성(자바 util의 random이용)
		byte[] salt = new byte[8];
		random.nextBytes(salt);// 랜덤한 바이트 숫자로 8바이트를 채워준다. 호출시마다 다른 값이 들어감

		// salt를 문자열(16진수 : 1바이트당 2개로 표현됨)로 바꾸는 작업
	/*	StringBuilder sb = new StringBuilder();
		for (int i = 0; i < salt.length; i++) {
			// byte값을 hex 값으로 바꾸기
			sb.append(String.format("%02x", salt[i]));// 16진수 2자리, 공백은 0으로 채운다.
		}*/

		return byteToHexString(salt);
	}

	
	// pw + salt를 붙히는 작업
/*	public static String getEncrypt(String source, String salt) {
		return getEncrypt(source, salt.getBytes());
	}*/

	
	
	
	
	
	public static String getEncrypt(String source, String salt) { //매개변수(member.getPassword(), salt)
		

		/*byte[] a = source.getBytes();
		byte[] bytes = new byte[a.length + salt.length];*/
		
		byte[] bytes = (source + salt).getBytes();
		String result = "";
		
		/*System.arraycopy(a, 0, bytes, 0, a.length);
		System.arraycopy(salt, 0, bytes, a.length, salt.length);// pw+salt*/
		
		// 다이제스트 : hash를 이용하여 일정한 길이로 만들어내는 것(원본의 길이를 예측하지 못하도록 함)
		// MessageDigest객체 이용
		// Member테이블에도 password varchar2(64)와 salt varchar2(16) 가지고 있어야함
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(bytes);//update원문이 뭔지 알려줌
			
			byte[] byteData = md.digest();//32바이트의 새로운 배열 나옴
			//바이트를 문자열로 변환
			result = byteToHexString(byteData);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	 
	// 코드중복 : 바이트를 문자열로 변환
	public static String byteToHexString(byte[] bytes) {
		StringBuilder sb = new StringBuilder();
		for (int i= 0; i<bytes.length; i ++) {
			sb.append(String.format("%02x",bytes[i]));
		}
		return sb.toString();
	}
}