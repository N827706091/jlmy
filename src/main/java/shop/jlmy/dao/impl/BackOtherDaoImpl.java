package shop.jlmy.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import shop.jlmy.dao.BackOtherDao;
import shop.jlmy.dto.Page;
import shop.jlmy.entity.IndexHrefInfo;
import shop.jlmy.entity.JlmtInfo;
import shop.jlmy.entity.VideoInfo;

@Repository
@Transactional
public class BackOtherDaoImpl implements BackOtherDao{

	@Autowired
	private HibernateTemplate hibernateTemplate;

	/*
	 * ------------------------------------------------------------------------------------->>>
	 * (non-Javadoc)
	 * @see shop.jlmy.dao.BackOtherDao#addjlmt(shop.jlmy.entity.JlmtInfo)
	 * 京翎美图
	 */
	@Override
	public boolean addjlmt(JlmtInfo jlmtInfo) {
		try {
			hibernateTemplate.save(jlmtInfo);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Page loadjlmt(int orderBy,Page page) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, JlmtInfo.class);
		if (1==orderBy) {
			//最新的排序
			criteria.addOrder(Order.desc("uploadTime"));
		}else if (2==orderBy) {
			//浏览量最多的排序
			criteria.addOrder(Order.desc("hot"));
		}
		page.setTotal(HibernateUtils.get_Data_Count(criteria));
		criteria.setProjection(null);
		criteria.setFirstResult((page.getPageNow()-1)*page.getPageSize());
		criteria.setMaxResults(page.getPageSize());
		page.setList(criteria.list());
		return page;
	}

	@Override
	public boolean deleteImage(JlmtInfo jlmtInfo){
		try {
			hibernateTemplate.delete(jlmtInfo);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	//----------------------------------------------------------------------------------------------------->>>

	@Override
	public IndexHrefInfo getIndexHrefInfo(int id) {
		return hibernateTemplate.get(IndexHrefInfo.class, id);
	}

	@Override
	public IndexHrefInfo getIndexHrefInfo(String imageName) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, IndexHrefInfo.class);
		criteria.add(Restrictions.eq("imageName", imageName));
		return (IndexHrefInfo) criteria.uniqueResult();
	}

	@Override
	public boolean updateIndexImage(IndexHrefInfo indexHrefInfo) {
		try {
			hibernateTemplate.update(indexHrefInfo);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean addNavIcon(IndexHrefInfo indexHrefInfo) {
		try {
			hibernateTemplate.save(indexHrefInfo);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<IndexHrefInfo> getIndexHrefInfos(int areaID) {
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, IndexHrefInfo.class);
		criteria.add(Restrictions.eq("areaID", areaID));
		criteria.addOrder(Order.desc("uploadTime"));
		List<IndexHrefInfo> indexHrefInfos=criteria.list();
		System.out.println(indexHrefInfos);
		return indexHrefInfos;
	}

	/*
	 * (non-Javadoc)
	 * @see shop.jlmy.dao.BackOtherDao#addVideoInfo(shop.jlmy.entity.VideoInfo)
	 * 视频
	 */
	@Override
	public void addVideoInfo(VideoInfo videoInfo) throws Exception{		
		hibernateTemplate.save(videoInfo);
	}

	@Override
	public Page loadVideo(Page page,int orderBy) throws Exception{
		Criteria criteria=HibernateUtils.getCriteria(hibernateTemplate, VideoInfo.class);
		if (1==orderBy) {
			criteria.addOrder(Order.desc("uploadTime"));
		}else if (2==orderBy) {
			criteria.addOrder(Order.asc("uploadTime"));
		}
		page.setTotal(HibernateUtils.get_Data_Count(criteria));
		criteria.setProjection(null);
		criteria.setFirstResult((page.getPageNow()-1)*page.getPageSize());
		criteria.setMaxResults(page.getPageSize());
		List<?> list=criteria.list(); 
		System.out.println(list);
		page.setList(list);
		return page;
	}

	@Override
	public void deleteVideo(VideoInfo videoInfo) throws Exception{
		hibernateTemplate.delete(videoInfo);
	}

	
}
