<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'shiping.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<div id="a1"></div>
	<script src="../../static/ckplayer/ckplayer.js"></script>
	<script type="text/javascript">
		function loadedHandler() {
			if (CKobject.getObjectById('ckplayer_a1').getType()) {
				addPlayListener();
			} else {
				addPlayListener();
			}
		}
		function timeHandler(t) {
			if (t > -1) {
				SetCookie("Time", t);
			}
		}
		function addPlayListener() {//增加播放监听
			if (CKobject.getObjectById('ckplayer_a1').getType()) {//说明使用html5播放器
				CKobject.getObjectById('ckplayer_a1').addListener('play',
						playHandler);
			} else {
				CKobject.getObjectById('ckplayer_a1').addListener('play',
						'playHandler');
			}
		}
		function playHandler() {
			//alert('因为注册了监听播放，所以弹出此内容，删除监听将不再弹出');
			removePlayListener();
			CKobject.getObjectById('ckplayer_a1').videoSeek(getCookie("Time"));
			addTimeListener();
		}
		function removePlayListener() {//删除播放监听事件
			if (CKobject.getObjectById('ckplayer_a1').getType()) {//说明使用html5播放器
				CKobject.getObjectById('ckplayer_a1').removeListener('play',
						playHandler);
			} else {
				CKobject.getObjectById('ckplayer_a1').removeListener('play',
						'playHandler');
			}
		}
		function addTimeListener() {//增加时间监听
			if (CKobject.getObjectById('ckplayer_a1').getType()) {//说明使用html5播放器
				CKobject.getObjectById('ckplayer_a1').addListener('time',
						timeHandler);
			} else {
				CKobject.getObjectById('ckplayer_a1').addListener('time',
						'timeHandler');
			}
		}
		//写cookies函数
		function SetCookie(name, value)//两个参数，一个是cookie的名子，一个是值
		{
			var Days = 30; //此 cookie 将被保存 30 天
			var exp = new Date(); //new Date("December 31, 9998");
			exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
			document.cookie = name + "=" + escape(value) + ";expires="
					+ exp.toGMTString();
		}
		function getCookie(name)//取cookies函数
		{
			var arr = document.cookie.match(new RegExp("(^| )" + name
					+ "=([^;]*)(;|$)"));
			if (arr != null)
				return unescape(arr[2]);
			return null;
		}
		var flashvars={
				p:0,
				e:1,
				c: 0,
				b: 0,
				loaded: 'loadedHandler',
				i:'http://www.ckplayer.com/static/images/cqdw.jpg'
				};
			var video=['http://img.ksbbs.com/asset/Mon_1605/0ec8cc80112a2d6.mp4->video/mp4'];
			var support=['all'];
			CKobject.embedHTML5('a1','ckplayer_a1',600,400,video,flashvars,support);
	</script>
</body>
</html>
