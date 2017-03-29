package shop.jlmy.service;

import net.sf.json.JSONObject;
import shop.jlmy.entity.ClassSecond;
import shop.jlmy.dto.Page;

public interface ClassSecondService {
	boolean add_ClassSecond(ClassSecond classSecond,int classFirst_id);
	boolean delete_ClassSecond(int id);
	boolean delete_ClassSecond(ClassSecond classSecond);
	boolean update_ClassSecond(ClassSecond classSecond);
	ClassSecond select_ClassSecond(int id);
	ClassSecond select_ClassSecond(String className);
	Page page_ClassSecond(Page page);
	JSONObject getClassSecond_ALL();
}
