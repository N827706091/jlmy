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
		   .replace("REDIRECT_URI", "http:/www.jlmy.shop/jlmy/getUserInfo.do")
		   .replace("SCOPE", "snsapi_userinfo")
		   .replace("state", "1");
		return url;
	} 
}
