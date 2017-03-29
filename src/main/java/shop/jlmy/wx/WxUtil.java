package shop.jlmy.wx;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

public class WxUtil {

	/*
	 * 获取或者发送微信数据
	 * requestUrl : 发送或接收数据URL
	 * requestMethod : 类型 GET 或者 POST
	 * outputStr : 发送的数据（可以为NULL）
	 */
	public static String getOrSendRequestData(String requestUrl,String requestMethod,String outputStr){
		StringBuffer buffer=null;
		try {
			HttpsURLConnection conn=getHttpsUrlConnection(requestUrl, requestMethod);
			//往服务器写内容
			if(outputStr!=null){
				OutputStream os=conn.getOutputStream();
				os.write(outputStr.getBytes("UTF-8"));
				os.close();
			}
			//读取服务器返回的内容
			InputStream is=conn.getInputStream();
			InputStreamReader isr=new InputStreamReader(is,"UTF-8");
			BufferedReader br=new BufferedReader(isr);
			buffer=new StringBuffer();
			String line=null;
			while((line=br.readLine())!=null){
				buffer.append(line);
			}
			is.close();
			isr.close();
			br.close();
		} catch (Exception e) {
			System.out.println("HTTPS链接异常");
		} 
		return buffer.toString();
	}
	/*
	 * https请求
	 * requestUrl 请求地址
	 * requestMethod 请求方法{POST/GET}
	 * outputStr 请求参数
	 */
	public static HttpsURLConnection getHttpsUrlConnection(String requestUrl,String requestMethod){
		HttpsURLConnection conn=null;
		try{
			SSLContext sslContext=SSLContext.getInstance("SSL","SunJSSE");
			TrustManager[] tm={new MyX509TrustManager()};
			sslContext.init(null, tm, new SecureRandom());
			SSLSocketFactory ssf=sslContext.getSocketFactory();
			//接口地址
			URL url=new URL(requestUrl);
			conn=(HttpsURLConnection) url.openConnection();
			//方法{POST/GET}
			conn.setRequestMethod(requestMethod);
			conn.setSSLSocketFactory(ssf);
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.connect();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("获取HTTPS链接异常");
		}
		return conn;
	}

	/*
	 * 验证Signature
	 */
	public static boolean checkSignature(String signature,String timestamp,String nonce){
		boolean result=false;
		//按字典顺序排序
		String[] array=new String[]{new WxParam().getToken(),timestamp,nonce};
		Arrays.sort(array);
		//将3个参数拼接成一个字符串
		String str=array[0].concat(array[1]).concat(array[2]);
		String sha1Str=null;
		try {
			//对拼接后的字符串进行SHA1加密
			MessageDigest md=MessageDigest.getInstance("SHA-1");
			byte[] digest=md.digest(str.getBytes());
			sha1Str=byteToString(digest);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(sha1Str != null && sha1Str.equals(signature)){
			result=true;
		}
		return result;
	}

	//byte数组转String
	public static String byteToString(byte[] digest){
		StringBuffer buffer=new StringBuffer();
		String shaHex="";
		for (int i = 0; i < digest.length; i++) {
			shaHex=Integer.toHexString(digest[i]&0xFF);
			if(shaHex.length()<2){
				buffer.append(0);
			}
			buffer.append(shaHex);
		}
		return buffer.toString();
	}
}
