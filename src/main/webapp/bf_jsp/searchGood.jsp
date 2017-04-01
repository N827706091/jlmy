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
	<title>美甲</title>
	<link rel="stylesheet" href="css/front_css/bootstrap.css?v=01291">
	<link rel="stylesheet" href="css/front_css/style.css?v=1?v=01291">
	<link rel="stylesheet" href="css/front_css/member.css?v=01291">
	<link rel="stylesheet" href="css/front_css/order.css?v=01291">
	<script charset="utf-8" src="js/jquery.js"></script>
	<script charset="utf-8" src="js/front_js/global.js?v=01291"></script>
	<script charset="utf-8" src="js/front_js/bootstrap.min.js?v=01291"></script>
	<script charset="utf-8" src="js/front_js/template.js?v=01291"></script>
	<script charset="utf-8" src="js/front_js/jquery.form.js?v=01291"></script>
	<script charset="utf-8" src="js/front_js/prodSort.js?v=01291"></script>
	<style type="text/css">
		.my li {width: 50%;float: left;display: block;} 
	</style>
	<script type="text/javascript">
		var pageInfo = {
				pageNow:1,
				pageSize:6,
				pageCount:0,
		}
		function getParam(name) {
		    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		    var r = window.location.search.substr(1).match(reg);
		    if ( r != null ){
		       return decodeURI(r[2]);
		    }else{
		       return null;
		    } 
		 }
		var orderBy=0;
		function updateOrderBy(sourceBy){
			//1:销量	2:价格
			switch (sourceBy) {
				case 0:orderBy=0;break;
				case 1:switch(orderBy){case 0:orderBy=1;break;case 1:orderBy=2;break;case 2:orderBy=1;break;case 3:orderBy=1;break;case 4:orderBy=1;break;}break;
				case 2:switch(orderBy){case 0:orderBy=3;break;case 1:orderBy=3;break;case 2:orderBy=3;break;case 3:orderBy=4;break;case 4:orderBy=3;break;}break;
				default:break;
			}
			pageInfo.pageNow=1;
			loadGoods(1);
		}
		function loadGoods(sourceBy) {
			$.post('Goods/frontLoadGoods.do',{
				'orderBy':orderBy,
				'goodName':'${param.goodName}',
				'classSecondName':'${param.classSecondName}',
				'pageNow':pageInfo.pageNow,
				'pageSize':pageInfo.pageSize,
			},function(data){
				var goodInfoList=data.list;
				var goodInfo='<tr>';
				for (var i = 0; i < goodInfoList.length; i++) {
					if (i%2==0 && i!=0) {
						goodInfo+='<tr></tr>';
					}
					goodInfo+='<td><a href="goodInfo.jsp?goodID='+goodInfoList[i].id+'"><img class="tb_pic" src="'+goodInfoList[i].imagePath+'" style="width:100%;">'+goodInfoList[i].goodName+'<h5><font color="#FF0000">￥'+goodInfoList[i].price+'</font></h5></a></td>';
				}
				goodInfo+='</tr>';
				//判断是否是第一次进行此条件查询
				if (0==sourceBy) {
					$('#goodInfo').append(goodInfo);
				}else {
					$('#goodInfo').html(goodInfo);
				}
			});
		}
		$(function(){
			loadGoods(1);
			$(window).scroll(function() {
				/*$(document).scrollTop() 获取垂直滚动的距离
				  $(document).scrollLeft() 这是获取水平滚动条的距离
				  */
				if ($(document).scrollTop() <= 0) {
					//alert("滚动条已经到达顶部为0");
				}
				if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
					pageInfo.pageNow+=1;
					loadGoods(0);
					//alert("滚动条已经到达底部为" + $(document).scrollTop());
				}
			});
		});
	</script>
</head>
<body>
<div class="container">		
	<div class="row">
			<ul class="mod-filter clearfix">
				<div class="white-bg_2 bb1">
					<li id="default" class="active"><a href="javascript:updateOrderBy(0);">默认</a></li>
					<li id="buys"  ><a href="javascript:updateOrderBy(1);" >销量<i class='icon_sort'></i></a></li>
					<li id="cash"  ><a href="javascript:updateOrderBy(2);" >价格<i class='icon_sort'></i></a></li>
				</div>
			</ul>
	</div>
	<div class="row">
		<div class="tb_box">
			<div class="tb_type tb_type_even clearfix">
			<table id="goodInfo" bordercolor="#FFFFFF" border="2" style=" text-align:center">
				<!-- <tr>
					<td><img class="tb_pic" src="images/mt2.JPG" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font></h5></td>
					<td><img class="tb_pic" src="images/mt3.JPG" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font></h5></td>
				</tr>
							<tr>
								<td><img class="tb_pic" src="images/mt5.JPG" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font></h5></td>
								<td><img class="tb_pic" src="images/mt6.JPG" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font></h5></td>
							</tr>
							<tr>
								<td><img class="tb_pic" src="images/mt5.JPG" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font></h5></td>
								<td><img class="tb_pic" src="images/mt6.JPG" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font></h5></td>
							</tr>
							<tr>
								<td><img class="tb_pic" src="images/mt5.JPG" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font></h5></td>
								<td><img class="tb_pic" src="images/mt6.JPG" style="width:100%;">商品名字<h5><font color="#FF0000">￥100</font></h5></td>
							</tr> -->
						</table>
			</div>
		</div>
	</div>
</div>
<footer class="footer">
  <div class="foot-con">
	<div class="foot-con_2">
		<a href="index.html"><i class="navIcon home"></i><span class="text">首页</span></a>
		<a href="javascript:void(0)" class="active"><i class="navIcon sort"></i><span class="text">商城</span></a>
		<a href="shopcart.html"><i class="navIcon shop"></i><span class="text">购物车</span></a>
		<a href="userhome.html"><i class="navIcon member"></i><span class="text">我的</span></a>
	</div>
  </div>
</footer>
</body>
</html>