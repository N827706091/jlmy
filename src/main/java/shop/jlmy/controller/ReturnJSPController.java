package shop.jlmy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReturnJSPController {
	/*
	 * 前台
	 */

	@RequestMapping("/front")
	public String reTurnJSP(String toName){
		System.out.println(toName);
		return "/WEB-INF/front_view/"+toName;
	}

	@RequestMapping("/back")
	public String returnBackView(String toName){
		return "WEB-INF/back_view/"+toName;
	}

	@RequestMapping("/index")
	private String returnJSP() {
		System.out.println("111");
		return "/WEB-INF/front_view/index.jsp";
	}
	
	@RequestMapping("/return_backstage")
	private String return_backLogin(){
		System.out.println("222");
		return "/WEB-INF/back_view/Login.html";
	}
	
//	@RequestMapping("/login_success")
//	public String login_success(){
//		System.out.println("333");
//		return "/WEB-INF/back_view/goodManage.jsp";
//	}

	@RequestMapping("/goodClass")
	public String goodClass(){
		return "/WEB-INF/back_view/goodClass.jsp";
	}

	@RequestMapping("/goodManage")
	public String goodManage(){
		return "/WEB-INF/back_view/goodManage.jsp";
	}

	@RequestMapping("/addGood")
	public String addGood(){
		return "/WEB-INF/back_view/addGood.jsp";
	}

	@RequestMapping("/addGood_S")
	public String addGood_S(){
		return "WEB-INF/back_view/addGood_S.jsp";
	}

	/*
	 * 前台
	 * 
	 */
	@RequestMapping("/frontIndex")
	public String frontIndex(){
		return "WEB-INF/front_view/index.jsp";
	}
}