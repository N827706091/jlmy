package shop.jlmy.service.impl;

import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;
import shop.jlmy.service.WxService;
import shop.jlmy.wx.WxParam;
import shop.jlmy.wx.WxUtil;

@Service
public class WxServiceImpl implements WxService {

	WxParam param=new WxParam();

	@Override
	public JSONObject getAccessToken() {
		String url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
		url=url.replace("APPID", param.getAppid()).replace("APPSECRET", param.getSecret());
		return JSONObject.fromObject(WxUtil.getOrSendRequestData(url, "GET", null));
	}

	@Override
	public String userAuthorize() {
		String url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect";
		url=url.replace("APPID", param.getAppid())
		   .replace("REDIRECT_URI", "http://www.jlmy.shop/Wx/getWxUserInfo.do")
		   .replace("SCOPE", "snsapi_userinfo")
		   .replace("STATE", "1");
		return url;
	}

	@Override
	public JSONObject getWxUserInfo(String code,String state) {
		//获取网页授权获取用户信息的accessToken,并非普通调用接口的accessToken
		String url="https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
		url=url.replace("APPID", param.getAppid())
				.replace("SECRET", param.getSecret())
				.replace("CODE", code);
		JSONObject authAccessToken=JSONObject.fromObject(WxUtil.getOrSendRequestData(url, "GET", null));
		System.out.println(authAccessToken.getString("access_token"));
		System.out.println(authAccessToken.getString("openid"));
		//网页获取用户信息接口
		String url_="https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
		url_=url_.replace("ACCESS_TOKEN", authAccessToken.getString("access_token"))
				 .replace("OPENID", authAccessToken.getString("openid"));
		return JSONObject.fromObject(WxUtil.getOrSendRequestData(url_, "GET", null));
	} 
}
