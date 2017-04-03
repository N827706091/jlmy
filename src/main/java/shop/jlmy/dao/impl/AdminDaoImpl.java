package shop.jlmy.dao.impl;

import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import shop.jlmy.dao.AdminDao;
import shop.jlmy.entity.Admin;
import shop.jlmy.dto.Page;

@Repository
@Transactional
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public boolean ver_Admin_Login(String adminName, String password) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, Admin.class);
		criteria.add(Restrictions.eq("adminName", adminName))
				.add(Restrictions.eq("password", password));
		if (0!=HibernateUtils.get_Data_Count(criteria)) {
			criteria.setProjection(null);
			return true;
		}
		return false;
	}

	@Override
	public boolean add_Admin(Admin admin) {
		try {
			//新增
			hibernateTemplate.save(admin);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean ver_Admin_Name(String adminName) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, Admin.class);
		criteria.add(Restrictions.eq("adminName", adminName));
		if(0==HibernateUtils.get_Data_Count(criteria)){
			criteria.setProjection(null);
			return true;
		};
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page page_Admin(Page page) {
		//获取Criteria查询对象
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, Admin.class);
		//获取数据总条数
		page.setTotal(HibernateUtils.get_Data_Count(criteria));
		criteria.setProjection(null);
		criteria.setFirstResult((page.getPageNow()-1)*page.getPageSize());
		criteria.setMaxResults(page.getPageSize());
		page.setList(criteria.list());
		//防止密码泄露，将Password字段循环设置为空
		for (Admin admin : (List<Admin>)page.getList()) {
			admin.setPassword("");
		}
		System.out.println(page);
		return page;
	}
}