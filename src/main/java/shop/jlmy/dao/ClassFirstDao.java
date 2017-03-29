package shop.jlmy.dao;

import java.util.List;

import shop.jlmy.entity.ClassFirst;

public interface ClassFirstDao {
	boolean add_ClassFirst(ClassFirst classFirst);
	boolean delete_ClassFirst(int id);
	ClassFirst select_ClassFirst(int id);
	ClassFirst select_ClassFirst(String className);
	boolean update_ClassFirst(ClassFirst classFirst);
	List<ClassFirst> getClass_ALL();
}
