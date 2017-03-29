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
	<script type="text/javascript">
		var classData='';

		function inputHTML(judge){
			var HTML='';
			if (1==judge) {
				HTML+='<ul><li><span>分类名称：</span><input id="CF_ID" type="hidden"/><input id="CF_NAME" name="className" type="text" placeholder="请输入分类名称" class="textbox"/></li>';
		        HTML+='<li><span class="ttl">描&#12288;&#12288;述：</span><textarea id="CF_DES" name="description" class="textarea" style="height:50px;width:68.5%;"></textarea></li></ul>';
		        $('input[name="YES"]').attr('onclick','submitClass(1)');
			}else if (2==judge) {
				HTML+='<ul><li><span>分类名称：</span><input id="CS_ID" type="hidden"/><input id="CS_NAME" name="className" type="text" placeholder="请输入分类名称" class="textbox"/></li>';
		        HTML+='<li><span class="ttl">上级分类：</span><select id="CS_CLASS" class="select">';
		        for (var i = 0; i < classData.length; i++) {
		        	HTML+='<option value="'+classData[i].id+'">'+classData[i].className+'</option>';	
				}
		        HTML+='</select></li><li><span class="ttl">描&#12288;&#12288;述：</span><textarea id="CS_DES" name="description" class="textarea" style="height:50px;width:68.5%;"></textarea></li></ul>';
		        $('input[name="YES"]').attr('onclick','submitClass(2)');
			}
			$('#pop_cont_input').html(HTML);
		}

		function updateClass_F(index,judge) {
			$('.pop_bg').fadeIn();
			inputHTML(judge);
			$('#CF_ID').val(classData[index].id);
			$('#CF_NAME').val(classData[index].className);
			$('#CF_DES').val(classData[index].description);
			$('input[name="YES"]').attr('id','U_C_F');
		}

		function updateClass_S(F_index,S_index,judge) {
			$('.pop_bg').fadeIn();
			inputHTML(judge);
			var ClassSelect='';
			var classSeconds=classData[F_index].classSeconds;
			for (var i = 0; i < classData.length; i++) {
				if (classData[i].classSeconds==classSeconds) {
					ClassSelect+='<option selected="selected" value="'+classData[i].id+'">'+classData[i].className+'</option>'
				}else {
					ClassSelect+='<option value="'+classData[i].id+'">'+classData[i].className+'</option>';	
				}		
			}			
			$('#CS_ID').val(classSeconds[S_index].id);
			$('#CS_CLASS').append(ClassSelect);
			$('#CS_NAME').val(classSeconds[S_index].className);
			$('#CS_DES').val(classSeconds[S_index].description);
			$('input[name="YES"]').attr('id','U_C_S');
		}

		function inputClassSecond(index) {
			//alert(id);
			var classSeconds=classData[index].classSeconds;
			var classFirstName=classData[index].className;
			var classHTML='';
			for (var i = 0; i < classSeconds.length; i++) {
				classHTML+='<tr><td class="center">'+classSeconds[i].className+'</td><td>'+classSeconds[i].description+'</td><td class="center"><a onclick="updateClass_S('+index+','+i+',2)" class="inner_btn">编辑</a><a onclick="deleteClass('+classSeconds[i].id+',2)" class="inner_btn">删除</a></td></tr>';
			}
			if (''==classHTML) {
				classHTML+='<td colspan="3" class="center">无数据</td>';
			}
			$('#ClassSecondInfo').html(classHTML);	
		}
		
		function submitClass(classF_S) {
			var dataInfo=decodeURIComponent($('#ClassInfo').serialize(),true);
			var url='';
			if (1==classF_S) {
				url='Class/addClassFirst.do';
			}else if (2==classF_S) {
				url='Class/addClassSecond.do';
				dataInfo+='&classFirst_id='+$('#CS_CLASS').val();
			}
			$.post(url,dataInfo,function(data){
				if ('true'==data || true==data) {
					alert("添加成功！");
				}else {
					alert("添加失败，请重试！");
				}
			});	
			
		}

		function deleteClass(class_id,classF_S) {
			var url='';
			if (1==classF_S) {
				url='Class/deleteClassFirst.do';
			}else if (2==classF_S) {
				url='Class/deleteClassSecond.do';
			}
			$.post(url,{'id':class_id},function(data){
				if ('true'==data || true==data) {
					alert("删除成功！");
				}else {
					alert("删除失败！");
				}
			});
		}

		function getClass() {
			$.get('Class/getClass.do',function(data){
				classData=data;
				var classHTML='';
				for (var i = 0; i < data.length; i++) {
					classHTML+='<tr><td class="center">'+data[i].className+'</td><td class="center">'+data[i].description+'</td><td class="center"><a onclick="updateClass_F('+i+',1)" class="inner_btn">编辑</a><a onclick="deleteClass('+data[i].id+',1)" class="inner_btn">删除</a><a onclick="inputClassSecond('+i+')" class="inner_btn">查看>></a></td></tr>';
				}
				$('#ClassFirstInfo').html(classHTML);	
			});
		}

		$(function(){
			getClass();
			//弹出文本性提示框
			$('#addClassFirst').click(function(){
				$(".pop_bg").fadeIn();
			});
			$('#addClassSecond').click(function(){
				$('.pop_bg').fadeIn();
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
	<!--开始：以下内容则可删除，仅为素材引用参考-->
	<h1 style="color:red;font-size:20px;font-weight:bold;text-align:center;">分类管理</h1>
	<!--弹出框效果-->
     <section class="pop_bg">
      <div class="pop_cont">
       <!--title-->
       <h3>添加大分类</h3>
       <!--content-->
       <form id="ClassInfo">
       <div id="pop_cont_input" class="pop_cont_input">
       
       <!-- <ul>
         <li>
          <span>分类名称：</span>
          <input type="text" placeholder="请输入分类名称" class="textbox"/>
         </li>
         
         <li>
          <span class="ttl">上级分类：</span>
          <select class="select">
           <option>选择大分类</option>
          </select>
         </li>
         <li>
          <span class="ttl">描&#12288;&#12288;述：</span>
          <textarea class="textarea" style="height:50px;width:68.5%;"></textarea>
         </li>
        </ul>
        --> 
       </div>
       </form>
       <!--bottom:operate->button-->
       <div class="btm_btn">
        <input type="button" name="YES" id="a_un" value="确认" class="input_btn trueBtn"/>
        <input type="button" name="CLOSE" id="b_un" value="关闭" class="input_btn falseBtn"/>
       </div>
      </div>
     </section>
     <!--结束：弹出框效果-->
	<section style="margin-top: 50px">
    	<div class="cont_col_lt mCustomScrollbar" style="height:500px;width: 40%;">
       		<button id="addClassFirst" onclick="inputHTML(1)" class="link_btn">添加大分类</button>
    		<table style="margin-top: 10px" class="table fl">
            	<tr>
             		<th style="width: 100px">大分类</th>
             		<th>描述</th>
             		<th style="width: 200px">操作</th>
            	</tr>
            	<tbody id="ClassFirstInfo">
            	<tr>
             		<td class="center">美容</td>
             		<td class="center">美容</td>
			 		<td class="center"><a class="inner_btn">编辑</a><a class="inner_btn">查看>></a></td>
            	</tr>
            	</tbody>
           	</table>
       	</div>
       	<!--左右分栏：右侧栏-->
       	<div style="margin-left: 45%;" class="cont_col_rt">
       	<button id="addClassSecond" class="link_btn" onclick="inputHTML(2)">添加二级分类</button>
        	<table style="margin-top: 10px" class="table fl">
        		<thead>
	            	<tr>
	             		<th style="width: 100px">二级分类</th>
	             		<th>描述</th>
	             		<th>操作</th>
	            	</tr>
            	</thead>
            	<tbody id="ClassSecondInfo">
	            	<tr>
	             		<td colspan="3" class="center">无数据</td>
	             		
	            	</tr>
				</tbody>
           	</table>
       	</div>
     	</section>
 	</div>
</section>
</body>
</html>
