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
		#pageNow{width: 30px;border:0px; background-color:transparent; text-align:center;}
		#pageCount{padding: 5px;}
	</style>
	<script type="text/javascript">
		var pageInfo = {
    			pageNow:1,
   				pageSize:10,
				pageCount:0
			};

		function getGood() {
			var goodID=$('#goodID').val();
			var goodName=$('#goodName').val();
			var classSecondID=$('#classSecondSelect').val();
			var goodData;
			if (''!=goodID) {
				$.ajaxSetup({async : false}); 
				$.get('Goods/getGoodID.do',{'id':goodID},function(data){
					goodData=data;
				});
			}else {
				$.ajaxSetup({async : false}); 
				$.post('Goods/getGoodCondition.do',{
					'pageNow':pageInfo.pageNow,
					'pageSize':pageInfo.pageSize,
					'goodName':goodName,
					'classSecondID':classSecondID
				},function(data){
					goodData=data;
					pageInfo.pageCount=data.pageCount;
					$('#pageNow').val(pageInfo.pageNow);
					//alert(pageInfo.pageCount);
					$('#pageCount').html(pageInfo.pageCount);
				});
			}
			var goodInfo='';
			var goodList=goodData.list;
			if ('undefined'==goodList || undefined==goodList) {
				goodInfo=goodParse(goodData);
			}else {
				for (var i = 0; i < goodList.length; i++) {
					goodInfo+=goodParse(goodList[i]);
				}
			}
			$('#goodInfo').html(goodInfo);
		}

		function goodParse(good) {
			var goodInfo='';
			goodInfo+='<tr><td>'+good.id+'</td>';
			goodInfo+='<td><div class="cut_title ellipsis">'+good.goodName+'</div></td>';
			goodInfo+='<td>'+good.price+'</td>';
			goodInfo+='<td>'+good.brand+'</td>';
			goodInfo+='<td>'+good.upMarketDate+'</td>';
			goodInfo+='<td>'+good.contents+'Kg</td>';
			goodInfo+='<td>'+good.expirationDate+'</td>';
			goodInfo+='<td>'+good.fitSkin+'</td>';
			goodInfo+='<td>'+good.productFeature+'</td>';
			if (0==good.hot) {
				goodInfo+='<td>否</td>';
			}else {
				goodInfo+='<td>是</td>';
			}
			goodInfo+='<td><div class="cut_title ellipsis">'+good.productionAddress+'</div></td>';
			goodInfo+='<td><a href="addGood.jsp?goodID='+good.id+'" class="inner_btn">编辑</a><a href="javascript:void(0);" class="inner_btn" onclick="deleteGood('+good.id+')">删除</a></td></tr>';
			return goodInfo;
		}
	
		/*//解析对象为字符串
		var parseParam=function(param, key){  
		    var paramStr="";  
		    if(param instanceof String||param instanceof Number||param instanceof Boolean){  
		        paramStr+="&"+key+"="+encodeURIComponent(param);  
		    }else{  
		        $.each(param,function(i){  
		            var k=key==null?i:key+(param instanceof Array?"["+i+"]":"."+i);  
		            paramStr+='&'+parseParam(this, k);  
		        });  
		    }  
		    return paramStr.substr(1);  
		};  
		*/

		function deleteGood(id){
			$.post('Goods/deleteGood.do',{'id':id},function(data){
				if (true==data || 'true'==data) {
					alert("删除成功！");
				}else {
					alert("删除失败！");
				}
			});
		}
		//获取Class
		function loadClass(){
			$.get('Class/getClassSecond_ALL.do',function(data){
				var classData='';
				for ( var key in data) {
					classData+='<option value="'+key+'">'+data[key]+'</option>';
				}
				$('#classSecondSelect').append(classData);
			});
		}

		$(function() {
			$(".loading_area").fadeIn();
			loadClass();
			getGood();
			$(".loading_area").fadeOut(600);

			//第一页
			$('#first').click(function(){
//				alert(pageInfo.pageNow=1);
				pageInfo.pageNow=1;
				getGood();
			});
			//上一页
			$('#before').click(function(){
				//alert(pageInfo.pageNow);
				if(pageInfo.pageNow<=1){
					//alert('已经是第一页了');
				}else{
					//alert('上一页');
					pageInfo.pageNow-=1;
					getGood();
				}
			});
			//下一页
			$('#next').click(function(){
				//alert(pageInfo.pageNow+'-'+pageInfo.pageCount);
				if(pageInfo.pageNow>=pageInfo.pageCount){
					//alert('已经是最后一页了');
				}else{
					pageInfo.pageNow+=1;
					getGood();
				}
			});
			//最后一页
			$('#end').click(function(){
				pageInfo.pageNow=pageInfo.pageCount;
				getGood();
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

<section class="rt_wrap content mCustomScrollbar">
<div class="rt_content">
	<!--开始：以下内容则可删除，仅为素材引用参考-->
    <h1 style="color:red;font-size:20px;font-weight:bold;text-align:center;">商品管理</h1>
    <!--开始加载-->
    <section class="loading_area">
    	<div class="loading_cont">
       	<div class="loading_icon"><i></i><i></i><i></i><i></i><i></i></div>
       	<div class="loading_txt"><mark>数据正在加载，请稍后！</mark></div>
      	</div>
    </section>
    <!--结束加载-->
    <section>
    	<h2><strong style="color:grey;">商品搜索</strong></h2>
      	<span class="item_name" style="width:120px;">商品ID：</span>
      	<input id="goodID" type="text" class="textbox textbox_225" placeholder="请输入商品ID"/>
      	<span class="item_name" style="width:120px;">商品名称：</span>
      	<input id="goodName" type="text" class="textbox textbox_225" placeholder="商品名称模糊查询"/>
      	<span class="item_name" style="width:120px;">商品分类：</span>
      	<select id="classSecondSelect" class="select">
       		<option value="0">选择分类</option>
      	</select>
      	<input type="button" value="搜索" onclick="getGood()" class="group_btn"/>
    </section>
    <section>
    	<div class="page_title">
       		<h2 class="fl">商品列表</h2>
       		<a style="margin-left: 10px" class="fr top_rt_btn" onclick="getGood()">刷新当前页</a>
       		<!-- <a class="fr top_rt_btn">升序↑</a> -->
      	</div>
      	<a href="addGood.jsp"><button class="link_btn">添加商品</button></a>
      	<table class="table" style="margin-top: 5px">
       		<thead>
       			<tr>
        			<th style="width: 70px;">商品ID</th>
        			<th style="width: 170px;">商品名称</th>
        			<th style="width: 60px;">单价</th>
        			<th>品牌</th>
			        <th>上市时间</th>
			        <th>净含量</th>
			        <th>保质期</th>
			        <th>适合肤质</th>
			        <th>特性</th>
			        <th style="width: 30px;">热销</th>
			        <th style="width: 200px;">产地</th>
			        <th style="width: 150px;">操作</th>
       			</tr>
       		</thead>
       		<tbody id="goodInfo">
       			
			</tbody>       
      	</table>
      	<aside class="paging">
       		<a id="first">第一页</a>
	    	<a id="before">上一页</a>
	       	<a>第<input id="pageNow" value="0"/>页，共<font id="pageCount">0</font>页</a>
	       	<a id="next">下一页</a>
		   	<a id="end">最后一页</a>
      	</aside>
	</section>
</div>
</section>
</body>
</html>
    