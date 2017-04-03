package shop.jlmy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.jlmy.dao.FavoritesDao;
import shop.jlmy.dto.Page;
import shop.jlmy.entity.Favorites;
import shop.jlmy.service.FavoritesService;

@Service
public class FavoritesServiceImpl implements FavoritesService{

	@Autowired
	private FavoritesDao favoritesDao;

	@Override
	public boolean addFavorites(Favorites favorites) throws Exception {
		try {
			favoritesDao.addFavorites(favorites);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteFavoriters(Favorites favorites) throws Exception {
		try {
			favoritesDao.deleteFavoriters(favorites);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Page selectFavorites(Page page, String openId) {
		return favoritesDao.selectFavorites(page, openId);
	}

	@Override
	public Integer FavoritesCount(String openId) {
		return favoritesDao.FavoritesCount(openId);
	}

}
