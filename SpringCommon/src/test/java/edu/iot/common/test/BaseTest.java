package edu.iot.common.test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {// 스프링 설정 파일 배열
		"classpath:config/*-context.xml", })
public class BaseTest {
	
}
