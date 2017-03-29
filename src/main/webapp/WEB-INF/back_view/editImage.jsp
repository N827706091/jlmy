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
		table, table tr, table tr th, table tr td{border: 1px solid #FFF;}
		th,tr,td{text-align: center;}
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
			$('.pop_cont_input').html('<input id="fileSubmit" type="file" name="file" multiple/>');
			$('#fileSubmit').fileinput({
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
			$('#fileSubmit').fileinput('upload');
			//这是提交完成后的回调函数
   	     	$("#fileSubmit").on("fileuploaded", function (event, data, previewId, index) {
   	     		//alert(data.toSource());
  	     		alert("成功！");
   	     	}); 
		}

		function addNavIcon() {
			$('.pop_cont_input').html('<input id="fileSubmit" type="file" name="file" multiple/>');
			$('#fileSubmit').fileinput({
    	        language: 'zh',
    	        maxFileCount: 1,
    	        uploadUrl: 'backOther/addNavIcon.do',
    	        showUpload: false,
    	        initialCaption: "当前最多可选择1张图片",
    	        allowedFileExtensions : ['jpg', 'png','gif'],
    	        uploadExtraData : function(previewId, index){
    	        	//动态获取参数值
    	        	var data={"info":$('#info').val(),"areaID":101};
    	        	return data;
    	        },
    	    });
			//这是提交完成后的回调函数
   	     	//$("#fileSubmit").on("fileSubmit", function (event, data, previewId, index) {  
   	        	//alert("修改成功！");
   	     	//}); 
   	    	$(".pop_bg").fadeIn();
		}

		function getIndexHrefInfos() {
			$.post('backOther/getIndexHrefInfos.do',{'areaID':101},function(data){
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
 <h2><a href="index.html">起始页</a></h2>
 <ul>
  <li>
	   <dl>
			<dt>首页</dt>
			 <!--当前链接则添加class:active-->
			<dd><a href="index redact.html">首页编辑</a></dd>
			<dd><a href="index picture HT.html">京翎美图</a></dd>
			<dd><a href="index manicure course HT.html">美甲教程</a></dd>
			<dd><a href="index video HT.html" >精彩视频</a></dd>
			<dd><a href="#" class="active">京翎活动</a></dd>
	   </dl>
  	</li>
	
	<li>
	   <dl>
			<dt>商城</dt>
			 <!--当前链接则添加class:active-->
			<dd><a href="index redact.html">商城编辑</a></dd>
			<dd><a href="#">美甲</a></dd>
			<dd><a href="#">美睫</a></dd>
			<dd><a href="#">美容</a></dd>
			<dd><a href="#">纹绣</a></dd>
			<dd><a href="#">分类</a></dd>
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
<div class="rt_content">
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
		<div style=" background-color:#19A97B; width:40%;  margin:0 auto">
			<!-- 101 -->
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
					<td onmouseover="show(this)" onmouseout="hide(this)"><span>删除</span><img src="images/indexGDXC1.jpg" width="100%"/></td>
					<td onmouseover="show(this)" onmouseout="hide(this)"><span>删除</span><img src="images/indexGDXC1.jpg" width="100%"/></td>
				</tr>
				</tbody>
			</table>
			<table style="margin:0 auto;width: 100%;margin-bottom: 10px;">
				<tr>
					<th colspan="4"><h3><font size="+2">首页小图标</font></h3></th>
				</tr>
				<tr>
					<td><img src="/jlmytk/A_INDEX/SMALLICON/index_small_icon_1.png" onclick="updateSmallIcon('index_small_icon_1.png')"/></td>
					<td><img src="/jlmytk/A_INDEX/SMALLICON/index_small_icon_2.png" onclick="updateSmallIcon('index_small_icon_2.png')"/></td>
					<td><img src="/jlmytk/A_INDEX/SMALLICON/index_small_icon_3.png" onclick="updateSmallIcon('index_small_icon_3.png')"/></td>
					<td><img src="/jlmytk/A_INDEX/SMALLICON/index_small_icon_4.png" onclick="updateSmallIcon('index_small_icon_4.png')"/></td>
				</tr>
				<tr>
					<td>京翎美图</td>
					<td>美甲教程</td>
					<td>精彩视频</td>
					<td>京翎活动</td>
				</tr>
			</table>
			<!-- 102 -->
			<table>
				<tr>
					<th colspan="4"><h3><font size="+2">首页京翎美图板块</font></h3></th>
				</tr>
				<tr>
                    <td onclick="updateImage('area102_1.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area102_1.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area102_2.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area102_2.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area102_3.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area102_3.jpg" style="width:100%;"></td>
				</tr>
				<tr>
					<td onclick="updateImage('area102_4.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area102_4.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area102_5.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area102_5.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area102_6.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area102_6.jpg" style="width:100%;"></td>
				</tr>
			</table>
			<!-- 103 -->
			<table>
				<tr>
					<th colspan="2"><h3><font size="+2">首页美甲教程</font></h3></th>
				</tr>
				<tr>
					<td onclick="updateImage('area103_1.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area103_1.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area103_2.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area103_2.jpg" style="width:100%;"></td>
				</tr>
				<tr>
					<td onclick="updateImage('area103_3.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area103_3.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area103_4.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area103_4.jpg" style="width:100%;"></td>
				</tr>
			</table>
			<!-- 104 -->
			<table>
				<tr>
					<td onclick="updateImage('area104_1.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area104_1.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area104_2.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area104_2.jpg" style="width:100%;"></td>
					<td onclick="updateImage('area104_3.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area104_3.jpg" style="width:100%;"></td>
				</tr>
			</table>
			<!-- 105 -->
			<table>
					<tr>
						<th colspan="3"><h3><font size="+2">首页精彩视频</font></h3></th>
					</tr>
					<tr>
						<td onclick="updateImage('area105_1.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area105_1.jpg" style="width:100%;"></td>
						<td onclick="updateImage('area105_2.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area105_2.jpg" style="width:100%;"></td>
						<td onclick="updateImage('area105_3.jpg')"><img class="tb_pic" src="/jlmytk/A_INDEX/area105_3.jpg" style="width:100%;"></td>
					</tr>
				</table>
		</div>
	 </section>
	 <!--------------------------------------------------------------------------------------------------------->
     
 </div>
</section>
</body>
</html>
