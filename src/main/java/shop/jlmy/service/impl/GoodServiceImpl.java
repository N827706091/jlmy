package shop.jlmy.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;

import javax.persistence.OrderBy;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import shop.jlmy.dao.ClassSecondDao;
import shop.jlmy.dao.GoodDao;
import shop.jlmy.dto.GoodInfo;
import shop.jlmy.dto.Page;
import shop.jlmy.entity.ClassSecond;
import shop.jlmy.entity.Good;
import shop.jlmy.entity.GoodColours;
import shop.jlmy.service.GoodService;
import shop.jlmy.utils.FileUtils;
import shop.jlmy.utils.JsonDateValueProcessor;

@Service
public class GoodServiceImpl implements GoodService{
	@Autowired
	private GoodDao goodDao;

	@Autowired
	private ClassSecondDao classSecondDao;

	@Override
	public boolean add_Good(Good good,String colourValues,int ClassSecond_id) {
		//拆分字符串
		StringTokenizer st=new StringTokenizer(colourValues, ",");
		Set<GoodColours> goodColourSet=new HashSet<>(0);
		StringBuffer sbf=new StringBuffer();
		while (st.hasMoreTokens()) {
			sbf.append(st.nextToken());
			String [] strings=sbf.toString().split("-");
			GoodColours goodColour=new GoodColours();
			goodColour.setColourName(strings[0]);
			goodColour.setInventory(Integer.valueOf(strings[1]));
			goodColour.setGood(good);
			goodColourSet.add(goodColour);
			sbf.setLength(0);
		}
		good.setGoodColours(goodColourSet);
		ClassSecond classSecond=new ClassSecond();
		classSecond.setId(ClassSecond_id);
		good.setClassSecond(classSecond);
		return goodDao.add_Good(good);
	}

	@Override
	public JSONObject select_Good(int id) {
		JsonConfig jsonConfig=new JsonConfig();
		JsonDateValueProcessor jsonValueProcessor=new JsonDateValueProcessor();
		jsonConfig.registerJsonValueProcessor(Date.class, jsonValueProcessor);
		jsonConfig.setExcludes(new String[]{"goods","good","classFirst"});
		return JSONObject.fromObject(goodDao.select_Good(id), jsonConfig);
	}

	@Override
	public boolean delete_Good(int id) {
		return goodDao.delete_Good(id);
	}

//	@Override
//	public boolean delete_Good(Good good) {
//		return goodDao.delete_Good(good);
//	}

	@Override
	public boolean delete_Good_Colour(int good_id,int goodColour_id) {
		return goodDao.delete_Good_Colour(good_id,goodColour_id);
	}

	@Override
	public String getClassSecond() {
		return null;
	}

	@Override
	public List<String> select_Good_Brand() {
		return goodDao.select_Good_Brand();
	}

	/*
	 * 后台管理商品管理商品分页
	 * (non-Javadoc)
	 * @see shop.jlmy.service.GoodService#goodPage(shop.jlmy.dto.Page, java.lang.String, int)
	 */
	@Override
	public JSONObject goodPage(Page page, String goodName, int classSecondID) {
		JsonConfig jsonConfig=new JsonConfig();
		JsonDateValueProcessor jsonValueProcessor=new JsonDateValueProcessor();
		jsonConfig.registerJsonValueProcessor(Date.class, jsonValueProcessor);
		jsonConfig.setExcludes(new String[]{"classFirst","classSecond","goods","good"});
		page=goodDao.goodPage(page, goodName, classSecondID,0);
		return JSONObject.fromObject(page, jsonConfig);
	}

