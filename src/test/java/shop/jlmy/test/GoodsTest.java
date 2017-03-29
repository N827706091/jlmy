package shop.jlmy.test;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.Before;
import org.junit.Test;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import shop.jlmy.entity.ClassSecond;
import shop.jlmy.entity.Good;
import shop.jlmy.entity.GoodColours;
import shop.jlmy.service.ClassSecondService;
import shop.jlmy.service.GoodService;

public class GoodsTest {
	private GoodService goodService;
	private ClassSecondService classSecondService;
	@Before
	public void before(){
		@SuppressWarnings("resource")
		ApplicationContext context=new ClassPathXmlApplicationContext(new String[]{"classpath:ApplicationContext.xml","classpath:SpringMVC_Servlet.xml"});
		goodService=(GoodService) context.getBean("goodServiceImpl");
		classSecondService=(ClassSecondService) context.getBean("classSecondServiceImpl");
	}
	
	@Test
	public void addGoods(){
		ClassSecond classSecond=classSecondService.select_ClassSecond(2);
		Good good=new Good();
		good.setGoodName("指甲油");
		good.setPrice(99.99f);
		good.setProductionAddress("中国");
		good.setProductFeature("鲜艳，妩媚");
		good.setClassSecond(classSecond);
		GoodColours goodColours=new GoodColours();
		goodColours.setColourName("红色");
		goodColours.setInventory(100);
		goodColours.setGood(good);
		GoodColours goodColours2=new GoodColours();
		goodColours2.setColourName("白色");
		goodColours2.setInventory(99);
		goodColours2.setGood(good);
		Set<GoodColours> goodColours_=new HashSet<>(0);
		goodColours_.add(goodColours);
		goodColours_.add(goodColours2);
		good.setGoodColours(goodColours_);
		//System.out.println(goodService.add_Good(good));
		
	}
	
	@Test
	public void deleteGoods(){
		System.out.println(goodService.delete_Good(2));
	}
	
	@Test
	public void delete_Good_Colour(){
		GoodColours goodColours=new GoodColours();
		goodColours.setId(3);
		System.out.println(goodService.delete_Good_Colour(2,4));
	}
	
//	@Test
//	public void deleteGood(){
//		Good good=new Good();
//		good.setId(3);
//		System.out.println(goodService.delete_Good(good));
//	}

//	@Test
//	public void selectGoods(){
//		int id=1;
//		//Good good=goodService.select_Good(id);
//		JsonConfig jsonConfig=new JsonConfig();
//		jsonConfig.setExcludes(new String[]{"good","classSecond"});
//		JSONObject jsonObject=JSONObject.fromObject(good,jsonConfig);
//		System.out.println(jsonObject.toString());
//		//System.out.println(goodService.select_Good(id).getClassSecond().getClassName());
//	}

	@Test
	public void selectGoosBrand(){
		List<String> brans=goodService.select_Good_Brand();
		for (String string : brans) {
			System.out.println(string);
		}
	}

	@Test
	public void selectGoodColour(){
		Good good=new Good();
		good.setId(6);
		System.out.println("777");
		System.out.println(goodService.updateGood(good, "1","1", 1));
	}
}

