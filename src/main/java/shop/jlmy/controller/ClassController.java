package shop.jlmy.controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import shop.jlmy.entity.ClassFirst;
import shop.jlmy.entity.ClassSecond;
import shop.jlmy.service.ClassFirstService;
import shop.jlmy.service.ClassSecondService;

@Controller
@RequestMapping("/Class")
public class ClassController {
	@Autowired
	private ClassFirstService classFirstService;

	@Autowired
	private ClassSecondService classSecondService;

	@RequestMapping("/getClassSecond_ALL")
	@ResponseBody
	public JSONObject getClassSecond_ALL(){
		JSONObject jsonObject=classSecondService.getClassSecond_ALL();
		System.out.println(jsonObject.toString());
		return jsonObject;
	}

	@RequestMapping("/getClass")
	@ResponseBody
	public JSONArray getClass_ALL(){
		return classFirstService.getClass_ALL();
	}

	@RequestMapping("/addClassFirst")
	@ResponseBody
	public boolean addClassFirst(ClassFirst classFirst){
		return classFirstService.add_ClassFirst(classFirst);
	}

	@RequestMapping("/addClassSecond")
	@ResponseBody
	public boolean addClassSecond(ClassSecond classSecond,int classFirst_id){
		return classSecondService.add_ClassSecond(classSecond,classFirst_id);
	}

	@RequestMapping("/deleteClassFirst")
	@ResponseBody
	public boolean deleteClassFirst(int id){
		return classFirstService.delete_ClassFirst(id);
	}

	@RequestMapping("/deleteClassSecond")
	@ResponseBody
	public boolean deleteClassSecond(int id){
		return classSecondService.delete_ClassSecond(id);
	}
}
