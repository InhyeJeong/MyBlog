package edu.iot.common.exception;

public class PasswordMissmatchException extends Exception {
	public PasswordMissmatchException() {
		super("비밀번호가 일치하지 않습니다.");
	}
	
}
