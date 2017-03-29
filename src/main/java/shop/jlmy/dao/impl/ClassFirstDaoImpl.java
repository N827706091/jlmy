package shop.jlmy.dao.impl;

import java.util.List;
import java.util.Set;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import shop.jlmy.dao.ClassFirstDao;
import shop.jlmy.entity.ClassFirst;
import shop.jlmy.entity.ClassSecond;

@Repository
@Transactional
public class ClassFirstDaoImpl implements ClassFirstDao{
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public boolean add_ClassFirst(ClassFirst classFirst) {
		try {
			hibernateTemplate.save(classFirst);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean delete_ClassFirst(int id) {
		try {
			ClassFirst classFirst=hibernateTemplate.get(ClassFirst.class, id);
			if (null!=classFirst) {
				Set<ClassSecond> set=classFirst.getClassSeconds();
				for (ClassSecond classSecond : set) {
					hibernateTemplate.delete(classSecond);
				}
				hibernateTemplate.delete(classFirst);
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public ClassFirst select_ClassFirst(int id) {
		return hibernateTemplate.get(ClassFirst.class, id);
	}

	@Override
	public ClassFirst select_ClassFirst(String className) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, ClassFirst.class);
		criteria.add(Restrictions.eq("className", className));
		return (ClassFirst) criteria.uniqueResult();
	}

	@Override
	public boolean update_ClassFirst(ClassFirst classFirst) {
		try {
			hibernateTemplate.update(classFirst);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ClassFirst> getClass_ALL() {
		return (List<ClassFirst>) hibernateTemplate.find("from ClassFirst");
	}
}
