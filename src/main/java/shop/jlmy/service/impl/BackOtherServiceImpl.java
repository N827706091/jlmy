package shop.jlmy.service.impl;

import java.io.File;
import java.io.FileFilter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import net.sf.json.JSONObject;
import shop.jlmy.dao.BackOtherDao;
import shop.jlmy.dto.NavImage;
import shop.jlmy.dto.Page;
import shop.jlmy.entity.IndexHrefInfo;
import shop.jlmy.entity.JlmtInfo;
import shop.jlmy.entity.VideoInfo;
import shop.jlmy.service.BackOtherService;
import shop.jlmy.utils.FfmpegUtil;
import shop.jlmy.utils.FileUpload;
import shop.jlmy.utils.FileUtils;
import shop.jlmy.utils.HEX;

@Service
public class BackOtherServiceImpl extends FileUpload implements BackOtherService{

	@Autowired
	private BackOtherDao backOtherDao;

	@Override
	public boolean addNavImage(MultipartFile file, HttpServletRequest request, int hrefType, String typeInfo){
		String path="G:/JLMY_Images/FRONT_INDEX/NAVIMAGE";
		try {
			
			
			super.upload(file, path, request);
			String oldFileName=super.getFileName();
			/* 截取文件后缀名 +1表示截取.后的后缀名
			 * oldImageName.substring(oldImageName.lastIndexOf(".")+1);
			 */
			String suffix=oldFileName.substring(oldFileName.lastIndexOf("."));;
			String newFileName=null;
			switch (hrefType) {
				case 1:newFileName="good_"+typeInfo+suffix;break;
				case 2:newFileName="href_"+HEX.stringToHexString(typeInfo)+suffix;break;
				default:break;
			}
			System.out.println(newFileName);
			return FileUtils.renameDirectoryOrFile(oldFileName, path+"/"+newFileName);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}	
//		String fileName=null;
//		try {
//			super.upload(file, path, request);
//			String oldFileName=super.getFileName();
//			/*
//			 * 截取文件后缀名 +1表示截取.后的后缀名
//			 * oldImageName.substring(oldImageName.lastIndexOf(".")+1);
//			 */
//			String suffix=oldFileName.substring(oldFileName.lastIndexOf("."));
//			if (1==goodOrHref) {
//				fileName="good_"+id+suffix;
//			}else if (2==goodOrHref) {
//				fileName="href_"+HEX.stringToHexString(imageHref)+suffix;
//			}
//			FileUtils.renameDirectoryOrFile(oldFileName, path+"/"+fileName);
//			return true;
//		} catch (Exception e) {
//			e.printStackTrace();
//			return false;
//		}
	}

	@Override
	public List<NavImage> getImageName() {
		String path="G:/JLMY_Images/FRONT_INDEX/NAVIMAGE";
		String[] fileTypes = {".jpg",".JPG",".png",".PNG",".gif"};
		//获取所有的文件名
		List<String> fileNames=FileUtils.getSuffixFiles(path, fileTypes);
		//创建信息集合
		List<NavImage> navImages=new ArrayList<NavImage>(0);
		for (String str : fileNames) {
			//拆分字符串
			String[] typeAndName =str.split("_");
			NavImage navImage=new NavImage();
			navImage.setType(typeAndName[0]);
			navImage.setFileName(str);
			String info=typeAndName[1].substring(0, typeAndName[1].lastIndexOf("."));
			if ("href".equals(navImage.getType())) {
				//16进制转String
				info=HEX.hexStringToString(info);
				navImage.setImageHref(info);
			}else {
				navImage.setGoodID(Integer.valueOf(info));
			}
			navImages.add(navImage);
		}
		System.out.println(navImages);
		return navImages;
	}

