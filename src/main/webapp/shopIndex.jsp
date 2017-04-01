<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="yes" name="apple-touch-fullscreen">
	<meta content="telephone=no" name="format-detection">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1;user-scalable=no;">
	<title>商城</title>
	<link rel="stylesheet" href="css/front_css/bootstrap.css?v=01291">
	<link rel="stylesheet" href="css/front_css/style.css?v=1?v=01291">
	<link rel="stylesheet" href="css/front_css/member.css?v=01291">
	<link rel="stylesheet" href="css/front_css/order.css?v=01291">
	<script charset="utf-8" src="js/jquery.js"></script>
	<script charset="utf-8" src="js/front_js/global.js?v=01291"></script>
	<script charset="utf-8" src="js/front_js/bootstrap.min.js?v=01291"></script>
	<script charset="utf-8" src="js/front_js/template.js?v=01291"></script>
	<script charset="utf-8" src="js/front_js/TouchSlide.js"></script>
	<style type="text/css">
		.my li {width: 50%;float: left;display: block;} 
	</style>
	<script type="text/javascript">
		$(function(){
			$('#searchGood').click(function(){
				var goodName=$('#keyword').val();
				location.href='searchGood.jsp?goodName='+goodName;
			});
		});
	</script>
</head>
<body>
<header class="header">
	<div class="fix_nav">
	<div style="max-width:768px;margin:0 auto;height: 44px;position: relative; background-color:#FFFFFF">
		<form action="" method="get" id="searchform" name="searchform">
			<div class="navbar-search left-search">
				<input type="text" id="keyword" name="keyword" value="" placeholder="搜索商品" class="form-control"/>
			</div>
			<div class="nav-right">
				<input id="searchGood" border="3" type="button" value="搜索" class="img-responsive" style=" text-align:center; border-radius: 5px;border:none;height:34px;vertical-align:middle;clear:both;padding:0px;width:42px;"/>
			</div>
		</form>
	</div>
	</div>
</header>

<div class="container">
	<div class="row">
		<div id="slide">
			<div class="hd"><ul><li class="on">1</li><li class="on">2</li><li class="on">3</li></ul></div>
			<div class="bd">
			<div class="tempWrap" style="overflow:hidden; position:relative;">
				<ul style="width: 3840px; position: relative; overflow: hidden; padding: 0px; margin: 0px; transition-duration: 200ms; transform: translateX(-768px);">
	            	<li style="display: table-cell; vertical-align: top; width: 768px;">
	   	            	<a href="#" target="_blank"><img src="img/0da8eb94-0159-4700-a6a5-bc007da5a853.jpg"></a>
	   	            </li>
	                <li style="display: table-cell; vertical-align: top; width: 768px;">
	   	            	<a href="#" target="_blank"><img src="img/61647775-f5d0-4cfe-b84f-96060eb8e2e3.jpg"></a>
	   	            </li>
	                <li style="display: table-cell; vertical-align: top; width: 768px;">
	   	                <a href="#" target="_blank"><img src="img/efa1dc7b-1375-4876-acae-e344cae7d55c.jpg"></a>
	   	            </li>
	   	        </ul>
            </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
	
	TouchSlide({
		slideCell:"#slide",
		titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
		mainCell:".bd ul",
		effect:"left",
		autoPlay:true,//自动播放
		autoPage:true, //自动分页
		switchLoad:"_src" //切换加载，真实图片路径为"_src"
	});
	</script>
<div class="row category">
        
		<table bordercolor="#FFFFFF" border="2">
			<tr>	
				<td><a href=""><img class="tb_pic" src="/jlmytk/A_INDEX/SMALLICON/shop_small_icon_1.png" ><h4>美甲</h4></a></td>
				<td><a href=""><img class="tb_pic" src="/jlmytk/A_INDEX/SMALLICON/shop_small_icon_2.png" ><h4>美睫</h4></a></td>
				<td><a href=""><img class="tb_pic" src="/jlmytk/A_INDEX/SMALLICON/shop_small_icon_3.png" ><h4>美容</h4></a></td>
				<td><a href=""><img class="tb_pic" src="/jlmytk/A_INDEX/SMALLICON/shop_small_icon_4.png" ><h4>纹绣</h4></a></td>
				<td><a href=""><img class="tb_pic" src="/jlmytk/A_INDEX/SMALLICON/shop_small_icon_5.png" ><h4>分类</h4></a></td>
			</tr>
		</table>
    </div>
    
