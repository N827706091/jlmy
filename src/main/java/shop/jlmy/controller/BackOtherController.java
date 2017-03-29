package shop.jlmy.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.sf.json.JSONObject;
import shop.jlmy.dto.NavImage;
import shop.jlmy.dto.Page;
import shop.jlmy.entity.IndexHrefInfo;
import shop.jlmy.entity.VideoInfo;
import shop.jlmy.service.BackOtherService;

@Controller
@RequestMapping("/backOther")
public class BackOtherController {

	@Autowired
	private BackOtherService backOtherService;
	/*
	 * 			-----------------前台----------------------
	 */
	@RequestMapping("/loadJLMTData")
	@ResponseBody
	public Page loadJLMTData(Page page){
		return backOtherService.loadJLMTData(page);
	}

	@RequestMapping("/addjlmt")
	@ResponseBody
	public String addjlmt(@RequestParam("file")MultipartFile file,HttpServletRequest request){
		if (backOtherService.addjlmt(file, request)) {
			return "{}";
		}
		return "{\"error\":\"添加失败\"}";
	}

	@RequestMapping("/loadjlmt")
	@ResponseBody
	public Page loadjlmt(int orderBy,Page page){
		return backOtherService.loadjlmt(orderBy, page);
	}
	
	
	
	
	
	
	/*
	 * 			-----------------后台-----------------------
	 */
	@RequestMapping("addNavImage")
	@ResponseBody
	public String addNavImage(@RequestParam("file")MultipartFile file,HttpServletRequest request,int hrefType,String typeInfo){
		backOtherService.addNavImage(file, request, hrefType, typeInfo);
		return "{}";
	}
	

	@RequestMapping("/updateNavIcon")
	@ResponseBody
	public String updateNavIcon(@RequestParam("file")MultipartFile file,HttpServletRequest request,String iconName){
		//JSONObject jsonObject=new JSONObject();
		backOtherService.updateNavIcon(file, request, iconName);
		return "{}";
	}

	//添加图片到JLMT文件夹
	//@RequestMapping("/addjlmt")
	//@ResponseBody
	//public boolean addjlmt(@RequestParam("file")MultipartFile file,HttpServletRequest request,String imageHref){
	//	return frontIndexService.addjlmt(file, request, imageHref);
	//}

	//获取JLMT文件夹里的所有图片名称
	@RequestMapping("/getjlmt")
	@ResponseBody
	public Map<String, String> getjlmt(){
		System.out.println("111");
		return backOtherService.getjlmt();
	}

	@RequestMapping("/updatejlmy")
	@ResponseBody
	public String updatejlmt(@RequestParam("file")MultipartFile file,HttpServletRequest request,String imageName,String imageHref){
		backOtherService.updatejlmt(file, request, imageName, imageHref);
		return "{}";
	}

	@RequestMapping("/getCourse")
	@ResponseBody
	public JSONObject getCourse(){
		return backOtherService.getCourse();
	}

	@RequestMapping("/updateCourse")
	@ResponseBody
	public String updateCourse(@RequestParam("file")MultipartFile file,HttpServletRequest request,String imageName,int upOrDown){
		backOtherService.updateCourse(file, request, imageName, upOrDown);
		return "{}";
	}

	@RequestMapping("/deleteNavImage")
	@ResponseBody
	public boolean deleteNavImage(String imageName){
		return backOtherService.deleteNavImage(imageName);
	}

	@RequestMapping("/updateVideoImage")
	@ResponseBody
	public boolean updateVideoImage(@RequestParam("file")MultipartFile file,HttpServletRequest request,String videoImageName){
		return backOtherService.updateVideoImage(file, request, videoImageName);
	}

	/*
	 * 通用图片编辑
	 * ---------------------------------------------------------------
	 * ---------------------------------------------------------------
	 */

	@RequestMapping("/getHrefInfo.do")
	@ResponseBody
	public IndexHrefInfo getHrefInfo(String imageName){
		return backOtherService.getHrefInfo(imageName);
	}

	@RequestMapping("/updateIndexImage")
	@ResponseBody
	public String updateIndexImage(@RequestParam(value="file",required=false)MultipartFile file,HttpServletRequest request,String imageName,String href){
		System.out.println("9009");
		System.out.println(file);
		return backOtherService.updateIndexImage(file, request, imageName, href);
	}

	@RequestMapping("/updateIndexInfo")
	@ResponseBody
	public boolean updateIndexInfo(String imageName,String href){
		return backOtherService.updateIndexInfo(imageName, href);
	}

	@RequestMapping("/addNavIcon")
	@ResponseBody
	public String addNavIcon(@RequestParam(value="file",required=false)MultipartFile file,HttpServletRequest request,Integer areaID,String info){
		//System.out.println(goodOrHref);
		System.out.println(info);
		if (backOtherService.addNavIcon(file, request,areaID, info)) {
			return "{}";
		}
		return "{\"error\":\"添加失败\"}";
	}

	@RequestMapping("/deleteImage")
	@ResponseBody
	public boolean deleteImage(@RequestParam(value="id",required=false)Integer id,String path){
		System.out.println(id);
		System.out.println(path);
		return backOtherService.deleteImage(id, path);
	}

	@RequestMapping("/getIndexHrefInfos")
	@ResponseBody
	public List<IndexHrefInfo> getIndexHrefInfos(int areaID){
		return backOtherService.getIndexHrefInfos(areaID);
	};
	/*
	 * 视频上传
	 * ----------------------------------------------------------------
	 * ----------------------------------------------------------------
	 */
	@RequestMapping("/uploadVideo")
	@ResponseBody
	public String uploadVideo(@RequestParam("file")MultipartFile file,HttpServletRequest request,VideoInfo videoInfo){
		System.out.println("aaa");
		return backOtherService.uploadVideo(file, request, videoInfo);
	}

	@RequestMapping("/loadVideo")
	@ResponseBody
	public Page loadVideo(Page page,int orderBy){
		return backOtherService.loadVideo(page, orderBy);
	}

	@RequestMapping("/deleteVideo")
	@ResponseBody
	public boolean deleteVideo(Integer id,String videoPath,String imagePath){
		return backOtherService.deleteVideo(id, videoPath,imagePath);
	}

	/*
	 * 商城首页编辑
	 * ----------------------------------------------------------------
	 * ----------------------------------------------------------------
	 */
	@RequestMapping("/updateSmallIcon")
	@ResponseBody
	public String updateSmallIcon(@RequestParam("file")MultipartFile file,HttpServletRequest request,String iconName){
		if (backOtherService.updateSmallIcon(file, request, iconName)) {
			return "{}";
		}
		return "{\"error\":\"上传失败\"}";
	}
}
