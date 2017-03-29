package shop.jlmy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shop.jlmy.dao.AdminDao;
import shop.jlmy.entity.Admin;
import shop.jlmy.dto.Page;
import shop.jlmy.service.AdminService;
import shop.jlmy.utils.MD5Util;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao adminDao;

	@Override
	public boolean ver_Admin_Login(String adminName, String password) {
		String password_MD5=MD5Util.MD5Encode(password, "UTF-8");
		return adminDao.ver_Admin_Login(adminName, password_MD5);
	}
	
	@Override
	//超级管理员身份验证
	public boolean ver_Admin_Identity(String adminName){
		if ("admin".equals(adminName)) {
			return true;
		}
		return false;
	}

	@Override
	//return 0:添加失败	1:添加成功	2:已存在该管理员
	public int add_Admin(Admin admin) {
		if (adminDao.ver_Admin_Name(admin.getAdminName())) {
			admin.setPassword(MD5Util.MD5Encode(admin.getPassword(), "UTF-8"));
			if (adminDao.add_Admin(admin)) {
				return 1;
			}
			return 0;
		}else{
			return 2;
		}
		
	}

	@Override
	public Page page_Admin(Page page) {
		return adminDao.page_Admin(page);
	}

}
