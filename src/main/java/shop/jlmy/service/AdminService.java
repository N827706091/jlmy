package shop.jlmy.service;

import shop.jlmy.entity.Admin;
import shop.jlmy.dto.Page;

public interface AdminService {
	boolean ver_Admin_Login(String adminName,String password);
	int add_Admin(Admin admin);
	boolean ver_Admin_Identity(String adminName);
	Page page_Admin(Page page);
}
