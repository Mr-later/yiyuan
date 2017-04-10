package com.sltas.web.bpm.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;



public class AfpUtil {

	/**
	 * simple generate active code mothed
	 * @return
	 */
	public String generateActiveCode()
	{
		String str = String.valueOf(System.currentTimeMillis());
		return str;
	}
	

	//private static final Logger	logger		= Logger.getLogger(AfpUtil.class);
	/**
	 * 生成账单使用 6位的自增的数字
	 */
	private static int	currentID	= 100000;
	/**
	 * 生成订单使用的 10位的自增的数字
	 */
	private static Long	currentID10	= 1000000000L;

	private static Object idLock = new Object();

	private static Random randGen = null;
	
	private static char[] numbersAndLetters = null;	
	
	public static int getUniqueID()
	{
		synchronized (idLock)
		{
			currentID++;
			currentID = currentID == 999999 ? 100000 : currentID;
			return currentID;
		}
	}
	public static Long getUniqueID10()
	{
		synchronized (idLock)
		{
			currentID10++;
			currentID10 = currentID10 == 9999999999L ? 1000000000L : currentID10;
			return currentID10;
		}
	}
	/**
	 * 获生成订单流水 放在order_head 表中 总长度 25位
	 * @return 字符串(格式为:O+yyyyMMddHHmmss+10位数) 比如 O201607231816011000000002
	 */
	public static String getOrderTransno()	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		return "O"+sdf.format(date)+getUniqueID10();
	}
	/**
	 * 获生成订单流水 放在order_payment 表中 得字段 msgseqno 总长度 25位
	 * @return 字符串(格式为:C+yyyyMMddHHmmss+10位数) 比如 O201607231816011000000002
	 */
	public static String getMsgseqno(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		return "C"+sdf.format(date)+getUniqueID10();
	}
	/**
	 * 获生成账单流水 放在 bill_detailed 表中 总长度21位
	 * @return 字符串(格式为:B+yyyyMMddHHmmss+6位数)比如 B201607231817011000002
	 */
	public static String getBillTransno()	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		return "B"+sdf.format(date)+getUniqueID();
	}
	public static String getUniqueStringID()
	{
		return Integer.toString(getUniqueID());
	}

	public static String getUniqueStringIDQdone()
	{
		return "qd"+Integer.toString(getUniqueID());
	}	

	public static final String randomString(int length) {
        if (length < 1) {
            return null;
        }
        if (randGen == null) {
               randGen = new Random();
               numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyz" +
                  "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
                 //numbersAndLetters = ("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
                }
        char [] randBuffer = new char[length];
        for (int i=0; i<randBuffer.length; i++) {
            randBuffer[i] = numbersAndLetters[randGen.nextInt(71)];
         //randBuffer[i] = numbersAndLetters[randGen.nextInt(35)];
        }
        return new String(randBuffer);
}	
}
