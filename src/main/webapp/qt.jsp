<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		$(function(){
			wx_loadUserInfo();
		});
		function wx_loadUserInfo() {
			var openid='${openid}';
			if (''==openid || 'undefinde'==openid) {
				$.ajaxSetup({async:false});
				//获取CODE
				$.post('Wx/UserAuthorize.do',function(data){
					//跳转到获取用户信息接口
					location.href=data;
				});
			}else{
				var nickname=localStorage.getItem("nickname");
				if (''!=nickname || 'null'!=nickname || 'undefinde'!=nickname) {
					localStorage.setItem('nickname','${nickname}');
					localStorage.setItem('headimgurl','${headimgurl}');
					$.get('Wx/clearValue.do');
				}
				//跳转到前台首页
				location.href='index.do';
			}
		}
	</script>
</head>
<body>
</body>
</html>
