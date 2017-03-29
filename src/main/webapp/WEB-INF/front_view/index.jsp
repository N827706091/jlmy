<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="yes" name="apple-touch-fullscreen">
	<meta content="telephone=no" name="format-detection">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1;user-scalable=no;">
	<title>首页</title>
	<!-- <link rel="stylesheet" type="text/css" href="css/front_css/reset.css"/> -->
	<link rel="stylesheet" href="css/front_css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/front_css/willesPlay.css"/>
	<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/front_js/willesPlay.js" type="text/javascript" charset="utf-8"></script>
	
	<!-- <link rel="stylesheet" href="css/front_css/bootstrap.css?v=01291"> -->
	<link rel="stylesheet" href="css/front_css/style.css?v=1?v=01291">
	<link rel="stylesheet" href="css/front_css/member.css?v=01291">
	<link rel="stylesheet" href="css/front_css/order.css?v=01291">
	<link rel="stylesheet" href="css/win_style.css">
<!-- 	<script type="text/javascript" src="js/jquery.js?v=01291"></script> -->
	<script type="text/javascript" src="js/front_js/global.js?v=01291"></script>
	<script type="text/javascript" src="js/front_js/bootstrap.min.js?v=01291"></script>
	<script type="text/javascript" src="js/front_js/template.js?v=01291"></script>
	<style type="text/css">
		#carousel{
			width: 3840px; 
			position: relative; 
			overflow: hidden; 
			padding: 0px; 
			margin: 0px; 
			transition-duration: 200ms; 
			transform: translateX(-768px);
		}
		#carousel li{
			display: table-cell; vertical-align: top; width: 768px;
		}
		body td{	
			border-collapse: collapse;
			border:1px solid #FFF;
		}
		#MJJCTABLETD td{
			border-color: #CCC;
		}
	</style>
	<script type="text/javascript">
		/*function loadNavImage() {
			$.post('backOther/getImageName.do',function(data){
				var imageInfo='';
				for (var i = 0; i < data.length; i++) {
					imageInfo+='<li>';
					if ('good'==data[i].type) {
						imageInfo+='<a href="good.jsp?goodID='+data[i].goodID+'" target="_blank">';
					}else if ('href'==data[i].type) {
						imageInfo+='<a href="'+data[i].imageHref+'" target="_blank">';
					}
					imageInfo+='<img src="/jlmytk/FRONT_INDEX/NAVIMAGE/'+data[i].fileName+'"/></a></li>';
				}
				$('#carousel').html(imageInfo);
				TouchSlide({
					slideCell:"#slide",
					titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
					mainCell:".bd ul",
					effect:"left",
					autoPlay:true,//自动播放
					autoPage:true, //自动分页
					switchLoad:"_src" //切换加载，真实图片路径为"_src"
				});
			});
			
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
		    			dataInfo+='<td><img class="tb_pic" src="/jlmytk/FRONT_INDEX/PRETTYIMAGE/'+key+'"/></td>';
		    			ia++;
					}
		    		dataInfo+='</tr>';
		    		//alert(dataInfo);
		    		$('#JLMT').html(dataInfo);
				}  			
    		});
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
    				courseInfo+='<td><img class="tb_pic" src="/jlmytk/FRONT_INDEX/COURSE/UP/'+up[i]+'" ></td>';
				}
    			courseInfo+='</tr>';
    			$('#jiaocheng_1').html(courseInfo);
    			courseInfo='';
    			courseInfo+='<tr>'
    			for (var i = 0; i < down.length; i++) {
    				courseInfo+='<td><img class="tb_pic" src="/jlmytk/FRONT_INDEX/COURSE/DOWN/'+down[i]+'"></td>'
				}
    			courseInfo+='</tr>';
    			$('#jiaocheng_2').html(courseInfo);
    		});
		}*/
		function getNavImage() {
			$.post('frontOther/getNavImage.do',{'areaID':101},function(data){
				var imageInfo='';
				for (var i = 0; i < data.length; i++) {
					imageInfo+='<li>';
					imageInfo+='<a href="'+data[i].href+'" target="_blank">';
					imageInfo+='<img src="'+data[i].path+'"/></a></li>';
				}
				$('#carousel').html(imageInfo);
				TouchSlide({
					slideCell:"#slide",
					titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
					mainCell:".bd ul",
					effect:"left",
					autoPlay:true,//自动播放
					autoPage:true, //自动分页
					switchLoad:"_src" //切换加载，真实图片路径为"_src"
				});
			});
		}
		$(function() {
			/*loadNavImage();
			getjlmt();
			loadcourse();*/
			getNavImage();
		});
	</script>
</head>
<body>
<div class="container">
<div class="row">
<div id="slide">
	<div class="hd">
		<ul><!-- 不可省略 --></ul>
	</div>
	<div class="bd">
    	<div class="tempWrap" style="overflow:hidden; position:relative;">
        	<ul id="carousel">
	            <!-- <li>
	   	            <a href="http://m.legendshop.cn/m_search/list?categoryId=36" target="_blank">
	   	                <img src="images/indexGDXC1.jpg" alt="女包" />
	   	            </a>
	   	        </li>
	   	        -->
	            </ul>
            </div>
           </div>
    </div>
    </div>
