package shop.jlmy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import shop.jlmy.dao.ClassFirstDao;
import shop.jlmy.entity.ClassFirst;
import shop.jlmy.service.ClassFirstService;

@Service
public class ClassFirstServiceImpl implements ClassFirstService {

	@Autowired
	private ClassFirstDao classFirstDao;

	@Override
	public boolean add_ClassFirst(ClassFirst classFirst) {
		System.out.println("12312312");
		return classFirstDao.add_ClassFirst(classFirst);
	}

	@Override
	public boolean delete_ClassFirst(int id) {
		//ClassFirst classFirst=new ClassFirst();
		//classFirst.setId(id);
		return classFirstDao.delete_ClassFirst(id);
	}

	@Override
	public ClassFirst select_ClassFirst(int id) {
		return classFirstDao.select_ClassFirst(id);
	}

	@Override
	public ClassFirst select_ClassFirst(String className) {
		return classFirstDao.select_ClassFirst(className);
	}

	@Override
	public boolean update_ClassFirst(ClassFirst classFirst) {
		return classFirstDao.update_ClassFirst(classFirst);
	}

	@Override
	public JSONArray getClass_ALL() {
		List<ClassFirst> classFirsts=classFirstDao.getClass_ALL();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.setExcludes(new String[]{"classFirst","goods"});
//		JSONArray classJson=JSONArray.fromObject(classFirsts, jsonConfig);
	//	System.out.println(classJson.toString());
		return JSONArray.fromObject(classFirsts, jsonConfig);
	}

}
