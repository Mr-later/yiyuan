package com.sltas.web.bpm.utils;

import java.security.Key;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import org.bouncycastle.util.encoders.Base64;

import com.sltas.web.bpm.cache.Constant;


/**
 * @创建人 caiyonggang
 * @创建时间 2016年12月28日上午10:05:13
 * @说明 DES加密 本系统存储敏感数据进行加密存储的加密方法
 * @备注
 */
public class DESUtil {
	
	//加密key = i8u7y6t5+=r4e3w2q1
	public static String encryptKey = Constant.getValue(Constant.desKey);
	
	/**
	 * 使用本系统key加密
	 * @param encryptString
	 * @return
	 */
	public static String encryptDES(String encryptString){
		return encryptDES(encryptString, encryptKey);
	}
	/**
	 * 使用本系统key解密
	 * @param decryptString
	 * @return
	 */
	public static String decryptDES(String decryptString) {
		return decryptDES(decryptString, encryptKey);
	}
	
	/**
	 * @创建人 caiyonggang
	 * @创建时间 2016年12月28日上午10:08:16
	 * @说明 指定加密的key的DES加密重载方法
	 * @备注
	 * @param encryptString
	 * @param encryptKey
	 * @return
	 */
	public static String encryptDES(String encryptString, String encryptKey) {
		try {
			
			DESKeySpec dks = new DESKeySpec((encryptKey).getBytes());
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			Key secretKey = keyFactory.generateSecret(dks);
			Cipher cipher = Cipher.getInstance("DES");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey,  new SecureRandom());
			byte[] encryptedData = cipher.doFinal(encryptString.getBytes("UTF-8"));
			return new String(Base64.encode(encryptedData));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}	
	
	/**
	 * @创建人 caiyonggang
	 * @创建时间 2016年12月28日上午10:08:47
	 * @说明 指定key的DES解密重载方法
	 * @备注
	 * @param decryptString
	 * @param decryptKey
	 * @return
	 */
	public static String decryptDES(String decryptString, String decryptKey) {
		try {
			DESKeySpec dks = new DESKeySpec((decryptKey).getBytes());
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			Key secretKey = keyFactory.generateSecret(dks);
			Cipher cipher = Cipher.getInstance("DES");
			cipher.init(Cipher.DECRYPT_MODE, secretKey,  new SecureRandom());
			byte decryptedData[] = cipher.doFinal(Base64.decode(decryptString.getBytes()));
			return new String(decryptedData,"UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		String test="18510299946";
		System.out.println("原数据："+test);
		String encryptDES=encryptDES(test);
		System.out.println("加密后："+encryptDES);
		String decryptDES=decryptDES(encryptDES);
		System.out.println("解密后："+decryptDES);
		System.out.println(encryptDES("372922198812103591"));
		System.out.println(decryptDES("wcqaWQeTaxrmEqTShNttaAUsjBP2pwqT"));
	}

}
