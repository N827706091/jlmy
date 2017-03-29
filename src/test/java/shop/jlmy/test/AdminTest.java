//package shop.jlmy.test;
//
//import org.junit.Before;
//import org.junit.Test;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//import shop.jlmy.entity.Admin;
//import shop.jlmy.dto.Page;
//import shop.jlmy.service.AdminService;
//
//public class AdminTest {
//	private AdminService adminService;
//	@Before
//	public void before(){
//		@SuppressWarnings("resource")
//		ApplicationContext context=new ClassPathXmlApplicationContext(new String[]{"classpath:ApplicationContext.xml","classpath:SpringMVC_Servlet.xml"});
//		adminService=(AdminService) context.getBean("adminServiceImpl");
//	}
//	
//	@Test
//	public void adminLogin(){
//		String adminName="pimaofan";
//		String password="pimaofan940416";
//		System.out.println(adminService.ver_Admin_Login(adminName, password));
//	}
//	
//	@Test
//	public void addAdmin(){
//		Admin admin=new Admin();
//		admin.setAdminName("niejunhao");
//		admin.setPassword("niejunhao168");
//		switch (adminService.add_Admin(admin)) {
//			case 0:	System.out.println("添加失败");break;
//			case 1:System.out.println("添加成功");break;
//			case 2:System.out.println("管理员已存在");break;
//			default:break;
//		}
//	}
//	
//	@Test
//	public void pageAdmin(){
//		Page page=new Page();
//		page.setPageNow(1);
//		page.setPageSize(3);
//		System.out.println(adminService.page_Admin(page));
//	}
//}
