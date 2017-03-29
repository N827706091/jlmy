package shop.jlmy.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import net.sf.json.JSONObject;
import shop.jlmy.dto.NavImage;
import shop.jlmy.dto.Page;
import shop.jlmy.entity.IndexHrefInfo;
import shop.jlmy.entity.VideoInfo;

public interface BackOtherService {
	/*
	 * 			----------前台----------
	 */
	//JSONObject loadData();
	Page loadJLMTData(Page page);
	
	Page loadjlmt(int orderBy,Page page);
	boolean addjlmt(MultipartFile file,HttpServletRequest request);
	boolean addNavImage(MultipartFile file, HttpServletRequest request, int hrefType, String typeInfo);
	//boolean addNavImage(MultipartFile file,HttpServletRequest request,int goodOrHref,int id,String imageHref);
	List<NavImage> getImageName();
	boolean updateNavIcon(MultipartFile file,HttpServletRequest request,String iconName);
	Map<String, String> getjlmt();
	//boolean addjlmt(@RequestParam("file")MultipartFile file,HttpServletRequest request,String imageHref);
	boolean updatejlmt(MultipartFile file,HttpServletRequest request,String imageName,String imageHref);
	JSONObject getCourse();
	boolean updateCourse(MultipartFile file,HttpServletRequest request,String imageName,int upOrDown);
	boolean deleteNavImage(String imageName);
	boolean updateVideoImage(MultipartFile file,HttpServletRequest request,String videoImageName);
	/*
	 * 通用图片编辑
	 */
	IndexHrefInfo getHrefInfo(String imageName);
	String updateIndexImage(MultipartFile file,HttpServletRequest request,String imageName,String href);
	boolean updateIndexInfo(String imageName,String href);
	boolean addNavIcon(MultipartFile file,HttpServletRequest request,int areaID,String info);
	List<IndexHrefInfo> getIndexHrefInfos(int areaID);
	boolean deleteImage(Integer id,String path);
	/*
	 * 视频上传
	 */
	String uploadVideo(MultipartFile file,HttpServletRequest request,VideoInfo videoInfo);
	Page loadVideo(Page page,int orderBy);
	boolean deleteVideo(Integer id,String videoPath,String imagePath);
	/*
	 * 商城首页编辑
	 */
	boolean updateSmallIcon(MultipartFile file,HttpServletRequest request,String iconName);
}
