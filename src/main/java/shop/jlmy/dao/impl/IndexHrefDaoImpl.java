package shop.jlmy.dao.impl;

import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import shop.jlmy.dao.IndexHrefDao;
import shop.jlmy.entity.IndexHrefInfo;

@Repository
@Transactional
public class IndexHrefDaoImpl implements IndexHrefDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IndexHrefInfo> getNavImage(int areaID) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, IndexHrefInfo.class);
		//区域ID等于指定值
		criteria.add(Restrictions.eq("areaID", areaID));
		return criteria.list();
	}

}
