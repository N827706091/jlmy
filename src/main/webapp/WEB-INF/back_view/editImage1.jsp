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
		body,td,th {
			font-size: 0.28em;
		}
		th{
			height: 35px;
			text-align: center;
			font-size: 22px;
		}
		/*.pop_cont{
			background:white;
			min-width:300px;
			max-width:69%; 
			height:auto;
			overflow:hidden;
			position:absolute;
			top:10%;
			left:20%; 
			right:10%; 
			margin-left:-150px;
			border-radius:5px 5px 0 0;
		}*/
		h3{
			font-size: 23px;
			margin-top: 5px;
		}
		.pop_cont_text img{
			width: 300px;
			margin: 2px;
		}
		#pop_colse{
			height:40px;
			line-height: 40px;
			border: 0px;
			background-color: transparent;
		}
		#ImagesUL li{ margin-left:-35px; float: left;}
		#ImagesUL li img{ position:relative; z-index: 1; width: 300px;}
		#ImagesUL li span{
				visibility:hidden;
				display:block;
				position:relative;
				width: 50px;
				height: 50px;
				z-index:99;
				left:295px;
				top:5px;
				float:left;
				text-align:center;
				line-height:50px;
				color:#a01331;
				font-size:16px;
				font-weight:bold;
				background:url('images/back_images/icon/deleteIcon.png') no-repeat 0 0px;
		}
		#ImagesUL li span:hover{ cursor:pointer;}
		.height_35{ height: 35px;}
		#SMALLICON img{ width: 60%;}
		#NavImage img{ width: 100%;}
		#JLMT img{ width: 100%;}
		#TUTORIA img{ width: 100%;}
		#jiaocheng_1 img{ width: 100%;}
		#jiaocheng_2 img{ width: 100%;}
	</style>
	<script type="text/javascript">
		var str='';
		
		//显示图片右上角删除按钮
    	function show(thisObj){
    		$(thisObj).children('span').css('visibility','visible');
    	}
    	//隐藏图片右上角删除按钮
    	function hide(thisObj){
    		$(thisObj).children('span').css('visibility','hidden');
    	}

    	function showFileInput(url,id,uploadData){
    		$('#'+id).show();
    		$('#'+id).fileinput({
    	        language: 'zh',
    	        maxFileCount: 1,
    	        uploadUrl: url,
    	        allowedFileExtensions : ['jpg', 'png','gif'],
    	        uploadExtraData : uploadData,
    	    });	
    		$("#"+id).on("fileuploaded", function (event, data, previewId, index) {  
   	        	alert("修改成功！");
   	     	}); 
    	}

    	/*function parseData(from,dirName,data){
    		//alert(from);
    		var imageInfo='';
    		for (var i = 0; i < data.length; i++) {
    			if (1==from) {
    				
					imageInfo+='<td><img src="/jlmytk/FRONT_INDEX/'+dirName+'/'+data[i]+'" width="60%"/></td>';
				}else if(2==from){
    				
				}
			}
    		return imageInfo;
    	}*/

    	function updateIcon(iconName) {
    		$('.pop_cont_text').html('<input id="navIcon" type="file" name="file" multiple/>');
    		$('#hide-p').hide();
   			$('#navIcon').fileinput({
    	        language: 'zh',
    	        maxFileCount: 1,
    	        uploadUrl: 'backOther/updateNavIcon.do?iconName='+iconName,
    	        allowedFileExtensions : ['jpg', 'png','gif'],
    	    });   
   	        //这是提交完成后的回调函数    
   	     	$("#navIcon").on("fileuploaded", function (event, data, previewId, index) {  
   	        	alert("修改成功！");
   	     	}); 
   			$(".pop_bg").fadeIn();
   			//alert(iconName);
		}

    	function getjlmt(){
    		$.post('backOther/getjlmt.do',function(data){
    			//alert(data);
    			if (''==data || '[]'==data) {
					alert("无数据");
				}else {
					var dataInfo='';
					// ia 标签 判断列数
		    		var ia=0;
		    		dataInfo+='<tr>';
		    		for ( var key in data) {
		    			if (ia%3==0 && ia!=0) {
							dataInfo+='</tr><tr>'
						}
		    			dataInfo+='<td onclick="updatejlmt(\''+key+'\')"><img src="/jlmytk/FRONT_INDEX/PRETTYIMAGE/'+key+'"/></td>';
		    			ia++;
					}
		    		dataInfo+='</tr>';
		    		//alert(dataInfo);
		    		$('#JLMT').html(dataInfo);
				}  			
    		});
    	}

    	function updatejlmt(imageName){
    		var inputHTML='<p style="color: red;margin-bottom: 5px">请输入链接地址：</p>';
    		inputHTML+='<input type="text" onchange="showFileInput(\'backOther/updatejlmy.do\',\'updatejlmt\',{\'imageName\':\''+imageName+'\',\'imageHref\':this.value})" id="imageHref" placeholder="请输入链接地址" class="textbox textbox_295 height_35"/>';
    		inputHTML+='<input id="updatejlmt" type="file" name="file" multiple/>';
    		$('.pop_cont_text').html(inputHTML);
    		$('#hide-p').hide();
   			$('#updatejlmt').hide();
   			$(".pop_bg").fadeIn();
    	}

    	function updateCourse(upOrDown,imageName) {
    		var inputHTML='<p style="color: red;margin-bottom: 5px">请输入链接地址：</p>';
    		inputHTML+='<input type="text" onchange="showFileInput(\'backOther/updateCourse.do\',\'updateCourse\',{\'imageName\':\''+imageName+'\',\'imageHref\':this.value,\'upOrDown\':'+upOrDown+'})" id="imageHref" placeholder="请输入链接地址" class="textbox textbox_295 height_35"/>';
    		inputHTML+='<input id="updateCourse" type="file" name="file" multiple/>';
    		$('.pop_cont_text').html(inputHTML);
    		$('#hide-p').hide();
   			$('#updateCourse').hide();
   			$(".pop_bg").fadeIn();
		}

    	function loadcourse() {
    		$.post('backOther/getCourse.do',function(data){
    			var up=data.up;
    			var down=data.down;
    			var courseInfo='';
    			courseInfo+='<tr>'
    			for (var i = 0; i < up.length; i++) {
    				if (i%2==0 && i!=0) {
    					courseInfo+='</tr><tr>';
					}
    				courseInfo+='<td onclick="updateCourse(1,\''+up[i]+'\')"><img class="tb_pic" src="/jlmytk/FRONT_INDEX/COURSE/UP/'+up[i]+'" ></td>';
				}
    			courseInfo+='</tr>';
    			$('#jiaocheng_1').html(courseInfo);
    			courseInfo='';
    			courseInfo+='<tr>'
    			for (var i = 0; i < down.length; i++) {
    				courseInfo+='<td onclick="updateCourse(2,\''+down[i]+'\')"><img class="tb_pic" src="/jlmytk/FRONT_INDEX/COURSE/DOWN/'+down[i]+'"></td>'
				}
    			courseInfo+='</tr>';
    			$('#jiaocheng_2').html(courseInfo);
    		});
		}

    	function loadNavImage() {
    		$.post('backOther/getImageName.do',function(data){
    			//alert(data);
    			var imageInfo='';
    			imageInfo+='<ul id="ImagesUL">';
    			for (var i = 0; i < data.length; i++) {
    				imageInfo+='<li onmouseover="show(this)" onmouseout="hide(this)"><span onclick="deleteNavImage(\''+data[i].fileName+'\',this)">删除</span>';
           			imageInfo+='<img src="/jlmytk/FRONT_INDEX/NAVIMAGE/'+data[i].fileName+'"/></li>';
				}
    			imageInfo+='</ul>';
    			//alert(imageInfo);
				$('.pop_cont_text').html(imageInfo);
			});
    		$('.pop_cont').css({'max-width':'69%','top':'10%','left':'20%','right':'10%','margin-left':'-1px'});
    		$(".pop_bg").fadeIn();
		}

    	function addNavImages() {
    		var hrefType=$('#hrefType').val();
    		var typeInfo=$('#typeInfo_input').val();
    		//alert(typeInfo);
    		if (''==typeInfo) {
				alert("请输入链接或者商品ID");
				return;
			}
    		if (1==hrefType) {
				if (isNaN(typeInfo)) {
					alert("请检查商品ID");
					return;
				}
			}
			$('.pop_cont_input').append('<input id="nav-image" type="file" name="file" multiple/>');
   			$('#nav-image').fileinput({
    	        language: 'zh',
    	        maxFileCount: 1,
    	        uploadUrl: 'backOther/addNavImage.do',
    	        allowedFileExtensions : ['jpg', 'png','gif'],
    	        uploadExtraData : {'hrefType':hrefType,'typeInfo':typeInfo},
    	    });
		}

    	function deleteNavImage(imageName,thisObj) {
    		$.post('backOther/deleteNavImage.do',{'imageName':imageName},function(data){
    			if (true==data || 'true'==data) {
    				alert("删除成功！");
    				$(thisObj).parent('li').remove();
				}
    		});
		}

    	function updateVideo(videoImageName) {
    		$('.pop_cont_text').html('<input id="videoImageName" type="file" name="file" multiple/>');
    		$('#hide-p').hide();
   			$('#videoImageName').fileinput({
    	        language: 'zh',
    	        maxFileCount: 1,
    	        uploadUrl: 'backOther/updateVideoImage.do',
    	        allowedFileExtensions : ['jpg', 'png','gif'],
    	        uploadExtraData : {'videoImageName':videoImageName},
    	    });   
   	        //这是提交完成后的回调函数    
   	     	$("#videoImageName").on("fileuploaded", function (event, data, previewId, index) {  
   	        	alert("修改成功！");
   	     	}); 
   			$(".pop_bg").fadeIn();
		}
    	$(function(){
    		getjlmt();
    		loadcourse();
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
			$("#pop_colse").click(function(){
				//alert("你点击了取消/关闭！");//测试
				$(".pop_bg").fadeOut();
			});
			//输入链接或者商品ID
			$('#hrefType').click(function(){
				var hrefType=$('#hrefType').val();
	    		//var typeInfo=$('#typeInfo').val();
	    		if (1==hrefType) {
					$('#typeInfo').html('商&#12288;品ID：');
				}else if (2==hrefType) {
					$('#typeInfo').html('链接地址：');
				}
			});
		});
	</script>
