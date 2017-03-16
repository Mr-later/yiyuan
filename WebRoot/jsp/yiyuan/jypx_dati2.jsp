<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>教育培训-已学习(答题)</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!--LAYER-->
    <link href="${path}/static/js/plugins/layer/skin/layer.css" rel="stylesheet">
    
    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
     <link href="${path}/static/css/zzjg.css" rel="stylesheet">
     <link href="${path}/static/css/jypx_dati.css" rel="stylesheet">
   
    <style>

    </style>




</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>教育培训-已学习(答题)</h5>
                        <div class="ibox-tools">
                           <a class="btn btn-primary btn-rounded btn-xs" href="jiaoyupeixun.jsp">返回</a>
                           
                        </div>
                    </div>
                    <div>
                       <div class="wrapper wrapper-content animated fadeInRight" style="">
							 <div class="row">
							  	
			                    <div class="col-sm-10  cont1" style="padding-right:0;">
			                        <div class="ibox float-e-margins">
			                           
			                            <div class="ibox-content1" style="border-top:none;">
			                                这里是pdf、word、wps预览页面
			                            </div>
			                        </div>
			                    </div>
			                    <div class="col-sm-2  cont2" style="padding-left:0;">
			                        <div class="ibox float-e-margins " style="">
			                         	
			                            <div class="ibox-content" style="border-top:none;background-color:#F8F8FF;">
			                              <div class="shubtn" style="width:65%">
				                               <a class="btn btn-primary btn-rounded btn33" onclick="qrxx()" style="visibility:hidden;">确认学习</a>
				                               <a class="btn btn-primary btn-rounded btn44">开始答题</a>
			                               </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
               
						</div>
                    </div>
                      
                </div>
            </div>
        </div>
           
    </div>
 

    <!-- 全局js -->
    <script src="${path}/static/js/jquery.min.js"></script>
    <script src="${path}/static/js/bootstrap.min.js"></script>
    <script src="${path}/static/js/plugins/iCheck/icheck.min.js"></script>
 	
    <!-- 自定义js -->
    <script src="${path}/static/js/content.js"></script>
 	<!--layer弹出层-->
    <script type="text/javascript" src="${path}/static/js/plugins/layer/layer.min.js"></script>
  
   <script type="text/javascript">
  
  jQuery(document).ready(function() {
	  hwzsy2();//获得左侧题目的总高度，左侧赋给右侧
	   	$('.btn33').click(function(){
	   	      qrxx();//弹出确认学习
	   	    });
		$('.btn44').click(function(){
	   	      tiaozhuan44();//弹出确认学习
	   	    });
   }); 
	   function tiaozhuan44(){//跳转到教育培训-答题内容页面
	   	location.href="jypx_datict.jsp"
	   }; 
	   //返回上一步
       function goback1(){
       	window.history.back(-1);
       };
   	//确认学习
       function qrxx(){ 
       		layer.confirm('确认学习？', {
                   btn: ['确认','取消'] //按钮
                   }, function(){//确认就删除
                	   $('.btn33').css('visibility','hidden');
                     layer.msg('已学习！', {icon: 1});
                  /*  $(this).parent().parent().css('display','none') */
               });
           
       };
     //获得左侧题目的总高度，左侧赋给右侧，保证两侧一样高度
       function hwzsy2(){
           x=$(".cont1").height();//动态获得左侧题目总高度 可自适应大小
               $("div.cont2 div div.ibox-content").css({
                 "height":x-23+"px"
                 });
         
       };
  </script>  

</body>

</html>
