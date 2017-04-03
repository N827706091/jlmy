package shop.jlmy.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import shop.jlmy.dao.ShopCartDao;
import shop.jlmy.dto.Page;
import shop.jlmy.entity.ShopCart;

@Repository
@Transactional
public class ShopCartDaoImpl implements ShopCartDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public void addShopCart(ShopCart shopCart) throws Exception {
		hibernateTemplate.save(shopCart);
	}

	@Override
	public void deleteShopCart(ShopCart shopCart) throws Exception {
		hibernateTemplate.delete(shopCart);
	}

	@Override
	public Page ShopCartPage(Page page, String openId) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, ShopCart.class);
		criteria.add(Restrictions.eq("openId", openId));
		//获取数据总条数
		page.setTotal(HibernateUtils.get_Data_Count(criteria));
		criteria.setProjection(null);
		criteria.setFirstResult((page.getPageNow()-1)*page.getPageSize());
		criteria.setMaxResults(page.getPageSize());
		page.setList(criteria.list());
		return page;
	}
}