package shop.jlmy.dao;

import shop.jlmy.dto.Page;
import shop.jlmy.entity.Favorites;

public interface FavoritesDao {
	void addFavorites(Favorites favorites) throws Exception;
	void deleteFavoriters(Favorites favorites) throws Exception;
	Page selectFavorites(Page page,String openId);
	Integer FavoritesCount(String openId);
}
