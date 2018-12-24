package edu.iot.common.util;

public class Random {
	public static int rand(int start, int range) {
		return (int) (Math.random()*range) + start;
	}
}