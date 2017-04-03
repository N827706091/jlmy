package shop.jlmy.dao.impl;

import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import shop.jlmy.dao.FavoritesDao;
import shop.jlmy.dto.Page;
import shop.jlmy.entity.Favorites;

@Repository
@Transactional
public class FavoritesDaoImpl implements FavoritesDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	//获取用户收藏夹数据
	@Override
	public Page selectFavorites(Page page,String openId) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, Favorites.class);
		criteria.add(Restrictions.eq("openId", openId));
		//获取数据总数
		page.setTotal(HibernateUtils.get_Data_Count(criteria));
		criteria.setFirstResult((page.getPageNow()-1)*page.getPageSize());
		criteria.setMaxResults(page.getPageSize());
		page.setList(criteria.list());
		return page;
	}

	//获取收藏夹物品总数
	@Override
	public Integer FavoritesCount(String openId) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, Favorites.class);
		//获取数据总数
		return HibernateUtils.get_Data_Count(criteria);
	}

	//添加物品进收藏夹
	@Override
	public void addFavorites(Favorites favorites) throws Exception {
		hibernateTemplate.save(favorites);
	}

	//删除收藏夹物品
	@Override
	public void deleteFavoriters(Favorites favorites) throws Exception {
		hibernateTemplate.delete(favorites);
	}
}