<div class="row">
		<!--产品块-->
		<div class="tb_type tb_type_even clearfix">	
				<table bordercolor="#FFFFFF" border="2">
					<tr>
						<td style="width:40%" rowspan="2"><img class="tb_pic" src="/jlmytk/A_INDEX/area2.png" style="width:100%;"></td>
						<td colspan="2"><img class="tb_pic" src="/jlmytk/A_INDEX/area3.png" style="width:100%;"></td>
					</tr>
					<tr>
						
						<td><img class="tb_pic" src="/jlmytk/A_INDEX/area4_1.png" style="width:100%;"></td>
						<td><img class="tb_pic" src="/jlmytk/A_INDEX/area4_2.png" style="width:100%;"></td>
					</tr>
				</table>
		</div>
		
		<div class="tb_box" style=" margin-top:10px">
			<h2 class="tab_tit">
				<a class="more" href="shopping mall manicure.html">更多</a>
				美甲推荐</h2>
			<div class="tb_type tb_type_even clearfix">
				<table bordercolor="#FFFFFF" border="2" style=" text-align:center">
						<tr>
							<td rowspan="2" style=" border-color:#CCCCCC"><img class="tb_pic" src="/jlmytk/A_INDEX/area5.jpg" style="width:100%;"></td>
							<td style=" border-color:#CCCCCC"><img class="tb_pic" src="/jlmytk/A_INDEX/area6_1.jpg" style="width:100%;"></td>
						</tr>
						<tr>
							<td><img class="tb_pic" src="/jlmytk/A_INDEX/area6_2.jpg" style="width:100%;"></td>
						</tr>
				</table>
				<table bordercolor="#CCCCCC" border="1" style=" text-align:center">
						<tr>
							<td style=" border-color:#CCCCCC;"><img class="tb_pic" src="/jlmytk/A_INDEX/area7_1.jpg" style="width:100%;"></td>
							<td style=" border-color:#CCCCCC;"><img class="tb_pic" src="/jlmytk/A_INDEX/area7_2.jpg" style="width:100%;"></td>
							<td style=" border-color:#CCCCCC;"><img class="tb_pic" src="/jlmytk/A_INDEX/area7_3.jpg" style="width:100%;"></td>
						</tr>
				</table>
			</div>
		</div>
		<!--产品块-->
		<div class="tb_box">
			<h2 class="tab_tit"><a class="more" href="shopping mall eyelash.html">更多</a>美睫推荐</h2>
			<div class="tb_type clearfix">
				<table bordercolor="#FFFFFF" border="2" style=" text-align:center">
						<tr>
							<td style="border-color:#CCCCCC"><img class="tb_pic" src="/jlmytk/A_INDEX/area8_1.jpg" style="width:100%;"></td>
							<td rowspan="2" style=" border-color:#CCCCCC"><img class="tb_pic" src="/jlmytk/A_INDEX/area9.jpg" style="width:100%;"></td>
						</tr>
						<tr>
							<td><img class="tb_pic" src="/jlmytk/A_INDEX/area8_2.jpg" style="width:100%;"></td>
						</tr>
				</table>
				<table bordercolor="#CCCCCC" border="1" style=" text-align:center">
						<tr>
							<td style=" border-color:#CCCCCC;"><img class="tb_pic" src="/jlmytk/A_INDEX/area10_1.jpg" style="width:100%;"></td>
							<td style=" border-color:#CCCCCC;"><img class="tb_pic" src="/jlmytk/A_INDEX/area10_2.jpg" style="width:100%;"></td>
							<td style=" border-color:#CCCCCC;"><img class="tb_pic" src="/jlmytk/A_INDEX/area10_3.jpg" style="width:100%;"></td>
						</tr>
				</table>
			</div>
		</div>
		<div class="tb_box" style=" margin-top:10px">
			<h2 class="tab_tit"><a class="more" href="shopping mall hairdressing.html">更多</a>美容推荐</h2>
			<div class="tb_type tb_type_even clearfix">
				<table bordercolor="#FFFFFF" border="2" style=" text-align:center">
						<tr>
							<td rowspan="2" style="border-color:#CCCCCC"><img class="tb_pic" src="/jlmytk/A_INDEX/area11.jpg" style="width:100%;"></td>
							<td style=" border-color:#CCCCCC"><img class="tb_pic" src="/jlmytk/A_INDEX/area12_1.jpg" style="width:100%;"></td>
						</tr>
						<tr>
							<td><img class="tb_pic" src="/jlmytk/A_INDEX/area12_2.jpg" style="width:100%;"></td>
						</tr>
				</table>
				<table bordercolor="#CCCCCC" border="1" style=" text-align:center">
						<tr>
							<td style=" border-color:#CCCCCC;"><img class="tb_pic" src="/jlmytk/A_INDEX/area13_1.jpg" style="width:100%;"></td>
							<td style=" border-color:#CCCCCC;"><img class="tb_pic" src="/jlmytk/A_INDEX/area13_2.jpg" style="width:100%;"></td>
							<td style=" border-color:#CCCCCC;"><img class="tb_pic" src="/jlmytk/A_INDEX/area13_3.jpg" style="width:100%;"></td>
						</tr>
				</table>
			</div>
		</div>		
		<!--产品块-->
		<div class="tb_box">
			<h2 class="tab_tit"><a class="more" href="shopping mall embroidered.html">更多</a>纹绣推荐</h2>
			<div class="tb_type clearfix">
				<table bordercolor="#FFFFFF" border="2" style=" text-align:center">
						<tr>
							<td style=" border-color:#CCCCCC"><img class="tb_pic" src="/jlmytk/A_INDEX/area14_1.jpg" style="width:100%;"></td>
							<td rowspan="2" style=" border-color:#CCCCCC"><img class="tb_pic" src="/jlmytk/A_INDEX/area15.jpg" style="width:100%;"></td>
						</tr>
						<tr>
							<td><img class="tb_pic" src="/jlmytk/A_INDEX/area14_2.jpg" style="width:100%;"></td>
						</tr>
				</table>
				<table bordercolor="#CCCCCC" border="1" style=" text-align:center">
						<tr>
							<td style=" border-color:#CCCCCC;"><img class="tb_pic" src="/jlmytk/A_INDEX/area16_1.jpg" style="width:100%;"></td>
							<td style=" border-color:#CCCCCC;"><img class="tb_pic" src="/jlmytk/A_INDEX/area16_2.jpg" style="width:100%;"></td>
							<td style=" border-color:#CCCCCC;"><img class="tb_pic" src="/jlmytk/A_INDEX/area16_3.jpg" style="width:100%;"></td>
						</tr>
				</table>
			</div>
		</div>
		<!--产品块-->
		<div class="tb_box">
			<h2 class="tab_tit"><a class="more" href="category.html">更多</a>猜您喜欢</h2>
			<div class="tb_type clearfix">
				<table bordercolor="#FFFFFF" border="2" style=" text-align:center">
					<tr>
						<td><a href="views.html"><img class="tb_pic" src="images/mt2.jpg" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font><h5></a></td>
						<td><img class="tb_pic" src="images/mt3.jpg" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font><h5></td>
					</tr>
					<tr>
						<td><img class="tb_pic" src="images/mt5.jpg" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font><h5></td>
						<td><img class="tb_pic" src="images/mt6.jpg" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font><h5></td>
					</tr>
					<tr>
						<td><img class="tb_pic" src="images/mt5.jpg" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font><h5></td>
						<td><img class="tb_pic" src="images/mt6.jpg" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font><h5></td>
					</tr>
					<tr>
						<td><img class="tb_pic" src="images/mt5.jpg" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font><h5></td>
						<td><img class="tb_pic" src="images/mt6.jpg" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font><h5></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<footer class="footer">
	<div class="foot-con">
		<div class="foot-con_2">
			<a href=""><i class="navIcon home"></i><span class="text">首页</span></a>
			<a href="" class="active"><i class="navIcon sort"></i><span class="text">商城</span>	</a>
			<a href=""><i class="navIcon shop"></i><span class="text">购物车</span></a>
			<a href=""><i class="navIcon member"></i><span class="text">我的</span></a>
		</div>
	</div>
</footer>
<script type="text/javascript">
	$(document).ready(function(){
		$("#slide img").each(function(){
			var img_src=$(this).attr("_src");
			$(this).attr("src",img_src);
		});
	});

	function searchproduct(){
		var keyword = document.getElementById("keyword").value;
		if(keyword == undefined || keyword==null ||keyword ==""){
	    	alert("请输入搜索关键字！");
	    	return false;
	    }
	    document.getElementById("searchform").submit();
	}
</script>
</body></html>