</head>
<body>
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
     <!--开始：以下内容则可删除，仅为素材引用参考-->
     <h1 style="color:red;font-size:20px;font-weight:bold;text-align:center;">点击对应区域编辑微信页面显示内容</h1>
     <!--弹出框效果-->
     <section class="pop_bg">
     <div class="pop_cont">
     <!--title-->
     	<h3>切换首页图片轮播图片<button id="pop_colse" class="fr top_rt_btn">关闭</button></h3>
       	<!--content-->
       	<div class="pop_cont_text">
       	<!-- <ul id="ImagesUL">
       		<li onmouseover="show(this)" onmouseout="hide(this)">
       			<span>删除</span>
       			<img src="/jlmytk/FRONT_INDEX/CAROUSEL/1.jpg"/>
       			
       		</li>
       		</ul>
          	<span id="IMAGE_TITLE">标&#12288;&#12288;&#12288;题：</span>
          	<input type="text" placeholder="定义提示语..." class="textbox"/>
         -->
        
      	</div>
       	<!--以pop_cont_text分界-->
       	<!-- &#12288;中文空格符 -->
       	<div style="width: 10px;height: 10px;clear: both;"></div>
       	<p id="hide-p" style="margin-left: 25px;">
       		<font style="color: red;font-size: 11px;">* 请上传1920x1080尺寸的图片 *</font>
       		<button style="margin-left: 20px;" class="link_btn" onclick="addNavImages()">添加图片</button>
       		<span class="ttl" style="margin-left: 100px;">类型选择：</span>
          	<select id="hrefType" class="select height_35">
           		<option value="1">商品</option>
           		<option value="2">链接</option>	
          	</select>
          	<span id="typeInfo" class="ttl height_35" style="margin-left: 100px;">商&#12288;品ID：</span>
         	<input id="typeInfo_input" type="text" placeholder="请输入信息" class="textbox textbox_295 height_35"/>
       	</p>
       	
       	<div class="pop_cont_input">
        	
         		
       	</div>
     </div>
     </section>
     <!--结束：弹出框效果-->
	 
	 <!--------------------------------------------------------------------------------------------------------->
	 <section>
	 	<div style=" background-color:#19A97B; width:35%;  margin:0 auto;">
			<table>
				<tr style="text-align: center;">
					<th colspan="3">首页图片轮播</th>
				</tr>
				<tbody onclick="loadNavImage()">
					<tr id="NavImage">
						<td><img src="images/indexGDXC1.jpg"/></td>
						<td><img src="images/indexGDXC1.jpg"/></td>
						<td><img src="images/indexGDXC1.jpg"/></td>
					</tr>
				</tbody>
			</table>
			
			<table style="margin:0 auto;width:100%;" >
				<tr>
					<th colspan="4">首页小图标</th>
				</tr>
				<tbody>
				<tr id="SMALLICON" align="center">
					<td><img src="/jlmytk/FRONT_INDEX/SMALLICON/1_small_icon.png" onclick="updateIcon('1_small_icon.png')"/></td>
					<td><img src="/jlmytk/FRONT_INDEX/SMALLICON/2_small_icon.png" onclick="updateIcon('2_small_icon.png')"/></td>
					<td><img src="/jlmytk/FRONT_INDEX/SMALLICON/3_small_icon.png" onclick="updateIcon('3_small_icon.png')"/></td>
					<td><img src="/jlmytk/FRONT_INDEX/SMALLICON/4_small_icon.png" onclick="updateIcon('4_small_icon.png')"/></td>
				</tr>
				<tr align="center">
					<td>京翎美图</td>
					<td>美甲教程</td>
					<td>精彩视频</td>
					<td>京翎活动</td>
				</tr>
				</tbody>
			</table>
			<table style="margin:0 auto;margin-top:10px; text-align:center; width: 100%" border="1">
				<tr>
					<th colspan="4">首页京翎美图板块</th>
				</tr>
				
				<tbody id="JLMT">
					<!-- <tr>
	                    <td><img src="/jlmytk/FRONT_INDEX/JLMT/jlmt_1.JPG"/></td>
						<td><img src="/jlmytk/FRONT_INDEX/JLMT/jlmt_2.JPG"/></td>
						<td><img src="/jlmytk/FRONT_INDEX/JLMT/jlmt_3.JPG"/></td>
					</tr>
					<tr>
						<td><img src="/jlmytk/FRONT_INDEX/JLMT/jlmt_4.JPG"/></td>
						<td><img src="/jlmytk/FRONT_INDEX/JLMT/jlmt_5.JPG"/></td>
						<td><img src="/jlmytk/FRONT_INDEX/JLMT/jlmt_6.JPG"/></td>
					</tr>
					 -->
				</tbody>
			</table>
			
			<table border="1" style=" text-align:center">
				<tr>
					<th colspan="2">首页美甲教程</th>
				</tr>
				<tbody  id="jiaocheng_1">
					<!-- <tr>
						<td><img class="tb_pic" src="images/mjtj2-2.jpg" ></td>
						<td><img class="tb_pic" src="images/mjtj2-2.jpg" ></td>
					</tr>
					<tr>
						<td><img class="tb_pic" src="images/mjtj2-2.jpg" ></td>
						<td><img class="tb_pic" src="images/mjtj2-2.jpg" ></td>
					</tr>
				</tbody>
				 -->
			</table>
			<table id="jiaocheng_2" border="1" style=" text-align:center">
				<!-- <tr>
					<td><img class="tb_pic" src="images/mjtj3-1.jpg"></td>
					<td><img class="tb_pic" src="images/mjtj3-1.jpg"></td>
					<td><img class="tb_pic" src="images/mjtj3-1.jpg"></td>
				</tr> -->
			</table>
			<table border="1">
				<tr>
					<th colspan="3">首页精彩视频</th>
				</tr>
				<tr>
					<td><img class="tb_pic" src="/jlmytk/FRONT_INDEX/JLMTVIDEO/video_1.JPG" onclick="updateVideo('video_1.JPG')" style="width:100%;"></td>
					<td><img class="tb_pic" src="/jlmytk/FRONT_INDEX/JLMTVIDEO/video_2.JPG" onclick="updateVideo('video_2.JPG')" style="width:100%;"></td>
					<td><img class="tb_pic" src="/jlmytk/FRONT_INDEX/JLMTVIDEO/video_3.JPG" onclick="updateVideo('video_3.JPG')" style="width:100%;"></td>
				</tr>
			</table>
		</div>
	 </section>
 </div>
</section>
</body>
</html>
