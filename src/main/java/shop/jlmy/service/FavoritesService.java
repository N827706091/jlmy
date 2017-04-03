package shop.jlmy.service;

import shop.jlmy.dto.Page;
import shop.jlmy.entity.Favorites;

public interface FavoritesService {
	boolean addFavorites(Favorites favorites) throws Exception;
	boolean deleteFavoriters(Favorites favorites) throws Exception;
	Page selectFavorites(Page page,String openId);
	Integer FavoritesCount(String openId);
}
