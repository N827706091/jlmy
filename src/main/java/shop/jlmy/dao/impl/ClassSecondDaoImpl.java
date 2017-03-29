package shop.jlmy.dao.impl;

import java.util.List;

import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import shop.jlmy.dao.ClassSecondDao;
import shop.jlmy.entity.ClassSecond;
import shop.jlmy.dto.Page;

@Repository
@Transactional
public class ClassSecondDaoImpl implements ClassSecondDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public boolean add_ClassSecond(ClassSecond classSecond) {
		try {
			hibernateTemplate.save(classSecond);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete_ClassSecond(int id) {
		try {
			int result=HibernateUtils.getSession(hibernateTemplate)
					.createQuery("delete from ClassSecond where id=:id")
					.setParameter("id", id)
					.executeUpdate();
			System.out.println(result);
			if (0==result) {
				return false;
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete_ClassSecond(ClassSecond classSecond) {
		try {
			classSecond=hibernateTemplate.get(ClassSecond.class, classSecond.getId());
			if (null!=classSecond) {
				hibernateTemplate.delete(classSecond);
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update_ClassSecond(ClassSecond classSecond) {
		try {
			hibernateTemplate.update(classSecond);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public ClassSecond select_ClassSecond(int id) {
		return hibernateTemplate.get(ClassSecond.class, id);
	}

	@Override
	public ClassSecond select_ClassSecond(String className) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, ClassSecond.class);
		criteria.add(Restrictions.eq("className", className));
		return (ClassSecond) criteria.uniqueResult();
	}

	@Override
	public Page page_ClassSecond(Page page) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, ClassSecond.class);
		page.setTotal(HibernateUtils.get_Data_Count(criteria));
		criteria.setProjection(null);
		page.setList(criteria.list());
		return page;
	}
	
	@Override
	public List<ClassSecond> getClassSecond_ALL(){
		//String hql="select cs.id,cs.className ClassSecond cs";
		@SuppressWarnings("unchecked")
		List<ClassSecond> classSeconds= (List<ClassSecond>) hibernateTemplate.find("from ClassSecond");
		return classSeconds;
	}
}
