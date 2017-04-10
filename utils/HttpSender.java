package com.sltas.web.bpm.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.sltas.web.bpm.cache.Constant;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/** 
* @author yangkai
* @version 创建时间：2017年1月5日 上午9:58:44 
* 类说明 
*/
/**
 * 发送HTTP请求
 * @author caiyonggang
 * @createDate 2016年8月2日上午11:09:37
 */
@SuppressWarnings("deprecation")
public class HttpSender {
	private static final Logger logger = Logger.getLogger(HttpSender.class);
	private static final HttpSender instance = new HttpSender();
	private static HttpClientBuilder hcb = null;
	
	private HttpSender() {
	}
	public static HttpSender getInstance() {
		return instance;
	}
	static {
		//采用绕过验证的方式处理https请求
		SSLContext sslcontext = null;
		try {
			sslcontext = createIgnoreVerifySSL();
		} catch (KeyManagementException e) {
			logger.error("", e);
		} catch (NoSuchAlgorithmException e) {
			logger.error("", e);
		}
        // 设置协议http和https对应的处理socket链接工厂的对象
		SSLConnectionSocketFactory sSLConnectionSocketFactory = new SSLConnectionSocketFactory(sslcontext,SSLConnectionSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
        Registry<ConnectionSocketFactory> socketFactoryRegistry = RegistryBuilder.<ConnectionSocketFactory>create()
            .register("http", PlainConnectionSocketFactory.INSTANCE)
            .register("https", sSLConnectionSocketFactory)
            .build();
        PoolingHttpClientConnectionManager connManager = new PoolingHttpClientConnectionManager(socketFactoryRegistry);
        hcb = HttpClients.custom().setConnectionManager(connManager);
	}

	/**
	 * 发送JSON请求和结果
	 * 成功才返回结果，否则返回null
	 * @author caiyonggang
	 * @createDate 2016年8月2日上午11:01:32
	 * @param url 请求地址
	 * @param contentObj JSONObject
	 * @return JSONObject
	 */
	public Map<String, Object> sendAndReciveJSON(String url,JSONObject contentObj) {
		// 固定数据添加
		String convertReqData = convertReqData(contentObj);
		Map<String, Object> respMap = new HashMap<String, Object>();
		try {
			logger.info("请求的url:"+url);
			logger.info("请求的数据convertReqData:"+convertReqData);
			Map<String, String> res = sendPost(url, convertReqData);
			String bodyStr = res.get("body");
			String status = res.get("status");
			//请求发送成功才能返回结果
			if("1".equals(status)){
				respMap = parseJSON2Map(bodyStr);
			}
		} catch (Exception e) {
			logger.info(e);
		}
		return respMap;
	}

	/**
	 * @创建人 caiyonggang
	 * @创建时间 2017年1月12日下午2:18:13
	 * @说明 追加公共参数做签名和数据加密
	 * @备注
	 * @param contentObj
	 */
	private String convertReqData(JSONObject contentObj) {
		JSONObject reqObj = new JSONObject();
		//将数据做des加密
		String reqdataDes = DESUtil.encryptDES(contentObj.toString());
		reqObj.put(Constant.reqdata, reqdataDes);//所有的数据存放在请求对象中
		reqObj.put(Constant.plat_id, Constant.getValue(Constant.plat_id));
		reqObj.put(Constant.version, Constant.getValue(Constant.version));
		if (!contentObj.has(Constant.channel)) {
			reqObj.put(Constant.channel, Constant.getValue(Constant.channel));
		}
		reqObj.put(Constant.charset, Constant.getValue(Constant.charset));
		//生成渠道流水
		reqObj.put(Constant.channel_serial_no, AfpUtil.getMsgseqno());
		//渠道请求时间
		reqObj.put(Constant.channel_time, UtilDate.getLongDate());
		try {
			reqObj.put(Constant.sign, UtilSHA1.fileSignMessage(UtilMD5.crypt(reqdataDes).toLowerCase(), Constant.getValue(Constant.certificate_directory)+Constant.getValue(Constant.plat_id)+".pfx",Constant.getValue(Constant.certpwd)));
		} catch (Exception e) {
			logger.error("获取签名失败",e);
		}
		
		return JSONObject.fromObject(reqObj).toString();
	}

	/**
	 * 发送表单POST请求
	 * @author caiyonggang
	 * @createDate 2016年8月2日上午10:41:19
	 * @param url
	 * @param strParams 表单字段名值对：Map<String,String>
	 * @return
	 * Map<String,String>： 
	 * 	元素1 "status":"状态1成功0失败";
	 * 	元素2 "body":"返回信息"
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public static Map<String,String> sendPost(String url,Map<String,String> strParams){
		logger.info("请求URL:"+url+" ;请求体（表单）:"+strParams);
		Map<String,String> resultMap = null;
		//创建post对象
		HttpPost post = createFormPost(url,strParams);
		//发送post请求
		resultMap = sendHttpPost(post);
	    return resultMap;
	}
	
	/**
	 * 发送文本POST请求
	 * @author caiyonggang
	 * @createDate 2016年8月2日上午10:41:16
	 * @param url
	 * @param strParam
	 * @return
	 * Map<String,String>： 
	 * 	元素1 "status":"状态：1成功（HttpStatus=200），0失败";
	 * 	元素2 "body":"返回信息"
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public static Map<String,String> sendPost(String url,String strParam) {
		
		//请求数据
		Map<String,String> resultMap = null;
		//创建post对象
		HttpPost post = createStringPost(url,strParam);
		//发送post请求
		resultMap = sendHttpPost(post);
	    return resultMap;
	}
	
	/**
	 * 传入HttpPost对象，发送post请求，返回结果
	 * @author caiyonggang
	 * @createDate 2016年7月29日下午12:07:56
	 * @param post HttpPost对象
	 * @return 
	 * 	Map<String,String>： 
	 * 	元素1 "status":"状态：1成功（HttpStatus=200），0失败";
	 * 	元素2 "body":"返回信息"
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	private static Map<String,String> sendHttpPost(HttpPost post)  {
		String body = "";
		String status = "0";
		Map<String,String> resultMap = new HashMap<String,String>();//返回对象
		
		//创建自定义的httpclient对象,忽略证书校验
//		hcb = HttpClientBuilder.create();
		CloseableHttpClient httpClient = hcb.build();
		
		long startTime = System.currentTimeMillis();
		CloseableHttpResponse response = null;
		int statusCode = 0;
		long endTime = 0;
		try {
			response = httpClient.execute(post);
		    
		    statusCode = response.getStatusLine().getStatusCode();
		    if (statusCode == HttpStatus.SC_OK) {
		        status = "1";
		    }else{
		    	logger.info("请求失败:" + response.getStatusLine());  
		    }
		    //post请求返回的字符串
		    HttpEntity entity = response.getEntity();
		    body = EntityUtils.toString(entity);
		    
		    EntityUtils.consume(entity);
			//释放链接
			response.close();
		
		} catch (Exception e) {
			//自定义请求结果状态，1-成功，0-失败
			logger.info("请求失败:"+e);
		}finally{
			endTime = System.currentTimeMillis();
			resultMap.put("status", status);
		}
		logger.info("请求结果 statusCode:" + statusCode+" ; 耗时:" + (endTime - startTime)+"毫秒 ; 结果正文:"+body);
	    resultMap.put("body", body);
	    logger.info("请求结果 "+resultMap);
	    return resultMap;
	}
	
	/**
	 * 创建表单形式的POST请求对象
	 * @author caiyonggang
	 * @createDate 2016年8月2日上午10:15:43
	 * @param url
	 * @param strParams 表单字段名值对：Map<String,String>
	 * @return
	 */
	private static HttpPost createFormPost(String url,Map<String,String> strParams) {
		HttpPost post = new HttpPost(url);
		// 对content做处理
		List<NameValuePair> list = new ArrayList<NameValuePair>();
		for(Entry<String,String> map :strParams.entrySet()){
			list.add(new BasicNameValuePair(map.getKey(),map.getValue()));
		}
		try {
			post.setEntity(new UrlEncodedFormEntity(list, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			// 这个错误可以忽略
		}
		return post;
	}
	
	/**
	 * 创建文本形式（JSON）的Post请求对象
	 * @author caiyonggang
	 * @createDate 2016年8月2日上午10:13:42
	 * @param url 请求地址
	 * @param strParam 请求文本（JSON）
	 * @return
	 */
	private static HttpPost createStringPost(String interName,String strParam){
		
		String url = Constant.getValue(Constant.url)+interName;
		
		HttpPost post = new HttpPost(url);
		post.addHeader("Content-type","application/json;charset=UTF-8");
//		post.setHeader("Accept", "application/json");
	    post.setEntity(new StringEntity(strParam, Charset.forName("UTF-8")));
		return post;
	}
	
	/**
	 * SSLContext绕过验证
	 * 	
	 * @return
	 * @throws NoSuchAlgorithmException 
	 * @throws KeyManagementException 
	 */
	private static SSLContext createIgnoreVerifySSL() throws NoSuchAlgorithmException, KeyManagementException {
		SSLContext sc = SSLContext.getInstance("TLS");
		
		// 实现一个X509TrustManager接口，用于绕过验证，不用修改里面的方法
		X509TrustManager trustManager = new X509TrustManager() {
			@Override
			public void checkClientTrusted(
					java.security.cert.X509Certificate[] paramArrayOfX509Certificate,
					String paramString) throws CertificateException {
			}

			@Override
			public void checkServerTrusted(
					java.security.cert.X509Certificate[] paramArrayOfX509Certificate,
					String paramString) throws CertificateException {
			}

			@Override
			public java.security.cert.X509Certificate[] getAcceptedIssuers() {
				return null;
			}
		};
		sc.init(null, new TrustManager[] { trustManager }, null);
		return sc;
	}
	
	@SuppressWarnings("unchecked")
	private static Map<String, Object> parseJSON2Map(String jsonStr){
		Map<String, Object> map = new HashMap<String, Object>();
		//最外层解析
		JSONObject json = JSONObject.fromObject(jsonStr);
		for(Object k : json.keySet()){
			Object v = json.get(k); 
			//如果内层还是数组的话，继续解析
			if(v instanceof JSONArray){
				List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
				Iterator<JSONObject> it = ((JSONArray)v).iterator();
				while(it.hasNext()){
					JSONObject json2 = it.next();
					list.add(parseJSON2Map(json2.toString()));
				}
				map.put(k.toString(), list);
			} else {
				map.put(k.toString(), v);
			}
		}
		return map;
	}
	
	public static void main(String[] args) throws Exception{
		Map<String,String> reqParams = new HashMap<String,String>();
		reqParams.put("aaa", "aaaa");
		reqParams.put("bbb", "bbbb");
//		String url = "https://baidu.com";
//		String url = "https://sdili.univ.sinojy.cn";
		String url = "https://1shanglian.k12.sinojy.cn/ff";
		
//		String url = "https://sdili.univ.sinojy.cn";
//		String url = "https://shanglian.k12.sinojy.cn/k12b_web/";
//		String url = "https://www.baidu.com";
		Map<String,String> resMap =  HttpSender.sendPost(url,reqParams);
		System.out.println(resMap);
		
		
	}
}
