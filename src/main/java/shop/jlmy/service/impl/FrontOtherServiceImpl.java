package shop.jlmy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.jlmy.dao.IndexHrefDao;
import shop.jlmy.entity.IndexHrefInfo;
import shop.jlmy.service.FrontOtherService;

@Service
public class FrontOtherServiceImpl implements FrontOtherService {

	@Autowired
	private IndexHrefDao indexHrefDao;

	@Override
	public List<IndexHrefInfo> getNavImage(int areaID) {
		return indexHrefDao.getNavImage(areaID);
	}

}
