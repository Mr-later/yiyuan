package com.sltas.web.bpm.utils;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.Security;
import java.security.Signature;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.util.Enumeration;
import org.apache.log4j.Logger;
import org.bouncycastle.util.encoders.Base64;



public class UtilSHA1 {
	private static final Logger logger = Logger.getLogger(UtilSHA1.class);

	/**
	 * 证书文件签名
	 * @param aMessage
	 * @param certfile
	 * @param certpwd
	 * @return
	 * @throws Exception
	 */
	public static String fileSignMessage(String reqdata, String certfile, String certpwd) throws Exception {
		String tSignedBase64 = "";
		Signature tSignature = null;
		try {
			tSignature = Signature.getInstance("SHA1withRSA");
			tSignature.initSign(getMerchantKey(certfile, certpwd));
			tSignature.update(reqdata.toString().getBytes("UTF-8"));
			byte[] tSigned = tSignature.sign();
			tSignedBase64 = new String(Base64.encode(tSigned));
		} catch (Exception e) {
			throw e;
		}
		//System.out.println("签名串：" + tSignedBase64);
		return new String(tSignedBase64);
	}

	/**
	 * 验签
	 * @param reqdata
	 * @param signmsg
	 * @param certfile
	 * @return
	 */
	public static boolean verifySign(String reqdata, String signmsg, String certfile) {
		byte[] tSign = Base64.decode(signmsg);
		try {
			Signature tSignature = Signature.getInstance("SHA1withRSA");
			tSignature.initVerify(getTrustCertificate(certfile));
			tSignature.update(reqdata.toString().getBytes("UTF-8"));
			if (tSignature.verify(tSign)) {
				return true;
			} else {
				System.out.println("响应报文签名验证失败");
			}
		} catch (Exception e) {
			logger.error("响应报文签名验证失败 - " + e.getMessage(), e);
		}
		return false;
	}

	@SuppressWarnings("restriction")
	private static Certificate getTrustCertificate(String tCertFile) throws Exception {
		Certificate tCertificate = null;
		byte[] tCertBytes = new byte[4096];
		int tCertBytesLen = 0;
		FileInputStream tIn = null;
		try {
			tIn = new FileInputStream(tCertFile);
			tCertBytesLen = tIn.read(tCertBytes);
		} catch (Exception e) {
			logger.error("无法读取证书文档[" + tCertFile + "]！", e);
		} finally {
			try {
				tIn.close();
			} catch (Exception localException1) {
			}
		}
		byte[] tFinalCertBytes = new byte[tCertBytesLen];
		for (int i = 0; i < tCertBytesLen; ++i) {
			tFinalCertBytes[i] = tCertBytes[i];
		}

		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		try {
			CertificateFactory tCertificateFactory = CertificateFactory.getInstance("X.509");
			ByteArrayInputStream bais = new ByteArrayInputStream(tFinalCertBytes);

			if (bais.available() > 0) {
				tCertificate = tCertificateFactory.generateCertificate(bais);
			}
		} catch (Exception e) {
			logger.error("证书格式错误 - 无法由[" + tCertFile + "]生成X.509证书对象！", e);
		}
		return tCertificate;
	}

	@SuppressWarnings({ "restriction", "rawtypes" })
	private static PrivateKey getMerchantKey(String certfile, String certpwd) throws Exception {
		KeyStore tKeyStore = null;
		FileInputStream tIn = null;
		String tMerchantCertFile = certfile;
		String tMerchantCertPassword = certpwd;
		try {
			tIn = new FileInputStream(tMerchantCertFile);
			tKeyStore = KeyStore.getInstance("PKCS12", new com.sun.net.ssl.internal.ssl.Provider().getName());
			tKeyStore.load(tIn, tMerchantCertPassword.toCharArray());
		} catch (Exception e) {
			logger.error("无法读取证书文档[" + tMerchantCertFile + "]！", e);
		} finally {
			if (tIn != null) {
				try {
					tIn.close();
				} catch (Exception localException1) {
				}
			}
		}
		String tAliases = "";
		try {
			Enumeration e = tKeyStore.aliases();
			if (e.hasMoreElements()) {
				tAliases = (String) e.nextElement();
			}
		} catch (Exception e) {
			logger.error("证书格式错误，无法对证书进行编码！", e);
		}

		PrivateKey iMerchantKey = null;
		try {
			iMerchantKey = (PrivateKey) tKeyStore.getKey(tAliases, tMerchantCertPassword.toCharArray());
		} catch (Exception e) {
			logger.error("无法读取商户私钥，无法生成私钥证书对象！", e);
		}
		return iMerchantKey;
	}

	public static void main(String[] args) {
		try {                
			String reqdata = "version=v1.0&charset=1&systemid=88888888&msgseqno=20150413112409000001&protocolid=888888880000000051&customphone=P7aBd4e6DN/dHJgkqeismA==&customcardno=+3wpvSp4yI5xE8BWHlBRtWftSl0/Kh9B&bankname=0302|中信银行&customname=ykiHhgLsoEg=&custominfo=&reserved=&resultcode=0000&resultmsg=操作成功!";
//			System.out.println(fileSignMessage(MD5.crypt(reqdata).toLowerCase(), "D:/certificate/88888888.pfx","12345678"));
			String signmsg="t5FFJBOfJAFAGZ1nHeRERqfuKnIRiFo79sMpCemq1KhbFc797jRcyGwos8VF685H98lYFSd++DWBSNwXPQ05GdCUdmMli/D32HGpEHxwoDbrzC9yKJ+49kaICy65oOhUct3b6zXrrcytjLseVyH8Xs5liQcCs7O31s3mBY/XWi0=";
			boolean b = verifySign(UtilMD5.crypt(reqdata).toLowerCase(), signmsg, "D:/tmp/TrustSltf.crt");
			System.out.println(b);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
