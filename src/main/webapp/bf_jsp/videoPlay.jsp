<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
	<title>HTML5手机网页视频播放器代码 - 绘艺素材</title>
	<link rel="stylesheet" type="text/css" href="css/front_css/reset.css"/>
	<link rel="stylesheet" href="css/front_css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/front_css/willesPlay.css"/>
	<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/front_js/willesPlay.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-md-12">
<div id="willesPlay">
	<div class="playHeader">
		<div class="videoName" style=" width:100%">Tara - 懂的那份感觉</div>
	</div>
	<div class="playContent">
		<div class="turnoff">
			<ul>
				<li><a href="javascript:;" title="喜欢" class="glyphicon glyphicon-heart-empty"></a></li>
				<li><a href="javascript:;" title="关灯" class="btnLight on glyphicon glyphicon-sunglasses"></a></li>
				<li><a href="javascript:;" title="分享" class="glyphicon glyphicon-share"></a></li>
			</ul>
		</div>
		<video width="100%" height="100%" id="playVideo">
			<source src=/jlmytk/VIDEO/1.mp4 type="video/mp4"></source>
		</video>
		<div class="playTip glyphicon glyphicon-play"></div>
	</div>
	<div class="playControll">
		<div class="playPause playIcon"></div>
		<div class="timebar">
			<div class="progress">
				<div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
			</div>
		</div>
		<div class="otherControl">
			<span class="volume glyphicon glyphicon-volume-down"></span>
			<span class="fullScreen glyphicon glyphicon-fullscreen"></span>
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
</body>
</html>
