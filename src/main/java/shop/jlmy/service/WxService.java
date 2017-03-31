package shop.jlmy.service;

import net.sf.json.JSONObject;

public interface WxService {
	JSONObject getAccessToken();
	/*
	 * 网页获取用户信息
	 */
	String userAuthorize();
	JSONObject getWxUserInfo(String code,String state);
}
