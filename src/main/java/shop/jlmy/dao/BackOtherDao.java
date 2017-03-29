package shop.jlmy.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import net.sf.ezmorph.array.BooleanArrayMorpher;
import shop.jlmy.dto.Page;
import shop.jlmy.entity.IndexHrefInfo;
import shop.jlmy.entity.JlmtInfo;
import shop.jlmy.entity.VideoInfo;

public interface BackOtherDao {
	boolean addjlmt(JlmtInfo jlmtInfo);
	Page loadjlmt(int orderBy,Page page);
	boolean deleteImage(JlmtInfo jlmtInfo);
	boolean addNavIcon(IndexHrefInfo indexHrefInfo);
	List<IndexHrefInfo> getIndexHrefInfos(int areaID);
	IndexHrefInfo getIndexHrefInfo(int id);
	IndexHrefInfo getIndexHrefInfo(String imageName);
	boolean updateIndexImage(IndexHrefInfo indexHrefInfo);
	/*
	 * 视频
	 */
	void addVideoInfo(VideoInfo videoInfo) throws Exception;
	Page loadVideo(Page page,int orderBy) throws Exception;
	void deleteVideo(VideoInfo videoInfo) throws Exception;
}
