package shop.jlmy.wx;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.SortedMap;
import javax.servlet.http.HttpServletRequest;

import shop.jlmy.utils.MD5Util;

public class WeiXinPayUtil {
	public static final String key="pimaofan940416201610141507WeiXin";
	
	//微信支付签名
	@SuppressWarnings("rawtypes")
	public static String createSign(String characterEncoding,SortedMap<Object,Object> parameters){  
        StringBuffer sb = new StringBuffer();  
        Set es = parameters.entrySet();//所有参与传参的参数按照accsii排序（升序）  
        Iterator it = es.iterator();  
        while(it.hasNext()) {  
            Map.Entry entry = (Map.Entry)it.next();  
            String k = (String)entry.getKey();  
            Object v = entry.getValue();  
            if(null != v && !"".equals(v)   
                    && !"sign".equals(k) && !"key".equals(k)) {
                sb.append(k + "=" + v + "&");
            }
        }
        sb.append("key=" + key);
        String sign = MD5Util.MD5Encode(sb.toString(), characterEncoding).toUpperCase();
        return sign;  
    }
	
	//产生一个随机的字符串
	public static String getRandomStringByLength(int length) {
		String base = "abcdefghijklmnopqrstuvwxyz0123456789";  
	    Random random = new Random();  
	    StringBuffer sb = new StringBuffer();  
	    for (int i = 0; i < length; i++) {  
	    	int number = random.nextInt(base.length());
	        sb.append(base.charAt(number));  
	    }  
	    return sb.toString();  
	}
	
	//创建商户订单号
	public static String createCompanyOrderNumber(){
		String base = "0123456789";  
	    Random random = new Random();  
	    StringBuffer sb = new StringBuffer();  
	    for (int i = 0; i < 8; i++) {  
	    	int number = random.nextInt(base.length());
	        sb.append(base.charAt(number));  
	    }
	    long dateNumber=new Date().getTime();
		SimpleDateFormat sdf=new SimpleDateFormat("yyMMddHHmmss");
		return sdf.format(dateNumber)+sb.toString();
	}
	
	//获取用户终端真实IP地址
	public static String getIpAddr(HttpServletRequest request) {    
	    String ip = request.getHeader("x-forwarded-for");    
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {    
	        ip = request.getHeader("Proxy-Client-IP");    
	    }    
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {    
	        ip = request.getHeader("WL-Proxy-Client-IP");    
	    }    
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {    
	        ip = request.getRemoteAddr();    
	    }    
	    return ip;
	}
	
	//前端支付金额验证
	public static float verMoney(String money) {
		float realMoney=0.00f;
		switch (money) {
			case "money28.5":realMoney=2850f;break;
			case "money47.5":realMoney=4750f;break;
			case "money95":realMoney=9500f;break;
			case "money285":realMoney=28500f;break;
			case "money26.4":realMoney=2640f;break;
			case "money44":realMoney=4400f;break;
			case "money88":realMoney=8800f;break;
			case "money264":realMoney=26400f;break;
			case "money30":realMoney=3000f;break;
			case "money50":realMoney=5000f;break;
			case "money100":realMoney=10000f;break;
			case "money300":realMoney=30000f;break;
			case "money188":realMoney=18800f;break;
			case "money288":realMoney=28800f;break;
			default:realMoney=1010f;break;
		}
		return realMoney;
	}
}
