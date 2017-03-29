<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>后台管理系统</title>
	<meta name="author" content="DeathGhost" />
	<link rel="stylesheet" type="text/css" href="css/back_css/style.css" />
	<script src="js/jquery.js"></script>
	<script src="js/back_js/jquery.mCustomScrollbar.concat.min.js"></script>
    <style type="text/css">
    	.myIframe{
     		width: 100%;
     		border: 0px;
     		min-height: 900px;
     	}
    </style>
    <script type="text/javascript">
    	//iframe框架自适应高度
		function reinitIframe(){
			var iframe = document.getElementById("iframepage");
			try{
				var bHeight = iframe.contentWindow.document.body.scrollHeight;
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.max(bHeight, dHeight);
				iframe.height = height;
				console.log(height);
			}catch (ex){}
		}
		window.setInterval("reinitIframe()", 200);

		function getParam(name) {
		    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		    var r = window.location.search.substr(1).match(reg);
		    if ( r != null ){
		       return decodeURI(r[2]);
		    }else{
		       return null;
		    } 
		 }

		var count=0;
		$(function() {
			var iframe = document.createElement("iframe");
		    iframe.id = "iframepage";
		    document.getElementById("content").appendChild(iframe);
		    $('#iframepage').attr('class','myIframe');
		    iframe.src = "addGood_S.jsp";
		    iframe.onload = function(){return false;};
		    //获取页面传过来的参数
		    var goodID=getParam('goodID');
		    if (null!=goodID || ''==goodID) {
		    	$('#goodID').val(goodID);	
			}
		});
	</script>
</head>
<body>
	
<!--header-->
<header>
	<h1><img src="images/back_images/admin_logo.png"/></h1>
	<ul class="rt_nav">
  		<li><a href="http://www.baidu.com" target="_blank" class="website_icon">站点首页</a></li>
  		<li><a href="#" class="admin_icon">DeathGhost</a></li>
  		<li><a href="#" class="set_icon">账号设置</a></li>
  		<li><a href="login.php" class="quit_icon">安全退出</a></li>
	</ul>
</header>

<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
 <h2><a href="index.php">起始页</a></h2>
 <ul>
  <li>
   <dl>
    <dt>商品信息</dt>
    <!--当前链接则添加class:active-->
    <dd><a href="#">商品列表</a></dd>
    <dd><a href="#">商品分类</a></dd>
    <dd><a href="#">商品属性</a></dd>
    <dd><a href="#" class="active">添加商品</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>订单信息</dt>
    <dd><a href="#">订单列表</a></dd>
    <dd><a href="#">添加订单</a></dd>
    <dd><a href="#">缺货登记</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>会员管理</dt>
    <dd><a href="#">会员列表</a></dd>
    <dd><a href="#">添加会员</a></dd>
    <dd><a href="#">会员等级</a></dd>
    <dd><a href="#">资金管理</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>基础设置</dt>
    <dd><a href="#">站点基础设置</a></dd>
    <dd><a href="#">SEO设置</a></dd>
    <dd><a href="#">SQL语句查询</a></dd>
    <dd><a href="#">模板管理</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>营销管理</dt>
    <dd><a href="#">订阅列表</a></dd>
    <dd><a href="#">邮件群发</a></dd>
    <dd><a href="#">优惠打折</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>配送与支付设置</dt>
    <dd><a href="#">配送方式</a></dd>
    <dd><a href="#">支付方式</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>在线统计</dt>
    <dd><a href="#">流量统计</a></dd>
    <dd><a href="#">销售额统计</a></dd>
   </dl>
  </li>
  <li>
   <p class="btm_infor">© 望唐集团 版权所有</p>
  </li>
 </ul>
</aside>

<section class="rt_wrap content mCustomScrollbar">
	<input type="hidden" id="goodID" value="0"/>
	<div id="content" class="rt_content">
		<!-- <iframe id="iframepage" class="myIframe" src="addGood_S.jsp" onload="this.height=100"></iframe> -->
 	</div>
</section>
</body>
</html>