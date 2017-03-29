package shop.jlmy.dao;

import java.util.List;

import shop.jlmy.dto.Page;
import shop.jlmy.entity.ClassSecond;

public interface ClassSecondDao {
	boolean add_ClassSecond(ClassSecond classSecond);
	boolean delete_ClassSecond(int id);
	boolean delete_ClassSecond(ClassSecond classSecond);
	boolean update_ClassSecond(ClassSecond classSecond);
	ClassSecond select_ClassSecond(int id);
	ClassSecond select_ClassSecond(String className);
	Page page_ClassSecond(Page page);
	List<ClassSecond> getClassSecond_ALL();
}
