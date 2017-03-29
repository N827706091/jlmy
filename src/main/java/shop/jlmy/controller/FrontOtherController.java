package shop.jlmy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.jlmy.dto.NavImage;
import shop.jlmy.entity.IndexHrefInfo;
import shop.jlmy.service.FrontOtherService;

@Controller
@RequestMapping("/frontOther")
public class FrontOtherController {

	@Autowired
	private FrontOtherService frontOtherService;

	@RequestMapping("/getNavImage")
	@ResponseBody
	public List<IndexHrefInfo> getNavImage(int areaID){
		return frontOtherService.getNavImage(areaID);
	}
}
