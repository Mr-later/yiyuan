<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>实验室人员管理系统-登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
	<link rel="shortcut icon" href="static/img/favicon.ico">
    <link href="${path}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="${path}/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${path}/static/css/animate.min.css" rel="stylesheet">
    <link href="${path}/static/css/style.min.css" rel="stylesheet">
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">M+</h1>

            </div>
            <h3>欢迎进入实验室人员管理系统</h3>
           
            <form class="m-t" role="form" action="${path}/ajaxLogin"  method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="请输入用户名"  id="loginName" name="loginName">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="请输入密码" id="password" name="password" >
                </div>
                <div class="form-group text-left">
                    <input type="checkbox" id="checkbox" name="checkbox"> 记住我
                </div>
            
                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>

              

            </form>
        </div>
    </div>

    <!-- 全局js -->
    <script src="${path}/static/js/jquery-2.1.1.min.js"></script>
    <script src="${path}/static/js/bootstrap.min.js?v=3.4.0"></script>
    <!-- iCheck -->
    <script src="${path}/static/js/plugins/iCheck/icheck.min.js"></script>
    <script>
/*        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });*/
    </script>

</body>

</html>
