package edu.iot.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Util {
	/** AdminController에서 쓰임 */
	public static String getToday() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());
	}
	public static String getToday2() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-hh");
		return sdf.format(new Date());
	}
	
	public static String getYesterday() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(cal.DATE, -1);
		return sdf.format(cal.getTime());
	}
	
	public static String getYesterday2() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-hh");
		Calendar cal = Calendar.getInstance();
		cal.add(cal.DATE, -1);
		return sdf.format(cal.getTime());
	}

}
