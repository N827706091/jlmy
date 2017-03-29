//package shop.jlmy.test;
//
//import org.junit.Before;
//import org.junit.Test;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//import shop.jlmy.entity.ClassFirst;
//import shop.jlmy.entity.ClassSecond;
//import shop.jlmy.service.ClassFirstService;
//import shop.jlmy.service.ClassSecondService;
//
//public class ClassSecondTest {
//	private ClassSecondService classSecondService;
//	private ClassFirstService classFirstService;
//	@Before
//	public void before(){
//		@SuppressWarnings("resource")
//		ApplicationContext context=new ClassPathXmlApplicationContext(new String[]{"classpath:ApplicationContext.xml","classpath:SpringMVC_Servlet.xml"});
//		classSecondService=(ClassSecondService) context.getBean("classSecondServiceImpl");
//		classFirstService=(ClassFirstService) context.getBean("classFirstServiceImpl");
//	}
//	
//	@Test
//	public void add_ClassSecond(){
//		ClassFirst classFirst=classFirstService.select_ClassFirst(1);
//		ClassSecond classSecond=new ClassSecond();
//		classSecond.setClassName("指甲油2");
//		classSecond.setDescription("让指甲更好看2");
//		classSecond.setClassFirst(classFirst);
//		//System.out.println(classSecondService.add_ClassSecond(classSecond));
//	}
//	
//	@Test
//	public void select_ClassSecond(){
//		System.out.println(classSecondService.select_ClassSecond(2).getClassName());
//	}
//	
//	@Test
//	public void select_ClassSecond_ClassName(){
//		System.out.println(classSecondService.select_ClassSecond("指甲油").getId());
//	}
//	
//	@Test
//	public void update_ClassSecond(){
//		ClassSecond classSecond=classSecondService.select_ClassSecond(2);
//		classSecond.setClassName("指甲油2");
//		classSecond.setDescription("描述");
//		System.out.println(classSecondService.update_ClassSecond(classSecond));
//	}
//	
////	@Test
////	public void delete_ClassSecond(){
////		System.out.println(classSecondService.delete_ClassSecond(1));
////	}
//	
//	@Test
//	public void delete_ClassSecond_Class(){
//		ClassSecond classSecond=new ClassSecond();
//		classSecond.setId(1);
//		System.out.println(classSecondService.delete_ClassSecond(classSecond));
//	}
//}