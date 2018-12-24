package edu.iot.common.service;

public interface JavaMailService {
	void send(String title, String content) throws Exception;
}
