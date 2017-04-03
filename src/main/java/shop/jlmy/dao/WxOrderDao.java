package shop.jlmy.dao;

import shop.jlmy.dto.Page;
import shop.jlmy.entity.WxOrder;

public interface WxOrderDao {
	void addWxOrder(WxOrder wxOrder) throws Exception;
	void deleteWxOrder(WxOrder wxOrder) throws Exception;
	void updateWxOrder(WxOrder wxOrder) throws Exception;
	Integer updateWxOrderState(Integer state,Integer orderId);
	Page wxOrderPage(Page page,String openId,Integer state);
}