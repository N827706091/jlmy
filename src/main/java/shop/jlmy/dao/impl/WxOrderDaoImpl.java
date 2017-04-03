package shop.jlmy.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import shop.jlmy.dao.WxOrderDao;
import shop.jlmy.dto.Page;
import shop.jlmy.entity.WxOrder;

@Repository
@Transactional
public class WxOrderDaoImpl implements WxOrderDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	//添加订单
	@Override
	public void addWxOrder(WxOrder wxOrder) throws Exception {
		hibernateTemplate.save(wxOrder);
	}

	//删除订单
	@Override
	public void deleteWxOrder(WxOrder wxOrder) throws Exception {
		hibernateTemplate.delete(wxOrder);
	}

	//修改订单信息
	@Override
	public void updateWxOrder(WxOrder wxOrder) throws Exception {
		hibernateTemplate.update(wxOrder);
	}

	//修改订单状态
	@Override
	public Integer updateWxOrderState(Integer state,Integer orderId) {
		String hql="update WxOrder wo set wo.state=:state where wo.id=:id";
		Query query=HibernateUtils.getSession(hibernateTemplate).createQuery(hql);
		Integer result=query.setInteger("state", state)
			 .setInteger("id", orderId)
			 .executeUpdate();
		return result;
	}

	//分页查询
	@Override
	public Page wxOrderPage(Page page, String openId,Integer state) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, WxOrder.class);
		criteria.add(Restrictions.eq("openId", openId));
		/*
		 * @param (state)
		 * 1：已下单，待支付
		 * 2：已下单，已支付，待发货
		 * 3：已发货
		 * 4：已收货，已完成
		 * 5：退货中
		 * 6：退款完成，已完成
		 */
		if (0!=state) {
			criteria.add(Restrictions.eq("state", state));
		}
		page.setTotal(HibernateUtils.get_Data_Count(criteria));
		criteria.setProjection(null);
		criteria.setFirstResult((page.getPageNow()-1)*page.getPageSize());
		criteria.setMaxResults(page.getPageSize());
		page.setList(criteria.list());
		return page;
	}

}