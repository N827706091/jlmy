package shop.jlmy.dao;

import java.util.List;

import shop.jlmy.entity.IndexHrefInfo;

public interface IndexHrefDao {
	public List<IndexHrefInfo> getNavImage(int areaID);
}
