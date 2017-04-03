package shop.jlmy.dao;

import shop.jlmy.dto.Page;
import shop.jlmy.entity.ShopCart;

public interface ShopCartDao {
	void addShopCart(ShopCart shopCart) throws Exception;
	void deleteShopCart(ShopCart shopCart) throws Exception;
	Page ShopCartPage(Page page,String openId);
}
