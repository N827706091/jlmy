package shop.jlmy.service;

import java.util.List;

import net.sf.json.JSONObject;
import shop.jlmy.entity.Good;
import shop.jlmy.entity.GoodColours;
import shop.jlmy.dto.GoodInfo;
import shop.jlmy.dto.Page;

public interface GoodService {
	boolean add_Good(Good good,String colourValues,int ClassSecond_id);
	JSONObject select_Good(int id);
	boolean delete_Good(int id);
	//boolean delete_Good(Good good);
	boolean delete_Good_Colour(int good_id,int goodColour_id);
	String getClassSecond();
	List<String> select_Good_Brand();
	JSONObject goodPage(Page page,String goodName,int classSecondID);
	List<String> getGoodColours(String goodName,String colourName);
	List<String> getDetailImages(String goodName);
	boolean deleteFile(String path,String fileName);
	int deleteColour(String goodName,GoodColours goodColours);
	boolean updateGood(Good good,String old_goodName,String colourValues,int ClassSecond_id);
	boolean updateColourDir(String goodName, int id, String oldValue, String newValue);
	//商品分页查询
	Page frontLoadGoods(Page page,int orderBy,String goodName,String classSecondName);
}
