package com.sltas.web.bpm.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 * 
 * 金额处理工具
 * 
 */
public class MoneyUtil {

	private static final int DEF_DIV_SCALE = 10;

	/**
	 * 
	 * double类型的数字相加
	 * @return double
	 * 返回double类型
	 * 
	 */
	public static double add(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.add(b2).doubleValue();
	}

	/**
	 * double类型的数字相减 ( v1-v2)
	 * @param  v1
	 * @param  v2  
	 * @return 返回double类型
	 */
	public static double sub(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.subtract(b2).doubleValue();
	}

	/**
	 * double类型的数字相乘( v1*v2)
	 * @param  v1
	 * @param  v2  
	 * @return 返回double类型
	 */
	public static double mul(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.multiply(b2).doubleValue();
	}

	/**
	 * double类型的数字相除(v1/v2)，小数点后最多保留10位
     * @param  v1
	 * @param  v2  
	 * @return 返回double类型，小数点后最多保留10位
	 */
	public static double div(double v1, double v2) {
		return div(v1, v2, DEF_DIV_SCALE);
	}

	/**
	 * double类型的数字相除(v1/v2)，小数点后保留位数自定义
	 * @param  v1
	 * @param  v2
	 * @param scale
	 * 如果为0则保留1位小数
	 * @return 返回double类型，小数点后保留位数自定义
	 */
	public static double div(double v1, double v2, int scale) {
		if (scale < 0)
			throw new IllegalArgumentException("不能小于0");
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	/**
	 * 将double类型数字小数点后保留制定长度（格式化时会自动四舍五入）
	 * 如：UtilMoney.round(10.55555, 3)  -> 10.556
	 * 如果指定长度比原小数点后位数少  则原样返回
	 * 如：UtilMoney.round(10.55555, 7)  -> 10.55555
	 * 
	 * @param v1
	 * double
	 * @param scale
	 * 小数点后保留长度
	 * @return 返回double类型
	 */
	public static double round(double v1, int scale) {
		if (scale < 0)
			throw new IllegalArgumentException("不能小于0");
		BigDecimal b = new BigDecimal(Double.toString(v1));
		BigDecimal one = new BigDecimal("1");
		return b.divide(one, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	/**
	 * 将指定double以指定方式格式化（格式化时会自动四舍五入）
	 * 
	 * @param v1
	 * 需要转换的double
	 * @param pattern
	 *格式化的格式
	 * @return 
	 * 
	 */
	private static String formatDouble(double v1,String pattern) {
		DecimalFormat df = new DecimalFormat(pattern);
		return df.format(v1);
	}

	/**
	 * 将字符串解析为double
	 * 
	 */
	private static double parseString(String v1) {
		return Double.valueOf(v1).doubleValue();
	}

	/**
	 * 将元转换为分(无小数)
	 * 
	 * @param  yuan
	 * 元
	 * @return  分
	 */
	public static String getCentMoney(String yuan) {
		return MoneyUtil.formatDouble(MoneyUtil.mul(MoneyUtil.parseString(yuan), MoneyUtil
				.parseString("100")),"0");
	}
	
	/**
	 * 将分转换为元(保留两位小数)
	 * 
	 * @param  cent
	 * 分
	 * @return  元
	 */
	public static String getYuanMoney(String cent) {
		return MoneyUtil.formatDouble(MoneyUtil.div(MoneyUtil.parseString(cent), MoneyUtil
				.parseString("100")),"0.##");
	}
	
	/**
	 * 将金额以固定格式转化，转化后格式为：###,###,###,###,###.##
	 * @param money
	 * 需要转化格式的金额
	 * @return
	 * 转化格式后的金额
	 */
	public static String getFormatMoney(String money){
		return MoneyUtil.formatDouble(MoneyUtil.parseString(money), "###,###,###,###,###.##");
	}
	
	/**
	 * 数字转中文
	 * @param d
	 * @return String
	 */
	public static String changeToBig(double value) {
		  char[] hunit = { '拾', '佰', '仟' };// 段内位置表示 
		  char[] vunit = { '万', '亿' }; // 段名表示 
		  char[] digit = { '零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖' }; // 数字表示 
		  long midVal = (long) (value * 100); // 转化成整形 
		  String valStr = String.valueOf(midVal); // 转化成字符串
		  String head = "";
		  String rail = "";
		  if(valStr.length() > 2){
			  head = valStr.substring(0, valStr.length() - 2); // 取整数部分 
			  rail = valStr.substring(valStr.length() - 2); // 取小数部分 
		  }else if(valStr.length() == 2){
			  head = "";
			  rail = valStr;
		  }else{
			  head = "";
			  rail = "0" + valStr;
		  }
		  String prefix = ""; // 整数部分转化的结果 
		  String suffix = ""; // 小数部分转化的结果
		  
		  if(valStr.length()>17)
		  {
		      return "数值过大！";//解决问题1,超过千亿的问题。
		  }
		  
		  
		  // 处理小数点后面的数 
		  if (rail.equals("00")) { // 如果小数部分为0 
		   suffix = "整";
		  } else {
		   suffix = digit[rail.charAt(0) - '0'] + "角"
		     + digit[rail.charAt(1) - '0'] + "分"; // 否则把角分转化出来 
		  }
		  // 处理小数点前面的数 
		  char[] chDig = head.toCharArray(); // 把整数部分转化成字符数组 
		  char zero = '0'; // 标志'0'表示出现过0 
		  byte zeroSerNum = 0; // 连续出现0的次数 
		  for (int i = 0; i < chDig.length; i++) { // 循环处理每个数字 
		   int idx = (chDig.length - i - 1) % 4; // 取段内位置 
		   int vidx = (chDig.length - i - 1) / 4; // 取段位置 
		   if (chDig[i] == '0') { // 如果当前字符是0 
		    zeroSerNum++; // 连续0次数递增 
		    if (zero == '0' && idx!=0) { // 标志 ,连续零，仅读一次零，
		     zero = digit[0];   //解决问题2,当一个零位于第0位时，不输出“零”，仅输出“段名”.
		    } else if (idx == 0 && vidx > 0 && zeroSerNum < 4) {
		     prefix += vunit[vidx - 1];
		     zero = '0';
		    }
		    continue;
		   }
		   zeroSerNum = 0; // 连续0次数清零 
		   if (zero != '0') { // 如果标志不为0,则加上,例如万,亿什么的 
		    prefix += zero;
		    zero = '0';
		   }

		   //取到该位对应数组第几位。
		   int position=chDig[i] - '0';   
		   if(position==1 && i==0 && idx==1)//解决问题3 ,即处理10读"拾",而不读"壹拾"

		   {
		   }else{
		       prefix += digit[position]; // 转化该数字表示 
		   }
		   
		   if (idx > 0)      // 段内位置表示的值
		    prefix += hunit[idx - 1];
		   if (idx == 0 && vidx > 0) {      // 段名表示的值 
		    prefix += vunit[vidx - 1];   // 段结束位置应该加上段名如万,亿 
		   }
		  }

		  if (prefix.length() > 0)
		   prefix += '圆'; // 如果整数部分存在,则有圆的字样 
		  return prefix + suffix; // 返回正确表示 
		 }
}
