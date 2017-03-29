package shop.jlmy.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate4.HibernateTemplate;

//简化Hibernate操作步奏
public class HibernateUtils {

	//获取session
	public static Session getSession(HibernateTemplate hibernateTemplate){
		return hibernateTemplate.getSessionFactory().getCurrentSession();
	}
	//获取Criteria查询对象
	public static Criteria getCriteria(HibernateTemplate hibernateTemplate,Class<?> entityName){
		return getSession(hibernateTemplate).createCriteria(entityName);
	}
	//数据总条数
	public static int get_Data_Count(Criteria criteria){
		return Integer.valueOf(String.valueOf(criteria.setProjection(Projections.rowCount()).uniqueResult()));
	}
}