package shop.jlmy.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.Query;
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

	@SuppressWarnings("unchecked")
	@Override
	public Page goodPage(Page page, String goodName, int classSecondID) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, Good.class);
		if (!"".equals(goodName)) {
			System.out.println("goodName="+goodName);
			criteria.add(Restrictions.like("goodName", "%"+goodName+"%"));
		}
		if (0!=classSecondID) {
			//关联查询
			criteria.createAlias("classSecond", "cs").add(Restrictions.eq("cs.id", classSecondID));
		}
		page.setTotal(HibernateUtils.get_Data_Count(criteria));
		criteria.setProjection(null);
		criteria.setFirstResult((page.getPageNow()-1)*page.getPageSize());
		criteria.setMaxResults(page.getPageSize());
		/*
		 * 要注意的是，如果在createAlias()之后，又使用了setProjection(如查询总记录数)，这样得到的查询结果集中，
		 * 每个对象 并不是Parent类型，而是一个对象数组(Object[])，里边有一个Parent对象和一个Child对象，需要根据object的类名去判断是 哪个对象。
		 * 如果还要恢复默认的结果集状态，需调用criteria.setResultTransformer(Criteria.ROOT_ENTITY);
		 * 因为使用了createAlias ，所以必须使用此方法恢复默认的结果集（.list()方法的结果）
		 **/
		criteria.setResultTransformer(Criteria.ROOT_ENTITY);
		Set<Good> set = new LinkedHashSet<Good>();  
        //如果无需排序的话，可以用HashSet  
        //Set<Integer> set = new HashSet<Integer>();  
        set.addAll(criteria.list());  
        Iterator<Good> it = set.iterator();
        List<Good> goods=new ArrayList<>();
        while (it.hasNext()) {  
        	goods.add(it.next());
        }
        page.setList(goods);
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
}
