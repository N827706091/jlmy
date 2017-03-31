package shop.jlmy.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import net.sf.json.JSONObject;
import shop.jlmy.entity.Good;
import shop.jlmy.entity.GoodColours;
import shop.jlmy.dto.Page;
import shop.jlmy.service.GoodService;
import shop.jlmy.utils.FileUpload;

@Controller
@RequestMapping("/Goods")
public class GoodsController extends FileUpload{

	@Autowired
	private GoodService goodService;

	@RequestMapping("/FileUpload")
	@ResponseBody
	public String uploadHeadPic(@RequestParam("file")MultipartFile file,HttpServletRequest request,int togo,
			String goodName,String colourValue){
		try {
			String path=null;
			if (0==togo) {
				path="G:/JLMY_Images/"+goodName+"/z/"+colourValue;
			}else if (1==togo) {
				path="G:/JLMY_Images/"+goodName+"/x";
			}
			super.upload(file, path,request);
			String fileName=super.getFileName();
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("fileName", fileName);
			return jsonObject.toString();
			//response.getWriter().print(fileName);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping("/addGood")
	@ResponseBody
	public boolean addGood(Good good,String colourValues,int ClassSecond_id){
		System.out.println(ClassSecond_id);
		return goodService.add_Good(good,colourValues,ClassSecond_id);
	}

	@RequestMapping("/updateGood")
	@ResponseBody
	public boolean updateGood(Good good,String old_goodName,String colourValues,int ClassSecond_id){
		//System.out.println("goodID="+good.getId());
		//System.out.println("old_goodName="+old_goodName);
		//System.out.println("colourValues="+colourValues);
		//System.out.println("ClassSecondID="+ClassSecond_id);
		return goodService.updateGood(good, old_goodName, colourValues, ClassSecond_id);
	}

	@RequestMapping("/getGoodBrands")
	@ResponseBody
	public List<String> getGoodBrands(){
		List<String> list=goodService.select_Good_Brand();
		System.out.println(list.toString());	
		return list;
	}

	@RequestMapping("/getGoodID")
	@ResponseBody
	public JSONObject getGood(int id){
		return goodService.select_Good(id);
	}

	//获取目录下所有的图片名称
	@RequestMapping("/getGoodColours")
	@ResponseBody
	public List<String> getGoodColours(String goodName,String colourName){
		System.out.println("goodName="+goodName);
		System.out.println("colourName="+colourName);
		return goodService.getGoodColours(goodName, colourName);
	}

	@RequestMapping("/getGoodColour")
	@ResponseBody
	public String getGoodColour(String goodName,String colourName){
		List<String> goodColours=goodService.getGoodColours(goodName, colourName);
		return goodColours.get(0);
	}

	//获取详情图片
	@RequestMapping("/getDetailImages")
	@ResponseBody
	public List<String> getDetailImages(String goodName){
		return goodService.getDetailImages(goodName);
	}

	@RequestMapping("/deleteGoodImage")
	@ResponseBody
	public boolean deleteFile(String path,String fileName){
		System.out.println(path+" --- "+fileName);
		return goodService.deleteFile(path, fileName);
	}

	@RequestMapping("/updateColourDir")
	@ResponseBody
	public boolean updateColourDir(String goodName,int id,String oldValue,String newValue){
		return goodService.updateColourDir(goodName, id,oldValue, newValue);
	}

	@RequestMapping("/deleteColour")
	@ResponseBody
	public int deleteColour(String goodName,GoodColours goodColours){
		return goodService.deleteColour(goodName, goodColours);
	}

	/*
	 * 前台商品分页查询
	 */
	@RequestMapping("/frontLoadGoods")
	@ResponseBody
	public Page frontLoadGoods(Page page,int orderBy,String goodName){
		return goodService.frontLoadGoods(page, orderBy, goodName);
	}

	/*
	 * 后台商品管理分页查询
	 */
	@RequestMapping("/getGoodCondition.do")
	@ResponseBody
	public JSONObject goodPage(Page page,String goodName,int classSecondID){
		return goodService.goodPage(page, goodName, classSecondID);
	}
}
