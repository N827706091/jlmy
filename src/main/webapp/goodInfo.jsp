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
	<title>商品详情</title>
	<link rel="stylesheet" href="css/front_css/bootstrap.css?v=01291">
	<link rel="stylesheet" href="css/front_css/style.css?v=1?v=01291">
	<link rel="stylesheet" href="css/front_css/member.css?v=01291">
	<link rel="stylesheet" href="css/front_css/order.css?v=01291">
	<link rel="stylesheet" href="css/front_css/productDetail.css?v=01291">
	<script charset="utf-8" src="js/jquery.js"></script>
	<script charset="utf-8" src="js/front_js/global.js?v=01291"></script>
	<script charset="utf-8" src="js/front_js/bootstrap.min.js?v=01291"></script>
	<script charset="utf-8" src="js/front_js/template.js?v=01291"></script>
	<script charset="utf-8" src="js/front_js/TouchSlide.js?v=01291"></script>
	<script charset="utf-8" src="js/front_js/prodDetail.js?v=01291"></script>
	<style type="text/css">
		.details_con li .tb-out-of-stock{
			border: 1px dashed #bbb;
			color:#bbb;
			cursor: not-allowed;
		}
		.no-selected{
			background: #ffe8e8 none repeat scroll 0 0;
			border: 2px solid #be0106;
			margin: -1px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			var goodID='${param.goodID}';
			$.post('Goods/getGoodID.do',{'id':goodID},function(data){
				var colours=data.goodColours;
				$('#goodName').html(data.goodName);
				$('#price').html(data.price);
				var colourInfo='';
				for (var i = 0; i < colours.length; i++) {
					if (i==0) {
						colourInfo+='<dd id="default" class="check" onclick="getColourImages(this,\''+data.goodName+'\')">'+colours[i].colourName+'<span></span></dd>';	
					}else {
						colourInfo+='<dd onclick="getColourImages(this,\''+data.goodName+'\')">'+colours[i].colourName+'<span></span></dd>';	
					}
				}
				$('#colourInfo').html(colourInfo);
				getColourImages($('#default'),data.goodName);
				getDetailImages(data.goodName);
			});
		});
		function getDetailImages(goodName) {
			$.post('Goods/getDetailImages.do',{'goodName':goodName},function(data){
				//alert(data);
				var detailImageInfo='';
				for (var i = 0; i < data.length; i++) {
					detailImageInfo+='<li class="prop-area">';
					detailImageInfo+='<img src="/jlmytk/'+goodName+'/x/'+data[i]+'"/>';
					detailImageInfo+='</li>';
				}
				$('#detailImageInfo').html(detailImageInfo);
				TouchSlide({
					slideCell:"#goodsContent",
				});
			});
		}
		function getColourImages(thisObj,goodName) {
			if ($(thisObj).attr('class')!='check') {
				$(thisObj).siblings('dd').attr('class','')
				$(thisObj).attr('class','check');
			}
			var colourName=$(thisObj).text();
			//alert(goodName);
			$.post('Goods/getGoodColours.do',{'goodName':goodName,'colourName':colourName},function(data){
				//alert(data);
				if (data=='') {
					return;
				}
				var colourInfo='';
				for (var i = 0; i < data.length; i++) {
					colourInfo+='<li style="display: table-cell; vertical-align: middle; max-width: 768px;">';
					colourInfo+='<img style="max-width:100vw;max-height:80vw;margin:auto;" src="/jlmytk/'+goodName+'/z/'+colourName+'/'+data[i]+'"></li>';
				}
				//alert(colourInfo);
				$('#colourImages').html(colourInfo);
				//插件：图片轮播
				TouchSlide({
					slideCell:"#slide",
					titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
					mainCell:".bd ul",
					effect:"left",
					autoPlay:false,//自动播放
					autoPage:true, //自动分页
					switchLoad:"_src" //切换加载，真实图片路径为"_src"
				});
			});
		}
		
    	
	</script>
</head>

<body>

<div class="fanhui_cou">
	<div class="fanhui_1"></div>
	<div class="fanhui_ding">顶部</div>
</div>

<header class="header">
	<div class="fix_nav">
		<div style="max-width:768px;margin:0 auto;background:#000;position: relative;">
			<a class="nav-left back-icon" href="javascript:history.back();">返回</a>
			<div class="tit">商品详细</div>
		</div>
	</div>
