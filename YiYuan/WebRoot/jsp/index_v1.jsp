<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 首页</title>

    <meta name="keywords" content="">
    <meta name="description" content="">


    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css" rel="stylesheet">
    <link href="${path}/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css" rel="stylesheet">
     <link href="${path}/static/css/index_v1.css" rel="stylesheet">
    <style>

    </style>


</head>

<body class="gray-bg" style="">
       <div class="wrapper wrapper-content animated fadeInRight" style="margin-top:10%">

	        <div class="row">
	    
			        
				         <%-- <a href="yiyuan/renyuandangan.jsp"> --%>
				         <a href="${path}/pageController/jumpPage?toPageName=yiyuan/renyuandangan">
				                <div class="widget navy-bg p-lg text-center">
				                    <div class="m-b-md">
				                        <i class="fa fa-file-text-o fa-4x"></i>
				                        <h2 class="m-xs">&nbsp;</h2>
				                        <h2 class="font-bold no-margins">
				                                人员档案
				                        </h2>
				                       
				                    </div>
				                </div>
				            </a> 
			        
				        
				                  <%--<a href="yiyuan/renyuanshouquan.jsp">  --%> 
				                <a href="${path}/pageController/jumpPage?toPageName=yiyuan/renyuanshouquan">
				                <div class="widget yellow-bg p-lg text-center">
				                    <div class="m-b-md">
				                        <i class="fa fa-gears fa-4x"></i>
				                       <h2 class="m-xs">&nbsp;</h2>
				                        <h2 class="font-bold no-margins">
				                                授权管理
				                        </h2>
				                       
				                    </div>
				                </div>
				            </a> 
			      
				          <!-- <a href="yiyuan/zuzhijiegou.jsp"> -->
				          <a href="${path}/pageController/jumpPage?toPageName=yiyuan/zuzhijiegou">
				                <div class="widget lazur-bg p-lg text-center">
				                    <div class="m-b-md">
				                        <i class="fa fa-object-ungroup fa-4x"></i>
				                        <h2 class="m-xs">&nbsp;</h2>
				                        <h2 class="font-bold no-margins">
				                                组织结构
				                        </h2>
				                       
				                    </div>
				                </div>
				            </a> 
			       
		          <!--<a href="yiyuan/jiaoyupeixun.jsp">  -->
		          <a href="${path}/pageController/jumpPage?toPageName=yiyuan/jiaoyupeixun">
		                <div class="widget red-bg p-lg text-center">
		                    <div class="m-b-md">
		                        <i class="fa fa-map fa-4x"></i>
		                       <h2 class="m-xs">&nbsp;</h2>
		                        <h2 class="font-bold no-margins">
		                                教育培训
		                        </h2>
		                       
		                    </div>
		                </div>
		            </a> 
	          
	          
	        </div>


    	</div>
    <!-- 全局js -->
    <script src="${path}/static/js/jquery.min.js"></script>
    <script src="${path}/static/js/jquery-ui-1.10.4.min.js"></script>
    <script src="${path}/static/js/bootstrap.min.js"></script>



    <!-- 自定义js -->
    <script src="${path}/static/js/content.js"></script>


    <!-- iCheck -->
    <script src="${path}/static/js/plugins/iCheck/icheck.min.js"></script>

    <!-- Jvectormap -->
    <script src="${path}/static/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="${path}/static/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

    <!-- Flot -->
    <script src="${path}/static/js/plugins/flot/jquery.flot.js"></script>
    <script src="${path}/static/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="${path}/static/js/plugins/flot/jquery.flot.resize.js"></script>
    <script>
           
    </script>

    
    

</body>

</html>
