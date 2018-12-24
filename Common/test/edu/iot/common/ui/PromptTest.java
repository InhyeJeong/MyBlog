package edu.iot.common.ui;

//PromptTest : getLines 테스트
import static org.junit.Assert.*;

import org.junit.Test;

public class PromptTest {
	@Test
	public void testgetLines() throws Exception {
		Prompt prompt = new Prompt();
		String lines = prompt.getLines("내용");
		System.out.println(lines);

	}
}