<script type="text/javascript" src="js/front_js/TouchSlide.js"></script>
<script type="text/javascript">
	
</script>
<div class="row category">
        <a href="#" class="col-xs-3"><img class="img-responsive" src="/jlmytk/FRONT_INDEX/SMALLICON/1_small_icon.png"><font>京翎美图</font></a>
        <a href="#" class="col-xs-3"><img class="img-responsive" src="/jlmytk/FRONT_INDEX/SMALLICON/2_small_icon.png"><font>美甲教程</font></a>
        <a href="#" class="col-xs-3"><img class="img-responsive" src="/jlmytk/FRONT_INDEX/SMALLICON/3_small_icon.png"><font>精彩视频</font></a>
        <a href="#" class="col-xs-3"><img class="img-responsive" src="/jlmytk/FRONT_INDEX/SMALLICON/4_small_icon.png"><font>京翎活动</font></a>
    </div>
    
<div class="row">
	<!--产品块-->
	<div class="tb_box">
		<h2 class="tab_tit">
			<a class="more" href="front.do?toName=jlmtAll.jsp">更多</a>京翎美图
		</h2>
		<div class="tb_type tb_type_even clearfix">
			<table id="JLMT">
				<tr>
                    <td><img class="tb_pic" src="/jlmytk/A_INDEX/area102_1.jpg" style="width:100%;"></td>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area102_2.jpg" style="width:100%;"></td>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area102_3.jpg" style="width:100%;"></td>
				</tr>
				<tr>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area102_4.jpg" style="width:100%;"></td>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area102_5.jpg" style="width:100%;"></td>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area102_6.jpg" style="width:100%;"></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="tb_box" style=" margin-top:10px">
		<h2 class="tab_tit"><a class="more" href="index manicure course.html">更多</a>美甲教程</h2>
		<div id="MJJCTABLETD" class="tb_type tb_type_even clearfix">
			<table id="jiaocheng_1" style="text-align:center;">
				<tr>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area103_1.jpg" style="width:100%;"></td>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area103_2.jpg" style="width:100%;"></td>
				</tr>
				<tr>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area103_3.jpg" style="width:100%;"></td>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area103_4.jpg" style="width:100%;"></td>
				</tr>
			</table>
			<table id="jiaocheng_2" style="text-align:center;">
				<tr>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area104_1.jpg" style="width:100%;"></td>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area104_2.jpg" style="width:100%;"></td>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area104_3.jpg" style="width:100%;"></td>
				</tr>
			</table>
		</div>
	</div>	
	<!--产品块-->
	<div class="tb_box">
		<h2 class="tab_tit"><a class="more" href="index video.html">更多</a>精彩视频</h2>
		<div class="tb_type tb_type_even clearfix">
			<table id="videoImagePlay">
				<tr>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area105_1.jpg" style="width:100%;"></td>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area105_2.jpg" style="width:100%;"></td>
					<td><img class="tb_pic" src="/jlmytk/A_INDEX/area105_3.jpg" style="width:100%;"></td>
				</tr>
			</table>
		</div>
	</div>
</div>
</div>
<footer class="footer">
	<div class="foot-con">
		<div class="foot-con_2">
			<a href="#" class="active"><i class="navIcon home"></i><span class="text">首页</span></a>
			<a href="#"><i class="navIcon sort"></i><span class="text">商城</span></a>
			<a href="#"><i class="navIcon shop"></i><span class="text">购物车</span></a>
			<a href="#"><i class="navIcon member"></i><span class="text">我的</span></a>
		</div>
	</div>
</footer>
<div class="cd-popup3">
    <div class="cd-popup-container3">
    	<a href="#0" class="cd-popup-close">关闭</a>
        <div class="cd-buttons">
        	<div id="willesPlay">
				<div class="playHeader">
					<div class="videoName" style=" width:100%">Tara - 懂的那份感觉</div>
				</div>
				<div class="playContent">
					<video width="100%" height="100%" id="playVideo">
						<source src="/jlmytk/VIDEO/1.mp4" type="video/mp4"></source>
					</video>
					<div class="playTip"></div>
				</div>
				<div class="playControll">
					<div class="playPause playIcon"></div>
					<div class="timebar">
						<div class="progress">
							<div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
						</div>
					</div>
					<div class="otherControl">
						<span class="volume glyphicon loudspeaker"></span>			
						<div class="volumeBar">
							<div class="volumewrap">
								<div class="progress">
									<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 8px;height: 40%;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    /*弹框JS内容*/
    jQuery(document).ready(function($){
		//打开窗口
        $('.cd-popup-trigger3').on('click', function(event){
            event.preventDefault();
            $('.cd-popup3').addClass('is-visible3');
            //$(".dialog-addquxiao").hide()
        });

		$('#videoImagePlay img').click(function(event){
			event.preventDefault();
			$('.cd-popup3').addClass('is-visible3');
		})
        //关闭窗口
       /* *$('.cd-popup3').on('click', function(event){
            if( $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup3') ) {
                event.preventDefault();	
                $(this).removeClass('is-visible3');
            }
        });*/
        
        //ESC关闭
        $(document).keyup(function(event){
            if(event.which=='27'){
                $('.cd-popup3').removeClass('is-visible3');
            }
        });
    });
</script>
</body>
</html>	