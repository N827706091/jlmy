package shop.jlmy.dao;

import shop.jlmy.entity.Admin;
import shop.jlmy.dto.Page;

public interface AdminDao {
	public boolean ver_Admin_Login(String adminName,String password);
	public boolean add_Admin(Admin admin);
	public boolean ver_Admin_Name(String adminName);
	public Page page_Admin(Page page);
}
