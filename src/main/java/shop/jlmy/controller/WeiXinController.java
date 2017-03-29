package shop.jlmy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.jlmy.wx.WxUtil;

@Controller
@RequestMapping("/Wx")
public class WeiXinController {

	@RequestMapping(method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String checkSignature(String echostr,String timestamp,String nonce,String signature){
		System.out.println("111");
		if (WxUtil.checkSignature(signature, timestamp, nonce)) {
			return echostr;
		}
		return "error";
	}

	/*@RequestMapping(method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String Message(HttpServletRequest request,String timestamp,String nonce,String signature){
		if(WxUtil.checkSignature(signature, timestamp, nonce)){
			return weiXinService.getXML(request);
		}
		return "error";
	}*/

//	
//	@RequestMapping(method=RequestMethod.GET,produces="text/html;charset=UTF-8")
//	@ResponseBody
//	public String WeiXinServlet(String echostr,String timestamp,String nonce,String signature){
//		//判断校验结果
//		if(SignUtil.checkSignature(signature, timestamp, nonce)){
//			return echostr;
//		}
//		return "error";
//	}
//	
//	@RequestMapping(method=RequestMethod.POST,produces="text/html;charset=UTF-8")
//	@ResponseBody
//	public String Message(HttpServletRequest request,String timestamp,String nonce,String signature){
//		if(SignUtil.checkSignature(signature, timestamp, nonce)){
//			return weiXinService.getXML(request);
//		}
//		return "error";
//	}
//
//	//获取Code并重定向到方法http://www.pplhc.cn/check/returnJsp.do
//	@RequestMapping("/getOAuthCode")
//	public String getOAuthCode(String redirect,HttpSession session){               
//		//获取Code
//		return "redirect:"+weiXinService.getOAuthCode(session,redirect);
//	}
//	
//	@RequestMapping("/returnJsp")
//	public String returnJsp(HttpSession session,String code,String state){
//		weiXinService.getOAuthOpenidToken(code,session);
//		return "redirect:http://www.pplhc.cn/"+state+".jsp";
//	}
//	
////	@RequestMapping("/orderAndPay")
////	@ResponseBody
////	public PayJSAPI orderAndPay(HttpServletRequest request,Order order,String payMoney,String isit,int maxMoney){
////		//单位时间毫秒
////		long time=System.currentTimeMillis();
////		Date orderSubmitTime=new Date(time);
////		order.setSubmitTime(orderSubmitTime);
////		if (order.getOrderInfo()==null&&order.getOrderInfo().equals("")) {
////			order.setOrderInfo("10元");
////		}
////		order.setOrderState(0);
////		order.setRechargeTime("");
////		order.setOperator(MobileUtil.verPhone(order.getPhone()));
////		order.setRealMoney(WeiXinPayUtil.verMoney(payMoney)/100);
////		order.setOrderID(WeiXinPayUtil.createCompanyOrderNumber());
////		order.setOrderInfo(order.getOrderInfo()+"话费");
////		if (userService.insertOrder(order, isit, maxMoney)) {
////			String return_url="http://www.pplhc.cn/check/orderPaySuccess.do";
////			return weiXinService.weiXinPay(request, order, time, return_url);
////		}
////		return null;
////	}
//
////	@RequestMapping("/orderPaySuccess")
////	@ResponseBody
////	public String orderPaySuccess(HttpServletRequest request){
////		Map<String, String> map=MessageUtil.parseXML(request);
////		if (map.get("result_code").equals("SUCCESS")) {
////			weiXinService.updateOrderState_PaySuccess(map.get("out_trade_no"));
////		}
////		return "<xml><return_code><![CDATA["+map.get("result_code")+"]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
////	}
//
//	@RequestMapping("/getLimit")
//	@ResponseBody
//	public String getLimit(HttpSession session,String openId,String orderInfo){
//		User user=(User) session.getAttribute("user");
//		return userService.ver_Limit(session,openId, user.getMaxMoney(),user.getIsit(),orderInfo);
//	}
//
//	//订单分页查询
//	@RequestMapping("/orderPaging")
//	@ResponseBody
//	public Page orderPaging(String openId,Page page){
//		return pageService.orderPaging(openId, page);
//	}
//
//	@RequestMapping("/memberPaging")
//	@ResponseBody
//	public Page memberPaging(String openId,Page page){
//		return userService.memberPaging(openId, page);
//	}
//
//	//重新从微信接口获取AccessToken
//	@RequestMapping("/getAccessToken")
//	public void getAccessToken(){
//		getAccessToken.insertAccessToken();
//	}
//
//	//创建菜单
//	@RequestMapping("/createMenu")
//	public void createMenu(){
//		//创建菜单
//		MenuUtil.createMenu(getAccessToken.getAccess_token().getString("access_token"));
//	}
}
