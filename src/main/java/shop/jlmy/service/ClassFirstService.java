package shop.jlmy.service;

import java.util.List;

import net.sf.json.JSONArray;
import shop.jlmy.entity.ClassFirst;

public interface ClassFirstService {
	boolean add_ClassFirst(ClassFirst classFirst);
	boolean delete_ClassFirst(int id);
	ClassFirst select_ClassFirst(int id);
	ClassFirst select_ClassFirst(String className);
	boolean update_ClassFirst(ClassFirst classFirst);
	JSONArray getClass_ALL();
}
