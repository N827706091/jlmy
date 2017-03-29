<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>京翎美图</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="yes" name="apple-touch-fullscreen">
	<meta content="telephone=no" name="format-detection">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1;user-scalable=no;">
	<link rel="stylesheet" href="css/front_css/bootstrap.css?v=01291">
	<link rel="stylesheet" href="css/front_css/style.css?v=1?v=01291">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/front_js/prodSort.js"></script>
	<style type="text/css">
		.my li {width: 50%;float: left;display: block;}
		table,table tr th, table tr td { border:2px solid #FFFFFF; text-align: center;}
	</style>
	<script type="text/javascript">
		var orderBy=1;
		var pageInfo = {
				pageNow:1,
				pageSize:8,
				pageCount:0,
		}
		function loadPageData() {
			$.post('backOther/loadjlmt.do',{
				'orderBy':orderBy,
				'pageNow':pageInfo.pageNow,
				'pageSize':pageInfo.pageSize
			},function(data){
				pageInfo.pageCount=data.pageCount;
				var jlmtList=data.list;
				var jlmtInfo='<tr>';
				for (var i = 0; i < jlmtList.length; i++) {
					if (i%2==0 && i!=0) {
						jlmtInfo+='</tr><tr>';
					}
					jlmtInfo+='<td><img class="tb_pic" src="'+jlmtList[i].path+'" style="width:100%;"></td>';
				}
				jlmtInfo+='</tr>';
				//alert(data);
				$('#pageNow').val(pageInfo.pageNow);
				$('#pageCount').html(pageInfo.pageCount);
				$('#jlmtInfo').html(jlmtInfo);
			});
		}
		$(function(){
			loadPageData();
			$('#default').click(function(){
				if (1!=orderBy) {
					pageInfo.pageNow=1;
					orderBy=1;
					loadPageData();	
				}
			})
			$('#buys').click(function(){
				if (2!=orderBy) {
					pageInfo.pageNow=1;
					orderBy=2;
					loadPageData();	
				}
			});
			//第一页
			$('#first').click(function(){
				if(pageInfo.pageNow<=1){
					//alert('已经是第一页了');
				}else{
					pageInfo.pageNow=1;
					loadPageData();
				}
				
			});
			//上一页
			$('#before').click(function(){
				if(pageInfo.pageNow<=1){
					//alert('已经是第一页了');
				}else{
					pageInfo.pageNow-=1;
					loadPageData();
				}
			});
			//下一页
			$('#next').click(function(){
				//alert(pageInfo.pageNow+"--"+pageInfo.pageCount);
				if(pageInfo.pageNow>=pageInfo.pageCount){
					//alert('已经是最后一页了');
				}else{
					pageInfo.pageNow+=1;
					loadPageData();
				}
			});
			//最后一页
			$('#end').click(function(){
				if(pageInfo.pageNow>=pageInfo.pageCount){
					//alert('已经是最后一页了');
				}else{
					pageInfo.pageNow=pageInfo.pageCount;
					loadPageData();
				}
				
			});
		});
	</script>
</head>
<body>

<!-- <div class="row">
		<ul class="mod-filter clearfix white-bg_2s>
			<li id="default" class="active" style="width:50%">
				<a title="最新"  href="javascript:void(0);">最新</a>
			</li>
			<li id="buys" style="width:50%" >
				<a title="最热" href="javascript:void(0);" >最热</a>
			</li>
		</ul>
	</div>
	 -->
<div class="container">
	<div class="row">
		<ul class="mod-filter clearfix white-bg_2">
			<li id="default" class="active" style="width:50%">
				<a title="最新"  href="javascript:void(0);">最新</a>
			</li>
			<li id="buys" style="width:50%" >
				<a title="最热" href="javascript:void(0);" >最热</a>
			</li>
		</ul>
	</div>
	</div>
	<div class="row">
		<div class="tb_box">
			<div class="tb_type tb_type_even clearfix">
				<table id="jlmtInfo">
					<!-- <tr>
						<td><img class="tb_pic" src="images/mt2.JPG" style="width:100%;"></td>
						<td><img class="tb_pic" src="images/mt3.JPG" style="width:100%;"></td>
					</tr>
					-->
				</table>	
			</div>
		</div>
		<div style="text-align: center;">
			<button id="first">首&emsp;&emsp;页</button>
			<button id="before">上一页</button>
			<button id="next">下一页</button>
			<button id="end">最后一页</button>
		</div>
	</div>
</div>
<footer class="footer">
	<div class="foot-con">
		<div class="foot-con_2">
			<a href="index.html" ><i class="navIcon home"></i><span class="text">首页</span></a>
			<a href="#" class="active"><i class="navIcon sort"></i><span class="text">商城</span></a>
			<a href="shopcart.html"><i class="navIcon shop"></i><span class="text">购物车</span></a>
			<a href="userhome.html" ><i class="navIcon member"></i><span class="text">我的</span></a>
		</div>
	</div>
</footer>
</body>
</html>