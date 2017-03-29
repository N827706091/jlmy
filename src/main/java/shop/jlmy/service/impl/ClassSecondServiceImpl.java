package shop.jlmy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;
import shop.jlmy.dao.ClassSecondDao;
import shop.jlmy.entity.ClassFirst;
import shop.jlmy.entity.ClassSecond;
import shop.jlmy.dto.Page;
import shop.jlmy.service.ClassSecondService;

@Service
public class ClassSecondServiceImpl implements ClassSecondService {

	@Autowired
	private ClassSecondDao classSecondDao;
	
	@Override
	public boolean add_ClassSecond(ClassSecond classSecond,int classFirst_id) {
		ClassFirst classFirst=new ClassFirst();
		classFirst.setId(classFirst_id);
		classSecond.setClassFirst(classFirst);
		return classSecondDao.add_ClassSecond(classSecond);
	}

	@Override
	public boolean delete_ClassSecond(int id) {
		ClassSecond classSecond=new ClassSecond();
		classSecond.setId(id);
		return classSecondDao.delete_ClassSecond(classSecond);
	}

	@Override
	public boolean update_ClassSecond(ClassSecond classSecond) {
		return classSecondDao.update_ClassSecond(classSecond);
	}

	@Override
	public ClassSecond select_ClassSecond(int id) {
		return classSecondDao.select_ClassSecond(id);
	}

	@Override
	public ClassSecond select_ClassSecond(String className) {
		return classSecondDao.select_ClassSecond(className);
	}

	@Override
	public Page page_ClassSecond(Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete_ClassSecond(ClassSecond classSecond) {
		return classSecondDao.delete_ClassSecond(classSecond);
	}

	@Override
	public JSONObject getClassSecond_ALL() {
		List<ClassSecond> classSeconds=classSecondDao.getClassSecond_ALL();
		JSONObject classSecondIDAndNames=new JSONObject();
		for (ClassSecond classSecond : classSeconds) {
			classSecondIDAndNames.put(classSecond.getId(),classSecond.getClassName());
		}
		return classSecondIDAndNames;
	}
}