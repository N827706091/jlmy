<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
	<title>后台管理系统</title>
	<meta name="author" content="DeathGhost" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script src="js/jquery.js"></script>
	<link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="file-upload/css/default.css">
    <link rel="stylesheet" type="text/css" href="file-upload/css/fileinput.css" media="all"/>
    <script src="file-upload/js/fileinput.js" type="text/javascript"></script>
    <script src="file-upload/js/locales/zh.js" type="text/javascript"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/back_css/style.css" />
	<script src="js/back_js/jquery.mCustomScrollbar.concat.min.js"></script>
	<style type="text/css">
		table, table tr,table tr th,table tr td{border-color: #FFFFFF;}
		th,tr{text-align: center;}
		.pop_cont{width: 400px;}
		.text_box{width:300px;height: 30px;line-height: 25px;}
		.pop_cont_text p{font-size: 11px;color: red;}
		#NavImageInfo td{float: left;width: 33.3%;position: relative;}
		#NavImageInfo tr td img{z-index: 1;}
		#NavImageInfo tr td span{
				visibility:hidden;
				display:block;
				position:absolute;
				width: 30px;
				height: 30px;
				z-index:99;
				left:80%;
				top:5px;
				text-align:center;
				line-height:50px;
				color:#a01331;
				font-size:13px;
				background:url('images/back_images/icon/delete.png') no-repeat 0 0px;
		}
		#NavImageInfo tr td span:hover{ cursor:pointer;}
	</style>
	<script type="text/javascript">
		//var str='';
		//显示图片右上角删除按钮
    	function show(thisObj){
    		$(thisObj).children('span').css('visibility','visible');
    	}
    	//隐藏图片右上角删除按钮
    	function hide(thisObj){
    		$(thisObj).children('span').css('visibility','hidden');
    	}
		function updateSmallIcon(iconName) {
			//alert(iconName);
			$('.pop_cont_input').html('<input id="smallIcon" type="file" name="file" multiple/>');
   			$('#smallIcon').fileinput({
    	        language: 'zh',
    	        maxFileCount: 1,
    	        uploadUrl: 'backOther/updateSmallIcon.do',
    	        allowedFileExtensions : ['jpg', 'png','gif'],
    	        uploadExtraData : {'iconName':iconName},
    	    });   
   	        //这是提交完成后的回调函数    
   	     	$("#smallIcon").on("fileuploaded", function (event, data, previewId, index) {  
   	        	alert("修改成功！");
   	     	});
   	        $('.pop_cont_text').hide();
   			$('.pop_bg').fadeIn();
		}
		var imageTemp='';
		var hrefInfo='';
		function updateImage(imageName) {
			//alert(imageTemp+"---"+imageName);
			if (imageName!=imageTemp) {
				//alert("666");
				$.ajaxSetup({async:false});
				$.post('backOther/getHrefInfo.do',{'imageName':imageName},function(data){
					hrefInfo=data.href;
				});	
			}
			//alert(hrefInfo);
			$('#info').val(hrefInfo);
			imageTemp=imageName;
			$('.pop_cont_input').html('<input id="updateImage" type="file" name="file" multiple/>');
			$('#updateImage').fileinput({
    	        language: 'zh',
    	        maxFileCount: 1,
    	        uploadUrl: 'backOther/updateIndexImage.do',
    	        showUpload: false,
    	        initialCaption: "当前最多可选择1张图片",
    	        allowedFileExtensions : ['jpg', 'png','gif'],
    	        uploadExtraData : function(previewId, index){
    	        	//动态获取参数值
    	        	var data={"imageName":imageName,"href":$('#info').val()};
    	        	//alert(data);
    	        	return data;
    	        },
    	    });
  			$(".pop_bg").fadeIn();
		}
		function submitData() {
			$('#updateImage').fileinput('upload');
			//这是提交完成后的回调函数
   	     	$("#updateImage").on("fileuploaded", function (event, data, previewId, index) {
   	     		//alert(data.toSource());
  	     		alert("修改成功！");
   	     	}); 
		}

		function addNavIcon() {
			$('.pop_cont_input').html('<input id="addNavIcon" type="file" name="file" multiple/>');
			$('#addNavIcon').fileinput({
    	        language: 'zh',
    	        maxFileCount: 1,
    	        uploadUrl: 'backOther/addNavIcon.do',
    	        initialCaption: "当前最多可选择1张图片",
    	        allowedFileExtensions : ['jpg', 'png','gif'],
    	        uploadExtraData : function(previewId, index){
    	        	//动态获取参数值
    	        	var data={"goodOrHref":$('#goodOrHref').val(),"info":$('#info').val(),"areaID":1};
    	        	return data;
    	        },
    	    });
			//这是提交完成后的回调函数
   	     	$("#updateImage").on("fileuploaded", function (event, data, previewId, index) {  
   	        	alert("修改成功！");
   	     	}); 
   	    	$(".pop_bg").fadeIn();
		}

		function getIndexHrefInfos() {
			$.post('backOther/getIndexHrefInfos.do',{'areaID':1},function(data){
				//alert(data);
				var dataInfo='<tr>';
				for (var i = 0; i < data.length; i++) {
					if (i%3==0 && i!=0) {
						dataInfo+='</tr><tr>';
					}
					dataInfo+='<td onmouseover="show(this)" onmouseout="hide(this)" ><span>删除</span><img src="'+data[i].path+'" onclick="updateImage(\''+data[i].imageName+'\')" width="100%"/></td>';
					//alert(dataInfo);
				}
				dataInfo+='</tr>';
				//alert(dataInfo);
				$('#NavImageInfo').html(dataInfo);
			});
		}
		

		$(function(){
			getIndexHrefInfos();
			//弹出文本性提示框
			$("#showPopTxt").click(function(){
				$(".pop_bg").fadeIn();
			});
			//弹出：确认按钮
			$(".trueBtn").click(function(){
				//alert("你点击了确认！");//测试
				$(".pop_bg").fadeOut();
			});
			//弹出：取消或关闭按钮
			$(".falseBtn").click(function(){
				//alert("你点击了取消/关闭！");//测试
				$(".pop_bg").fadeOut();
			});
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
    <dd><a href="#" class="active">商品列表</a></dd>
    <dd><a href="#">商品分类</a></dd>
    <dd><a href="#">商品属性</a></dd>
    <dd><a href="#">品牌管理</a></dd>
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

<section class="rt_wrap content mCustomScrollbar height2000">
<div class="rt_content">
<!--开始：以下内容则可删除，仅为素材引用参考-->
<h1 style="color:red;font-size:20px;font-weight:bold;text-align:center;">点击对应区域编辑微信页面显示内容</h1>
<!--弹出框效果-->
	<section class="pop_bg">
		<div class="pop_cont">
			<h3>切换首页图片轮播图片</h3>
			<div class="pop_cont_input">
				
			</div>
			<div class="pop_cont_text">
				<p>例：商品：goodInfo.jsp?goodID=id &emsp; 链接：front.do?toName=页面名</p>
				<label>请输入链接地址：</label>
				<input name="info" id="info" class="text_box" type="text" placeholder="请输入链接地址"/>
			</div>
			<div class="btm_btn">
				<input onclick="submitData()" type="button" value="确认" class="input_btn trueBtn"/>
				<input type="button" value="关闭" class="input_btn falseBtn"/>
			</div>
		</div>
	</section>
	<!--结束：弹出框效果-->
	<section>
		<div style=" background-color:#19A97B; width:40%; margin:0 auto">
			<table border="1">
				<tr>
					<th colspan="3">
						<a class="link_btn" style="float: left;margin: 8px 5px;" onclick="addNavIcon()">添加新图片</a>
						<h3><font size="+2" style="margin-left: -13%;">商城图片轮播</font></h3>
					</th>
				</tr>
				<tbody id="NavImageInfo">
					<tr>
						<td onmouseover="show(this)" onmouseout="hide(this)">
							<span>删除</span>
							<img src="images/indexGDXC1.jpg" width="100%"/>
						</td>
						<td  onmouseover="show(this)" onmouseout="hide(this)">
							<span>删除</span>
							<img src="images/indexGDXC1.jpg" width="100%"/>
						</td>	
						<td  onmouseover="show(this)" onmouseout="hide(this)">
							<span>删除</span>
							<img src="images/indexGDXC1.jpg" width="100%"/>
						</td>
					</tr>
					<tr>
						<td onmouseover="show(this)" onmouseout="hide(this)">
							<span>删除</span>
							<img src="images/indexGDXC1.jpg" width="100%"/>
						</td>
						<td  onmouseover="show(this)" onmouseout="hide(this)">
							<span>删除</span>
							<img src="images/indexGDXC1.jpg" width="100%"/>
						</td>	
						<td  onmouseover="show(this)" onmouseout="hide(this)">
							<span>删除</span>
							<img src="images/indexGDXC1.jpg" width="100%"/>
						</td>
					</tr>
				</tbody>
				 
				
			</table>
			<table style="margin:0px auto;width: 100%;margin-bottom: 10px;">
				<tr>
					<th colspan="5"><h3><font size="+2">商城小图标</font></h3></th>
				</tr>
				<tr align="center">
					<td><img onclick="updateSmallIcon('1_small_icon.png')" src="/jlmytk/SHOP_INDEX/SMALLICON/1_small_icon.png" width="60%"/></td>
					<td><img onclick="updateSmallIcon('2_small_icon.png')" src="/jlmytk/SHOP_INDEX/SMALLICON/2_small_icon.png" width="60%"/></td>
					<td><img onclick="updateSmallIcon('3_small_icon.png')" src="/jlmytk/SHOP_INDEX/SMALLICON/3_small_icon.png" width="60%"/></td>
					<td><img onclick="updateSmallIcon('4_small_icon.png')" src="/jlmytk/SHOP_INDEX/SMALLICON/4_small_icon.png" width="60%"/></td>
					<td><img onclick="updateSmallIcon('class_small_icon.png')" src="/jlmytk/SHOP_INDEX/SMALLICON/class_small_icon.png" width="60%"/></td>
				</tr>
				<tr>
					<td>美甲</td>
					<td>美睫</td>
					<td>美容</td>
					<td>纹绣</td>
					<td>分类</td>
				</tr>
			</table>
			<table border="1" style=" margin:0 auto; text-align:center" >
				<tr>
					<td onclick="updateImage('area2.png')" style="width:40%" rowspan="2"><img class="tb_pic" src="/jlmytk/A_INDEX/area2.png" style="width:100%;"></td>
					<td onclick="updateImage('area3.png')" colspan="2"><img class="tb_pic" src="/jlmytk/A_INDEX/area3.png" style="width:100%;"></td>
				</tr>
				<tr>
						
					<td onclick="updateImage('area4_1.png')"><img class="tb_pic" src="/jlmytk/A_INDEX/area4_1.png" style="width:100%;"></td>
					<td onclick="updateImage('area4_2.png')"><img class="tb_pic" src="/jlmytk/A_INDEX/area4_2.png" style="width:100%;"></td>
				</tr>
			</table>
			
			
			
			<table border="1" style=" text-align:center;width: 100%">
				<tr>
					<th colspan="2"><h3><font size="+2">商城美甲推荐</font></h3></th>
				</tr>
				<tr>
					<td onclick="updateImage('area5.jpg')" rowspan="2"><img class="tb_pic" src="/jlmytk/A_INDEX/area5.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area6_1.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area6_1.jpg" style="width:100%;"></td>
				</tr>
				<tr>
					<td onclick="updateImage('area6_2.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area6_2.jpg" style="width:100%;"></td>
				</tr>
			</table>
			<table border="1" style=" text-align:center">
				<tr>
					<td onclick="updateImage('area7_1.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area7_1.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area7_2.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area7_2.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area7_3.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area7_3.jpg" style="width:100%;"></td>
				</tr>
			</table>
			
			<table border="1" style=" text-align:center;width: 100%;">
				<tr>
					<th colspan="2"><h3><font size="+2">商城美睫毛推荐</font></h3></th>
				</tr>
				<tr>
					<td onclick="updateImage('area8_1.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area8_1.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area9.jpg')" rowspan="2"><img class="tb_pic" src="/jlmytk/A_INDEX/area9.jpg" style="width:100%;"></td>
				</tr>
				<tr>
					<td onclick="updateImage('area8_2.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area8_2.jpg" style="width:100%;"></td>
				</tr>
			</table>
			<table border="1" style=" text-align:center;width: 100%;">
				<tr>
					<td onclick="updateImage('area10_1.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area10_1.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area10_2.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area10_2.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area10_3.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area10_3.jpg" style="width:100%;"></td>
				</tr>
			</table>
			
			<table border="1" style=" text-align:center;width: 100%;">
				<tr>
					<th colspan="2"><h3><font size="+2">商城美容推荐</font></h3></th>
				</tr>
				<tr>
					<td onclick="updateImage('area11.jpg')" rowspan="2"><img class="tb_pic" src="/jlmytk/A_INDEX/area11.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area12_1.jpg')" style=" border-color:#CCCCCC"><img class="tb_pic" src="/jlmytk/A_INDEX/area12_1.jpg" style="width:100%;"></td>
				</tr>
				<tr>
					<td onclick="updateImage('area12_2.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area12_2.jpg" style="width:100%;"></td>
				</tr>
			</table>
			<table border="1" style=" text-align:center">
				<tr>
					<td onclick="updateImage('area13_1.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area13_1.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area13_2.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area13_2.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area13_3.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area13_3.jpg" style="width:100%;"></td>
				</tr>
			</table>
			<table border="1" style=" text-align:center">
				<tr>
					<th colspan="2"><h3><font size="+2">商城纹绣推荐</font></h3></th>
				</tr>
				<tr>
					<td onclick="updateImage('area14_1.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area14_1.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area15.jpg')" rowspan="2"><img class="tb_pic" src="/jlmytk/A_INDEX/area15.jpg" style="width:100%;"></td>
				</tr>
				<tr>
					<td onclick="updateImage('area14_2.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area14_2.jpg" style="width:100%;"></td>
				</tr>
			</table>
			<table border="1" style=" text-align:center">
				<tr>
					<td onclick="updateImage('area16_1.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area16_1.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area16_2.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area16_2.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area16_3.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area16_3.jpg" style="width:100%;"></td>
				</tr>
			</table>
		</div>
	 </section>
 </div>
</section>
</body>
</html>
