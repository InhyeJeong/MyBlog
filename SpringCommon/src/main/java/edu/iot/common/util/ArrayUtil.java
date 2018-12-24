package edu.iot.common.util;
// 배열의 요소를 만듦. 자리교환
public class ArrayUtil {

	//모든 것을 포함하는, obj
	public static void swap(Object[] arr, int i1, int i2) {
		Object temp = arr[i1];
		arr[i1] = arr[i2];
		arr[i2] = temp;
	}
}
