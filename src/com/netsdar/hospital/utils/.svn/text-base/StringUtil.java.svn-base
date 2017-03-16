package com.netsdar.hospital.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

import org.apache.poi.ss.usermodel.Cell;

public class StringUtil {

	public static String EncoderByMd5(String origin) {
		String resultString = null;
		try {
			resultString = new String(origin);
			MessageDigest md = MessageDigest.getInstance("MD5");
			resultString = byteArrayToHexString(md.digest(resultString
					.getBytes()));
		} catch (Exception ex) {
		}
		return resultString;
	}
	
	

	/**
	 * 按文本读取excel数据
	 * @param cell
	 * @return
	 */
	public static String getStringCellValue(Cell cell) {
		String strCell = "";
		if(cell!=null){
			switch (cell.getCellType()) {
				case Cell.CELL_TYPE_STRING:
					strCell = cell.getStringCellValue();
					break;
				case Cell.CELL_TYPE_NUMERIC:
					strCell = String.valueOf((long)cell.getNumericCellValue());
					break;
				case Cell.CELL_TYPE_BOOLEAN:
					strCell = String.valueOf(cell.getBooleanCellValue());
					break;
				case Cell.CELL_TYPE_BLANK:
					strCell = "";
					break;
				default:
					strCell = "";
					break;
			}
			if (strCell.equals("") || strCell == null) {
				return "";
			}
		}
		return strCell;
	}
	
	/***
	 * 将url中的中文参数进行处理
	 * @param param
	 * @return
	 */
	public static String encodeString(String param){
		String str=null;
		try {
			str=new String(param.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	
	/**
	 * 转换字节数组为16进制字串
	 * 
	 * @param b
	 *            字节数组
	 * @return 16进制字串
	 */

	public static String byteArrayToHexString(byte[] b) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			resultSb.append(byteToHexString(b[i]));
		}
		return resultSb.toString();
	}
	
	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0)
			n = 256 + n;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}
	
	private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5",
		"6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };
	
	
	public static void main(String[] args) {
		System.out.println(EncoderByMd5("123"));
	}
	
}