	/*
	 * 前台商品搜索商品分页
	 * (non-Javadoc)
	 * @see shop.jlmy.service.GoodService#frontLoadGoods(shop.jlmy.dto.Page, int, java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Page frontLoadGoods(Page page, int orderBy, String goodName,String classSecondName) {
		int classSecondId=0;
		if (null!=classSecondName && !"".equals(classSecondName)) {
			System.out.println("111");
			classSecondId=classSecondDao.select_ClassSecond(classSecondName).getId();
		}
		page=goodDao.goodPage(page, goodName, classSecondId, orderBy);
		List<Good> goods=(List<Good>) page.getList();
		List<GoodInfo> goodInfos=new ArrayList<>(0);
		for (Good good : goods) {
			GoodInfo goodInfo=new GoodInfo();
			goodInfo.setId(good.getId());
			goodInfo.setGoodName(good.getGoodName());
			goodInfo.setPrice(good.getPrice());
			Set<GoodColours> goodColours=good.getGoodColours();
			String colourName=null;
			for (GoodColours goodColours_ : goodColours) {
				colourName=goodColours_.getColourName();
				break;
			}
			//获取商品目录下图片名
			List<String> colourImages=getGoodColours(good.getGoodName(), colourName);
			goodInfo.setImagePath("/jlmytk/"+good.getGoodName()+"/z/"+colourName+"/"+colourImages.get(0));
			System.out.println(goodInfo.getImagePath());
			goodInfos.add(goodInfo);
		}
		page.setList(goodInfos);
		return page;
	}

	@Override
	public List<String> getGoodColours(String goodName, String colourName) {
		String path="G:/JLMY_Images/"+goodName+"/z/"+colourName;
		//获取指定路径下所有的文件名
		return FileUtils.getFile(path);
	}

	@Override
	public List<String> getDetailImages(String goodName){
		String path="G:/JLMY_Images/"+goodName+"/x";
		return FileUtils.getFile(path);
	}

	@Override
	public boolean deleteFile(String path, String fileName) {
		//替换路径，构造正确的路径
		path=path.replace("/jlmytk", "G:/JLMY_Images");
		//删除文件
		return FileUtils.deleteFile(path+"/"+fileName);
	}

	@Override
	public boolean updateGood(Good good, String old_goodName, String colourValues, int ClassSecond_id) {
		//拆分字符串
		StringTokenizer st=new StringTokenizer(colourValues, ",");
		System.out.println("888");
		Set<GoodColours> goodColours=goodDao.goodColours(good.getId());
		System.out.println(goodColours);
		
		Set<GoodColours> goodColourSet=new HashSet<>(0);
		StringBuffer sbf=new StringBuffer();
		while (st.hasMoreTokens()) {
			sbf.append(st.nextToken());
			String [] strings=sbf.toString().split("-");
			boolean flag=false;
			
			for (GoodColours colour : goodColours) {
				System.out.println(strings[0]+">>>"+colour.getColourName());
				if (strings[0].equals(colour.getColourName())) {
					System.out.println(strings[0]+"数据库中有这条数据！");
					colour.setInventory(Integer.valueOf(strings[1]));
					goodColourSet.add(colour);
					flag=true;
					break;
				}
			}
			if (flag==false) {
				System.out.println(strings[0]+"数据库中没有此条数据！");
				GoodColours goodColour=new GoodColours();
				goodColour.setColourName(strings[0]);
				goodColour.setInventory(Integer.valueOf(strings[1]));
				goodColour.setGood(good);
				goodColourSet.add(goodColour);
			}
			sbf.setLength(0);
		}
		good.setGoodColours(goodColourSet);
		ClassSecond classSecond=new ClassSecond();
		classSecond.setId(ClassSecond_id);
		good.setClassSecond(classSecond);
		boolean updateGoodResult=goodDao.updateGood(good);
		if (updateGoodResult) {
			if (!good.getGoodName().equals(old_goodName)) {
				System.out.println("修改路径！");
				System.out.println(FileUtils.renameDirectoryOrFile("G:/JLMY_Images/"+old_goodName, "G:/JLMY_Images/"+good.getGoodName()));
			}
		}
		return updateGoodResult;
	}

	@Override
	public boolean updateColourDir(String goodName,int id, String oldValue, String newValue) {
		if (goodDao.updateColour(id, newValue)) {
			return FileUtils.renameDirectoryOrFile("G:/JLMY_Images/"+goodName+"/z/"+oldValue, "G:/JLMY_Images/"+goodName+"/z/"+newValue);
		}
		return false;
	}

	@Override
	public int deleteColour(String goodName,GoodColours goodColours) {
		if(goodDao.delete_Good_Colour(goodColours.getId())){
			if(FileUtils.deleteDirectoryAndFile("G:/JLMY_Images/"+goodName+"/z/"+goodColours.getColourName())){
				return 2;
			};
			return 1;
		};
		return 0;
	}
}
