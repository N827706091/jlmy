package shop.jlmy.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import shop.jlmy.dao.GoodDao;
import shop.jlmy.entity.Good;
import shop.jlmy.entity.GoodColours;
import shop.jlmy.dto.Page;

@Repository
@Transactional
public class GoodDaoImpl implements GoodDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public boolean add_Good(Good good) {
		try {
			hibernateTemplate.save(good);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Good select_Good(int id) {
		return hibernateTemplate.get(Good.class, id);
	}

	@Override
	public boolean delete_Good(int id) {
		try {
			Good good=hibernateTemplate.get(Good.class, id);
			Set<GoodColours> goodColours=good.getGoodColours();
			for (GoodColours goodColour : goodColours) {
				hibernateTemplate.delete(goodColour);
			}
			hibernateTemplate.delete(good);
			return true;
		} catch (Exception e) { 
			e.printStackTrace();
			System.out.println("ccc");
			return false;
		}
	}

	@Override
	public boolean delete_Good_Colour(int good_id,int goodColour_id) {
		try {
			String hql="delete GoodColours where Good_id=:good_id and id=:id";
			Query query=HibernateUtils.getSession(hibernateTemplate).createQuery(hql);
			query.setParameter("good_id", good_id)
				 .setParameter("id", goodColour_id)
				 .executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<String> select_Good_Brand() {
		@SuppressWarnings("unchecked")
		List<String> brands=(List<String>) hibernateTemplate.find("select g.brand from Good g where g.brand!=null group by g.brand");
		return brands;
	}

//	@SuppressWarnings("unchecked")
//	@Override
//	public Page goodPage(Page page, String goodName, int classSecondID,int orderBy) {
//		System.out.println("goodName="+goodName+" -classSecondID="+classSecondID+" -orderBy="+orderBy);
//		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, Good.class);
//		if (!"".equals(goodName)) {
//			System.out.println("goodName="+goodName);
//			criteria.add(Restrictions.like("goodName", "%"+goodName+"%"));
//		}
//		if (0!=classSecondID) {
//			System.out.println("c");
//			//关联查询
//			criteria.createAlias("classSecond", "cs").add(Restrictions.eq("cs.id", classSecondID));
//		}
//		/*
//		 * 1:销量由高到低
//		 * 2:销量由低到高
//		 * 3:价格由低到高
//		 * 4:价格由高到低
//		 */
//		if (0!=orderBy) {
//			System.out.println("o");
//			switch (orderBy) {
//				case 1:criteria.addOrder(Order.desc("hot"));break;
//				case 2:criteria.addOrder(Order.asc("hot"));break;
//				case 3:criteria.addOrder(Order.asc("price"));break;
//				case 4:criteria.addOrder(Order.desc("price"));break;
//				default:break;
//			}
//		}
//		page.setTotal(HibernateUtils.get_Data_Count(criteria));
//		criteria.setProjection(null);
//		/*
//		 * 要注意的是，如果在createAlias()之后，又使用了setProjection(如查询总记录数)，这样得到的查询结果集中，
//		 * 每个对象 并不是Parent类型，而是一个对象数组(Object[])，里边有一个Parent对象和一个Child对象，需要根据object的类名去判断是 哪个对象。
//		 * 如果还要恢复默认的结果集状态，需调用criteria.setResultTransformer(Criteria.ROOT_ENTITY);
//		 * 因为使用了createAlias ，所以必须使用此方法恢复默认的结果集（.list()方法的结果）
//		 **/
//		criteria.setResultTransformer(Criteria.ROOT_ENTITY);
//		//criteria.createAlias("goodColours", "gc",CriteriaSpecification.LEFT_JOIN);
//		//criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
//		criteria.createAlias("goodColours", "gc", CriteriaSpecification.FULL_JOIN);//左外连接    
//		criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);//根据主表去重复数据 
//		System.out.println("pageNow="+page.getPageNow()+" -pageSize="+page.getPageSize());
//		
//		criteria.setFirstResult((page.getPageNow()-1)*page.getPageSize());
//		criteria.setMaxResults(page.getPageSize());
//		
//		List<Good> list=criteria.list();
//		System.out.println(list.size());
//		Set<Good> set = new LinkedHashSet<Good>();  
//        //如果无需排序的话，可以用HashSet  
//        //Set<Integer> set = new HashSet<Integer>();  
//        set.addAll(list);  
//        System.out.println(set.size());
//        Iterator<Good> it = set.iterator();
//        List<Good> goods=new ArrayList<>();
//        int i=0;
//        while (it.hasNext()) {  
//        	System.out.println(i);
//        	goods.add(it.next());
//        	i++;
//        }
//        page.setList(goods);
//		return page;
//	}

	@Override
	public Page goodPage(Page page, String goodName, int classSecondID,int orderBy) {
		System.out.println("goodName="+goodName+" -classSecondID="+classSecondID+" -orderBy="+orderBy);
		//.setFetchMode("goodColours",FetchMode.SELECT); 关联关系去重
		Criteria criteria=hibernateTemplate.getSessionFactory().getCurrentSession().createCriteria(Good.class).setFetchMode("goodColours",FetchMode.SELECT);
		if (!"".equals(goodName)) {
			criteria.add(Restrictions.like("goodName", "%"+goodName+"%"));
		}
		if (0!=classSecondID) {
			//关联查询
			criteria.createAlias("classSecond", "cs").add(Restrictions.eq("cs.id", classSecondID));
		}
		/*
		 * 1:销量由高到低
		 * 2:销量由低到高
		 * 3:价格由低到高
		 * 4:价格由高到低
		 */
		if (0!=orderBy) {
			System.out.println("o");
			switch (orderBy) {
				case 1:criteria.addOrder(Order.desc("hot"));break;
				case 2:criteria.addOrder(Order.asc("hot"));break;
				case 3:criteria.addOrder(Order.asc("price"));break;
				case 4:criteria.addOrder(Order.desc("price"));break;
				default:break;
			}
		}
		page.setTotal(HibernateUtils.get_Data_Count(criteria));
		criteria.setProjection(null);
		/*
		 * 要注意的是，如果在createAlias()之后，又使用了setProjection(如查询总记录数)，这样得到的查询结果集中，
		 * 每个对象 并不是Parent类型，而是一个对象数组(Object[])，里边有一个Parent对象和一个Child对象，需要根据object的类名去判断是 哪个对象。
		 * 如果还要恢复默认的结果集状态，需调用criteria.setResultTransformer(Criteria.ROOT_ENTITY);
		 * 因为使用了createAlias ，所以必须使用此方法恢复默认的结果集（.list()方法的结果）
		 **/
		criteria.setResultTransformer(Criteria.ROOT_ENTITY);
		/* 
		 * 一对多链接查询时去除重复对象，根据主表去重复数据
		 */
		criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY); 
		criteria.setFirstResult((page.getPageNow()-1)*page.getPageSize());
		criteria.setMaxResults(page.getPageSize());
        page.setList(criteria.list());
		return page;
	}
	@Override
	public boolean delete_Good_Colour(int id) {
		String hql="delete GoodColours gc where gc.id=:id";
		Query query=HibernateUtils.getSession(hibernateTemplate).createQuery(hql);
		int result=query.setInteger("id", id)
						.executeUpdate();
		if (0==result) {
			return false;
		}else {
			return true;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<GoodColours> goodColours(int goodID) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, GoodColours.class);
		criteria.createAlias("good", "g").add(Restrictions.eq("g.id", goodID));
		Set<GoodColours> goodColoursSet=new LinkedHashSet<GoodColours>();
        //如果无需排序的话，可以用HashSet  
        //Set<Integer> set = new HashSet<Integer>();  
        goodColoursSet.addAll(criteria.list());
		return goodColoursSet;
	}

	@Override
	public boolean updateGood(Good good) {
		try {
			hibernateTemplate.update(good);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateColour(int id, String colourName) {
		String hql="update GoodColours gc set gc.colourName=:colourName where gc.id=:id";
		int result=HibernateUtils.getSession(hibernateTemplate).createQuery(hql)
				.setString("colourName", colourName)
				.setInteger("id", id)
				.executeUpdate();
		if (result==0) {
			return false;
		}
		return true;
	}

	//前台
//	@Override
//	public Page getGoods(Page page, int orderBy) {
//		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, Good.class);
//		if (1==orderBy) {
//			criteria.addOrder(Order.desc(""))
//		}
//		if (!"".equals(goodName)) {
//			System.out.println("goodName="+goodName);
//			criteria.add(Restrictions.like("goodName", "%"+goodName+"%"));
//		}
//		if (0!=classSecondID) {
//			//关联查询
//			criteria.createAlias("classSecond", "cs").add(Restrictions.eq("cs.id", classSecondID));
//		}
//		page.setTotal(HibernateUtils.get_Data_Count(criteria));
//		criteria.setProjection(null);
//		criteria.setFirstResult((page.getPageNow()-1)*page.getPageSize());
//		criteria.setMaxResults(page.getPageSize());
//		/*
//		 * 要注意的是，如果在createAlias()之后，又使用了setProjection(如查询总记录数)，这样得到的查询结果集中，
//		 * 每个对象 并不是Parent类型，而是一个对象数组(Object[])，里边有一个Parent对象和一个Child对象，需要根据object的类名去判断是 哪个对象。
//		 * 如果还要恢复默认的结果集状态，需调用criteria.setResultTransformer(Criteria.ROOT_ENTITY);
//		 * 因为使用了createAlias ，所以必须使用此方法恢复默认的结果集（.list()方法的结果）
//		 **/
//		criteria.setResultTransformer(Criteria.ROOT_ENTITY);
//		Set<Good> set = new LinkedHashSet<Good>();  
//        //如果无需排序的话，可以用HashSet  
//        //Set<Integer> set = new HashSet<Integer>();  
//        set.addAll(criteria.list());  
//        Iterator<Good> it = set.iterator();
//        List<Good> goods=new ArrayList<>();
//        while (it.hasNext()) {  
//        	goods.add(it.next());
//        }
//        page.setList(goods);
//		return page;
//	}
}
