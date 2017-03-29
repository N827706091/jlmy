package shop.jlmy.dao;

import java.util.List;
import java.util.Set;

import shop.jlmy.entity.Good;
import shop.jlmy.entity.GoodColours;
import shop.jlmy.dto.Page;

public interface GoodDao {
	boolean add_Good(Good good);
	Good select_Good(int id);
	boolean delete_Good(int id);
	//boolean delete_Good(Good good);
	Set<GoodColours> goodColours(int goodID);
	boolean delete_Good_Colour(int good_id,int goodColour_id);
	boolean delete_Good_Colour(int id);
	List<String> select_Good_Brand();
	Page goodPage(Page page,String goodName,int classSecondID);
	boolean updateGood(Good good);
	boolean updateColour(int id,String colourName);
}
