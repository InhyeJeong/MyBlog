package edu.iot.common.ui;

import java.util.ArrayList;
// 페이지네이션 테스트
import java.util.List;

import org.junit.Before;
import org.junit.Test;

public class PaginationTest {
	List<String> list;

	@Before
	public void setup() {
		list = new ArrayList<>();
		for (int i = 1; i <= 100; i++) {
			list.add("테스트 " + i);
		}
	}

	@Test
	public void testPagination() throws Exception {
		Pagination<String> pagination = new Pagination<>(list);
		int page = 1;

		while (true) {
			List<String> pageList = pagination.getPage(page);
			for (String str : pageList) {
				System.out.println(str);
			}
			pagination.printPages();
			
			
			
			Prompt prompt = new Prompt();
			String command = prompt.getString("p/n/숫자/q");
			//equals사용하기!
			if (command.equals("p")) {
				page = pagination.previous();
			} else if (command.equals("n")) {
				page = pagination.next();
			} else if (command.equals("q")) {
				break;
			} else {
				page = Integer.parseInt(command);
			}
			System.out.println();
		}
	}
}
