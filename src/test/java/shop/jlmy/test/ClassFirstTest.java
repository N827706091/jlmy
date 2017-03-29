//package shop.jlmy.test;
//
//import org.junit.Before;
//import org.junit.Test;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//import shop.jlmy.entity.ClassFirst;
//import shop.jlmy.service.ClassFirstService;
//
//public class ClassFirstTest {
//	private ClassFirstService classFirstService;
//	
//	@Before
//	public void before(){
//		@SuppressWarnings("resource")
//		ApplicationContext context=new ClassPathXmlApplicationContext(new String[]{"classpath:ApplicationContext.xml","classpath:SpringMVC_Servlet.xml"});
//		classFirstService=(ClassFirstService) context.getBean("classFirstServiceImpl");		
//	}
//	
//	@Test
//	public void add_ClassFirst(){
//		ClassFirst classFirst=new ClassFirst();
//		classFirst.setClassName("美甲2");
//		classFirst.setDescription("让指甲好看2");
//		System.out.println("111");
//		System.out.println(classFirstService.add_ClassFirst(classFirst));
//	}
//	
//	@Test
//	public void select_ClassFirst(){
//		//ClassFirst classFirst=new ClassFirst();
//		System.out.println(classFirstService.select_ClassFirst(2).getClassName());
//	}
//
//	@Test
//	public void select_ClassFirst_ClassName(){
//		ClassFirst classFirst=classFirstService.select_ClassFirst("美甲");
//		System.out.println(classFirst.getClassName());
//		System.out.println(classFirst.getDescription());
//		System.out.println(classFirst.getId());
//	}
//
//	@Test
//	public void update_ClassFirst(){
//		ClassFirst classFirst=classFirstService.select_ClassFirst(2);
//		classFirst.setClassName("美甲");
//		classFirst.setDescription("让指甲好看");
//		System.out.println(classFirstService.update_ClassFirst(classFirst));
//	}
//	
//	@Test
//	public void delete_ClassFirst(){
//		System.out.println(classFirstService.delete_ClassFirst(1));
//	}
//}
