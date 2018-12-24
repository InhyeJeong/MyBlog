package edu.iot.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Util {
	/** AdminController에서 쓰임 */
	public static String getToday() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());
	}

}