	@Override
	public boolean updateNavIcon(MultipartFile file,HttpServletRequest request,String iconName){
		String path="G:/JLMY_Images/FRONT_INDEX/SMALLICON";
		System.out.println(iconName);
		if (FileUtils.deleteFile(path+"/"+iconName)) {
			System.out.println("565464");
			try {
				super.upload(file, path, request);
				String newFileName=super.getFileName();
				System.out.println("newFileName="+newFileName);
				FileUtils.renameDirectoryOrFile(newFileName, path+"/"+iconName);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}

	@Override
	public Map<String, String> getjlmt() {
		String path="G:/JLMY_Images/FRONT_INDEX/PRETTYIMAGE";
		String[] fileTypes = {".jpg",".JPG",".png",".PNG",".gif"};
		List<String> fileNameList=FileUtils.getSuffixFiles(path, fileTypes);
		System.out.println(fileNameList);
		//List<String> fileNames=new ArrayList<>(0);
		Map<String, String> fileNameMap=new HashMap<>(0);
		if (null!=fileNameList) {
			for (String str : fileNameList) {
				//str.substring(0, str.lastIndexOf("."))) 获取文件名（去掉后缀名）
				fileNameMap.put(str, HEX.hexStringToString(str.substring(0, str.lastIndexOf("."))));
				//fileNames.add(HEX.hexStringToString(str.substring(0, str.lastIndexOf("."))));
			}
		}
		System.out.println(fileNameMap);
		return fileNameMap;
	}

	@Override
	public boolean updatejlmt(MultipartFile file, HttpServletRequest request, String imageName, String imageHref) {
		System.out.println("imageName="+imageName+" -imageHref="+imageHref);
		String path="G:/JLMY_Images/FRONT_INDEX/PRETTYIMAGE";
		FileUtils.deleteFile(path+"/"+imageName);
		try {
			super.upload(file, path, request);
			String oldFileName=super.getFileName();
			String newFileName=path+"/"+HEX.stringToHexString(imageHref)+oldFileName.substring(oldFileName.lastIndexOf("."));
			System.out.println(oldFileName);
			System.out.println(newFileName);
			return FileUtils.renameDirectoryOrFile(oldFileName, newFileName);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public JSONObject getCourse(){
		String path_up="G:/JLMY_Images/FRONT_INDEX/COURSE/UP";
		String path_down="G:/JLMY_Images/FRONT_INDEX/COURSE/DOWN";
		String[] fileTypes = {".jpg",".JPG",".png",".PNG",".gif"};
		List<String> fileName_up=FileUtils.getSuffixFiles(path_up, fileTypes);
		List<String> filename_down=FileUtils.getSuffixFiles(path_down, fileTypes);
		JSONObject fileName=new JSONObject();
		fileName.put("up", fileName_up);
		fileName.put("down", filename_down);
		System.out.println(fileName.toString());
		//System.out.println(fileNameList);
		return fileName;
	}

	@Override
	public boolean updateCourse(MultipartFile file, HttpServletRequest request, String imageName, int upOrDown) {
		String path=null;
		if (1==upOrDown) {
			path="G:/JLMY_Images/FRONT_INDEX/COURSE/UP";
		}else if(2==upOrDown){
			path="G:/JLMY_Images/FRONT_INDEX/COURSE/DOWN";
		}
		try {
			FileUtils.deleteFile(path+"/"+imageName);
			super.upload(file, path, request);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteNavImage(String imageName) {
		String path="G:/JLMY_Images/FRONT_INDEX/NAVIMAGE/"+imageName;
		return FileUtils.deleteFile(path);
	}

	@Override
	public boolean updateVideoImage(MultipartFile file, HttpServletRequest request, String videoImageName) {
		System.out.println(videoImageName);
		String path="G:/JLMY_Images/FRONT_INDEX/JLMTVIDEO";
		if(FileUtils.deleteFile(path+"/"+videoImageName)){
			try {
				super.upload(file, path, request);
				String oldFileName=super.getFileName();
				return FileUtils.renameDirectoryOrFile(oldFileName, path+"/"+videoImageName);
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}

	@Override
	public Page loadJLMTData(Page page) {
		String path="G:/JLMY_Images/JLMT";
		String[] fileTypes={".jpg",".JPG",".png",".PNG"};
		File f=new File(path);
		File[] allFiles=f.listFiles(new FileFilter() {//过滤掉目录 
			@Override
			public boolean accept(File f) {
				if (f.isFile()) {
					for(int i=0;i<fileTypes.length;i++){
						String suffix=f.getName().substring(f.getName().lastIndexOf("."));
						if (suffix.equals(fileTypes[i])) {
							return true;
							}
						}
					}
				return false;
			}
		});
		//数据总条数
		page.setTotal(allFiles.length);
		int init=(page.getPageNow()-1)*page.getPageSize();
		File[] output=Arrays.copyOfRange(allFiles, init, init+page.getPageSize());
		if(init+page.getPageSize()>allFiles.length){
			//不足一页的情况 去掉null
			int size=allFiles.length-init;
			output=Arrays.copyOf(output, size);
		}
		List<String> fileNames=new ArrayList<String>(0);
		for (File file : output) {
			fileNames.add(file.getName());
		}
		page.setList(fileNames);
		return page;
	}

	//-----------------------------------------------------------------
	//----------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------
	@Override
	public boolean addjlmt(MultipartFile file, HttpServletRequest request) {
		String path="G:/JLMY_Images/JLMT";
		try {
			super.upload(file, path, request);
			JlmtInfo jlmtInfo=new JlmtInfo();
			jlmtInfo.setHot(0);
			jlmtInfo.setPath(super.getFileName().replace("G:/JLMY_Images", "/jlmytk"));
			jlmtInfo.setUploadTime(new Date());
			return backOtherDao.addjlmt(jlmtInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Page loadjlmt(int orderBy, Page page) {
		return backOtherDao.loadjlmt(orderBy, page);
	}

	@Override
	public boolean updateSmallIcon(MultipartFile file,HttpServletRequest request,String iconName) {
		String path="G:/JLMY_Images/A_INDEX/SMALLICON";
		System.out.println(iconName);
		if (FileUtils.deleteFile(path+"/"+iconName)) {
			System.out.println("565464");
			try {
				super.upload(file, path, request);
				String newFileName=super.getFileName();
				System.out.println("newFileName="+newFileName);
				FileUtils.renameDirectoryOrFile(newFileName, path+"/"+iconName);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}

	@Override
	public IndexHrefInfo getHrefInfo(String imageName){
		return backOtherDao.getIndexHrefInfo(imageName);
	}

	@Override
	public String updateIndexImage(MultipartFile file, HttpServletRequest request,String imageName,String href) {
		String path="G:/JLMY_Images/A_INDEX";
		try {
			IndexHrefInfo indexHrefInfo=backOtherDao.getIndexHrefInfo(imageName);
			if (null!=file) {
				super.upload(file, path, request);
				//获取图片路径
				String filePath=super.getFileName();
				System.out.println(filePath);
				//判断是否是首页滚动图，修改相应属性
				if (1==indexHrefInfo.getAreaID()) {
					indexHrefInfo.setPath(filePath.replace("G:/JLMY_Images", "/jlmytk"));
					indexHrefInfo.setImageName(filePath.substring(filePath.lastIndexOf("/")+1));
				}else {
					FileUtils.deleteFile(path+"/"+imageName);
					FileUtils.renameDirectoryOrFile(filePath, path+"/"+imageName);
				}
			}
			System.out.println("zxczxcxzcxzzxxz");
			//获取IndexHrefInfo信息
			indexHrefInfo.setHref(href);
			//修改IndexHrefInfo
			if (backOtherDao.updateIndexImage(indexHrefInfo)) {
				JSONObject jsonObject=new JSONObject();
				jsonObject.put("href", indexHrefInfo.getHref());
				return jsonObject.toString();
//				return "{\"success\":\""+indexHrefInfo.getHref()+"\"}";
			}
			return "{}";
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"error\":\"修改失败\"}";
		}
	}

	@Override
	public boolean updateIndexInfo(String imageName,String href){
		IndexHrefInfo indexHrefInfo=backOtherDao.getIndexHrefInfo(imageName);
		indexHrefInfo.setHref(href);
		return backOtherDao.updateIndexImage(indexHrefInfo);
	}

	@Override
	public boolean addNavIcon(MultipartFile file,HttpServletRequest request,int areaID,String info) {
		String path="G:/JLMY_Images/A_INDEX";
		try {
			super.upload(file, path, request);
			String filePath=super.getFileName();
			IndexHrefInfo indexHrefInfo=new IndexHrefInfo();
			indexHrefInfo.setAreaID(areaID);
			indexHrefInfo.setHref(info);
			indexHrefInfo.setPath(filePath.replace("G:/JLMY_Images", "/jlmytk"));
			indexHrefInfo.setImageName(filePath.substring(filePath.lastIndexOf("/")+1));
			indexHrefInfo.setUploadTime(new Date());
			return backOtherDao.addNavIcon(indexHrefInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<IndexHrefInfo> getIndexHrefInfos(int areaID) {
		return backOtherDao.getIndexHrefInfos(areaID);
	}

	@Override
	public boolean deleteImage(Integer id,String path){
		path=path.replace("/jlmytk", "G:/JLMY_Images");
		if (null!=id) {
			JlmtInfo jlmtInfo=new JlmtInfo();
			jlmtInfo.setId(id);
			if (backOtherDao.deleteImage(jlmtInfo)) {
				return FileUtils.deleteFile(path);
			}
			return false;
		}else {
			return FileUtils.deleteFile(path);
		}
	}

	@Override
	public String uploadVideo(MultipartFile file,HttpServletRequest request, VideoInfo videoInfo) {
		String path="G:/JLMY_Images/VIDEO";
		try {
			String allowSuffix="asx,asf,mpg,wmv,3gp,mp4,mov,avi,flv";
			super.setAllowSuffix(allowSuffix);
			super.setAllowSize(1000L);
			super.upload(file, path, request);
			String filePath=super.getFileName();
			String ffmpegPath=BackOtherServiceImpl.class.getClassLoader().getResource("").getPath()+"ffmpeg.exe";
			String imagePath=filePath.substring(0, filePath.lastIndexOf(".")+1)+"jpg";
			if(FfmpegUtil.createVideoImage(ffmpegPath, filePath, imagePath)){
				videoInfo.setVideoPath(filePath);
				videoInfo.setImagePath(imagePath);
				videoInfo.setUploadTime(new Date());
				backOtherDao.addVideoInfo(videoInfo);
				return "{}";
			}
			return "{\"error\":\"上传失败\"}";
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"error\":\"上传失败\"}";
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page loadVideo(Page page,int orderBy){
		try {
			page=backOtherDao.loadVideo(page, orderBy);
			List<VideoInfo> videoInfos=new ArrayList<>(0);
			for (VideoInfo videoInfo : (List<VideoInfo>)page.getList()) {
				videoInfo.setImagePath(videoInfo.getImagePath().replace("G:/JLMY_Images", "/jlmytk"));
				videoInfo.setVideoPath(videoInfo.getVideoPath().replace("G:/JLMY_Images", "/jlmytk"));
				videoInfos.add(videoInfo);
			}
			page.setList(videoInfos);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return page;
		}
	}

	@Override
	public boolean deleteVideo(Integer id,String videoPath,String imageName){
		VideoInfo videoInfo=new VideoInfo();
		videoInfo.setId(id);
		try {
			backOtherDao.deleteVideo(videoInfo);
			videoPath=videoPath.replace("/jlmytk", "G:/JLMY_Images");
			imageName=imageName.replace("/jlmytk", "G:/JLMY_Images");
			if(FileUtils.deleteFile(videoPath)){
				return FileUtils.deleteFile(imageName);
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
}