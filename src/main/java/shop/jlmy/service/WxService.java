package shop.jlmy.service;

import net.sf.json.JSONObject;

public interface WxService {
	JSONObject getAccessToken();
	String userAuthorize();
}
