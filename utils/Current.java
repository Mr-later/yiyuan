package com.sltas.web.bpm.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Current {
	
	private static int currentID = 1000000000;

	private static Object idLock = new Object();
	
	public static int getUniqueID() {
		synchronized (idLock) {
			currentID++;
			currentID = currentID == 1999999999 ? 1000000000 : currentID;
			return currentID;
		}
	}
	/**
	 * 
	 * 6位自增长数字
	 * @return
	 */
	public static String getUniqueStringID() {
		return Integer.toString(getUniqueID());
	}
	
	/**
	 * 14位时间
	 * @return
	 */
	public static String getDate() {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(currentTime);
		return dateString;
}	
	/**
	 * 年月日+六位自增长(顺序)
	 * 24位String数字串
	 * @return
	 */
	public static String getTwentyFourRandom(){
		String s = getUniqueStringID();
		String d = getDate();
		String c = d + s;
		return c;
	}
	
	public static void main(String[] args) {
		System.out.println(getTwentyFourRandom());
	}
	
}
