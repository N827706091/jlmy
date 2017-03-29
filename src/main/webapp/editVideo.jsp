<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>后台管理系统</title>
	<meta name="author" content="DeathGhost" />
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
		a:hover{text-decoration:none;}
		table,table tr th,table tr td{border: 1px solid #FFFFFF;}
		.text_box{width:300px;height: 30px;line-height: 25px;}
		#pageNow{width: 30px;border:0px; background-color:transparent; text-align:center;}
		#pageCount{padding: 5px;}
		.pop_cont{width: 500px;}
		.pop_cont_input p{color: red;margin: 5px auto;}
		#videoInfo td{position: relative;}
		#videoInfo tr td img{z-index: 1;}
		#videoInfo tr td span{
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
		#videoInfo tr td span:hover{ cursor:pointer;}
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
		var pageInfo = {
				pageNow:1,
				pageSize:15,
				pageCount:0,
		}
		function loadVideo() {
			$.post('backOther/loadVideo.do',{
				'orderBy':1,
				'pageNow':pageInfo.pageNow,
				'pageSize':pageInfo.pageSize,
			},function(data){
				pageInfo.pageCount=data.pageCount;
				var videoInfos=data.list;
				var videoInfo='<tr>';
				for (var i = 0; i < videoInfos.length; i++) {
					if (i%5==0 && i!=0) {
						videoInfo+='</tr><tr>';
					}
					videoInfo+='<td onmouseover="show(this)" onmouseout="hide(this)"><span onclick="deleteVideo('+videoInfos[i].id+',\''+videoInfos[i].videoPath+'\',\''+videoInfos[i].imagePath+'\')">删除</span><img class="tb_pic" src="'+videoInfos[i].imagePath+'" style="width:100%;"></td>';
				}
				videoInfo+='</tr>';
				$('#pageNow').val(pageInfo.pageNow);
				$('#pageCount').html(pageInfo.pageCount);
				$('#videoInfo').html(videoInfo);
			});
		}
		function deleteVideo(id,videoPath,imagePath) {
			$.post('backOther/deleteVideo.do',{
				'id':id,
				'videoPath':videoPath,
				'imagePath':imagePath,
			},function(data){
				if (true==data || 'true'==data) {
					$(thisObj).parent('td').remove();
					alert("删除成功");
				}else {
					alert("删除失败");
				}
			});
		}
		$(function(){
			loadVideo();
			//点击添加图片
			$('#addVideo').click(function(){
				$('#addVideoInput').fileinput({
			        language: 'zh',
			        maxFileCount: 1,
			        maxFileSize: 0,
			        uploadUrl: 'backOther/uploadVideo.do',
			        allowedFileExtensions : ['asx', 'asf','mpg','wmv','3gp','mp4','mov','avi','flv'],
			        uploadExtraData : function(previewId, index){
	    	        	//动态获取参数值
	    	        	var data={"videoName":$('#videoName').val()};
	    	        	//alert(data);
	    	        	return data;
	    	        },
			    });
				$(".pop_bg").fadeIn();
			});
			/*//弹出文本性提示框
			$("#showPopTxt").click(function(){
				$(".pop_bg").fadeIn();
			});*/
			//弹出：确认按钮
			$(".trueBtn").click(function(){
				$(".pop_bg").fadeOut();
			});
			//弹出：取消或关闭按钮
			$(".falseBtn").click(function(){
				$(".pop_bg").fadeOut();
			});
			//第一页
			$('#first').click(function(){
				pageInfo.pageNow=1;
				loadVideo();
			});
			//上一页
			$('#before').click(function(){
				if(pageInfo.pageNow<=1){
					//alert('已经是第一页了');
				}else{
					pageInfo.pageNow-=1;
					loadVideo();
				}
			});
			//下一页
			$('#next').click(function(){
				if(pageInfo.pageNow>=pageInfo.pageCount){
					//alert('已经是最后一页了');
				}else{
					pageInfo.pageNow+=1;
					loadVideo();
				}
			});
			//最后一页
			$('#end').click(function(){
				pageInfo.pageNow=pageInfo.pageCount;
				loadVideo();
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
 <h2><a href="#">起始页</a></h2>
 <ul>
  	<li>
	   <dl>
			<dt>首页</dt>
			 <!--当前链接则添加class:active-->
			<dd><a href="index redact.html">首页编辑</a></dd>
			<dd><a href="#" class="active">京翎美图</a></dd>
			<dd><a href="index manicure course HT.html">美甲教程</a></dd>
			<dd><a href="index video HT.html">精彩视频</a></dd>
			<dd><a href="index activity HT.html">京翎活动</a></dd>
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
    <dt>商品信息</dt>
    <!--当前链接则添加class:active-->
    <dd><a href="CommodityList.html">商品列表</a></dd>
    <dd><a href="CommodityClass.html">商品分类</a></dd>
	<dd><a href="AddCommodity.html">添加新商品</a></dd>
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
	<!--弹出框效果-->
		<section class="pop_bg">
			<div class="pop_cont">
				<h3>添加视频</h3>
				<div class="pop_cont_input">
					<p>*请上传后缀名为.asx .asf .mpg .wmv .3gp .mp4 .mov .avi .flv'格式的视频*</p>
					<input id="addVideoInput" type="file" name="file" multiple/>
				</div>
				<div class="pop_cont_text">
					<label>请输入视频名称：</label>
					<input class="text_box" type="text" id="videoName" placeholder="请输入视频名称"/>
				</div>
				<div class="btm_btn">
					<input type="button" value="确认" class="input_btn trueBtn"/>
					<input type="button" value="关闭" class="input_btn falseBtn"/>
				</div>
			</div>
		</section>
     <!--结束：弹出框效果-->
	 <section>
	 <!-- <div style=" position: absolute; top:10px; left:5px"><button class="link_btn" id="showPopTxt">添加新图片</button></div> -->
	 <div style="width:100%; margin:0 auto">
	 	<table style="margin-top: 1px;">
	 	<thead>
	 		<tr>
				<th style="height: 40px;background-color: #d8dadc;text-align: center;" colspan="5">
					<button class="link_btn" style="float: left;margin: 5px 5px;" id="addVideo">添加新图片</button>
					<font style="font-size: 26px;line-height: 40px">京翎美图</font>
				</th>
			</tr>
	 	</thead>
	 	<tbody id="videoInfo">
	 		<!-- <tr>
            	<td onmouseover="show(this)" onmouseout="hide(this)"><span>删除</span><img class="tb_pic" src="images/mt1.JPG" style="width:100%;"></td>
				<td onmouseover="show(this)" onmouseout="hide(this)"><span>删除</span><img class="tb_pic" src="images/mt2.JPG" style="width:100%;"></td>
				<td onmouseover="show(this)" onmouseout="hide(this)"><span>删除</span><img class="tb_pic" src="images/mt3.JPG" style="width:100%;"></td>
				<td onmouseover="show(this)" onmouseout="hide(this)"><span>删除</span><img class="tb_pic" src="images/mt1.JPG" style="width:100%;"></td>
				<td onmouseover="show(this)" onmouseout="hide(this)"><span>删除</span><img class="tb_pic" src="images/mt1.JPG"  style="width:100%;"></td>
			</tr>
			<tr>
				<td><img class="tb_pic" src="images/mt4.JPG" style="width:100%;"></td>
				<td><img class="tb_pic" src="images/mt5.JPG" style="width:100%;"></td>
				<td><img class="tb_pic" src="images/mt6.JPG" style="width:100%;"></td>
				<td><img class="tb_pic" src="images/mt1.JPG" style="width:100%;"></td>
				<td><img class="tb_pic" src="images/mt1.JPG" style="width:100%;"></td>
			</tr>
			<tr>
				<td><img class="tb_pic" src="images/mt4.JPG" style="width:100%;"></td>
				<td><img class="tb_pic" src="images/mt5.JPG" style="width:100%;"></td>
				<td><img class="tb_pic" src="images/mt6.JPG" style="width:100%;"></td>
				<td><img class="tb_pic" src="images/mt1.JPG" style="width:100%;"></td>
				<td><img class="tb_pic" src="images/mt1.JPG" style="width:100%;"></td>
			</tr>
			 -->
	 	</tbody>
		</table>
		<aside class="paging">
       		<a id="first">第一页</a>
	    	<a id="before">上一页</a>
	       	<a>第<input id="pageNow" value="0"/>页，共<font id="pageCount">0</font>页</a>
	       	<a id="next">下一页</a>
		   	<a id="end">最后一页</a>
      	</aside>
		</div>
	 </section>
</div>
</section>
</body>
</html>