</header>
<div class="container">
    <div class="row white-bg">
        <div id="slide"> 
            <div class="hd">
                <ul>
                	<li>1</li></ul>
            </div>
            <div class="bd">
                <div class="tempWrap" style="overflow:hidden; position:relative;">
                	<ul id="colourImages" style="width: 3072px; position: relative; overflow: hidden; padding: 0px; margin: 0px; transition-duration: 200ms; transform: translateX(-768px);">
                        <li style="display: table-cell; vertical-align: middle; max-width: 768px;">
                        		<img style="max-width:100vw;max-height:80vw;margin:auto;" src="img/53698282-4ff7-4daa-bb4c-4bcaa14b00fc.jpg">
                        	</li>
                        <li style="display: table-cell; vertical-align: middle; max-width: 768px;">
                        		<a href="#"><img style="max-width:100vw;max-height:80vw;margin:auto;" src="img/53698282-4ff7-4daa-bb4c-4bcaa14b00fc.jpg"></a>
                        	</li>
                        
                        <li style="display: table-cell; vertical-align: middle; max-width: 768px;">
                        		<a href="#"><img style="max-width:100vw;max-height:80vw;margin:auto;" src="img/53698282-4ff7-4daa-bb4c-4bcaa14b00fc.jpg"></a>
                        	</li>
                        </ul>
               </div>
            </div>
        </div>
    </div>
    <div class="row gary-bg">
         <div class="white-bg p10 details_con">
         <h1 class="item-name" id="goodName">艾吉贝2015新款多层收纳真皮单肩斜挎包女包头层牛皮斜跨小包包女</h1>
         <ul>
			<li>
				<label>商城价格：</label>
				<span class="price">¥<span class="price" id="price">179.00</span></span>
			</li>
			<li>
				<label>颜色：</label>
				<dl id="colourInfo">
					<dd>黑色<span></span></dd>
						<dd class="check">红色<span></span></dd>
						<dd>黄色<span></span></dd>
					</dl>
				</li>
			  <li>
				<label>数量：</label>
				<div class="count_div" style="height: 30px; width: 130px;">
					<a href="javascript:void(0);" class="minus" ></a>
					  <input type="text" class="count" value="1" id="prodCount" readonly="readonly"/>
					<a href="javascript:void(0);" class="add" ></a>
				</div>
			</li>
			</ul>
		</div>
        <div id="goodsContent" class="goods-content white-bg">
			
            <div class="hd hd_fav">
                <ul>
                    <li class="on" style=" width:50%">图文详情</li>
                    <li style=" width:50%">规格参数</li>
                </ul>
            </div>
			
            <div class="tempWrap" style="overflow:hidden; position:relative;">
            <div style="width: 2304px; position: relative; overflow: hidden; padding: 0px; margin: 0px; transition-duration: 200ms; transform: translateX(0px);" class="bd">
                <ul id="detailImageInfo" style="display: table-cell; vertical-align: top; max-width: 768px;width: 100%;" class="property">
                	<li class="prop-area">
                		<img src="img/8a9740c7-7f8e-4f20-ba64-1e90dd596ebe.jpg"/>
                	</li>
                    <!-- <div class="prop-area" style="min-height:300px;overflow: hidden;">
                    	<img src="img/8a9740c7-7f8e-4f20-ba64-1e90dd596ebe.jpg" alt="" /></div> -->
                </ul>
                <ul class="txt-imgs" style="display: table-cell; vertical-align: top; max-width: 768px;width: 100%;">
                	<div class="desc-area" style="padding: 0px 10px 0 10px;">
	                <li style="height:30px;">
	                	<div id="ajax_loading" style="margin: 10px  auto 15px;"> 
							<table border="0px" width="90%" align="center">
								<tr>
									<td>品牌：北欧</td>
									<td>产品分类：美甲</td>
								</tr>
								<tr>
									<td>上市时间：2017</td>
									<td>保质期：12月</td>
								</tr>
								<tr>
									<td>含净量：50g</td>
									<td>产地：重庆</td>
								</tr>
								<tr>
									<td>适合肤质：正常肤质</td>
									<td>化妆品特性：一般</td>
								</tr>
							</table>
						</div>
	                </li>
	                </div>
                </ul>
                <ul style="display: table-cell; vertical-align: top; max-width: 768px;width: 100%;" class="appraise" rel="1" status="1">
                	<div style="height:30px;">
	                	<div id="ajax_loading" style="margin: 10px  auto 15px;text-align:center;"> <img src="images/loading.gif" style="width: auto; display: block;  margin: auto;"></div>
	                </div>
                     <div class="wap_page" style="display: none;" onClick="next_comments(this)"><span>下一页</span></div>
                </ul>
            </div>
            </div>
        </div>
    </div>
</div>

<div class="fixed-foot">
	<div class="fixed_inner">
		<a class="btn-fav" href="javascript:void(0);" onClick="addInterest(this,'663');">
		<i class="i-fav"></i><span>收藏</span>
		</a>
		<a class="cart-wrap" href="/shopcart">
			<i class="i-cart"></i>
			<span>购物车</span>
			<span class="add-num" id="totalNum">0</span>
		</a>
		<div class="buy-btn-fix">
		    <a class="btn btn-info btn-cart"  onclick="addShopCart();" href="javascript:void(0);">加入购物车</a>
		    <a class="btn btn-danger btn-buy" onClick="buyNow();" href="javascript:void(0);">立即购买</a>
		</div>
	</div>
</div>

<div class="clear"></div>

<footer class="footer">
  <div class="foot-con">
	<div class="foot-con_2">
		<a href="index.html">
			<i class="navIcon home"></i>
			<span class="text">首页</span>
		</a>
		<a href="category.html">
			<i class="navIcon sort"></i>
			<span class="text">分类</span>
		</a>
		<a href="shopcart.html">
			<i class="navIcon shop"></i>
			<span class="text">购物车</span>		
		</a>
		<a href="userhome.html">
			<i class="navIcon member"></i>
			<span class="text">我的</span>
		</a>
	</div>
  </div>
</footer>
<script type="text/javascript">


</script>
</body>
</html>
