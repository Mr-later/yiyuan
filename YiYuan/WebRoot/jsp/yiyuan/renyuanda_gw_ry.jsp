<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>人员档案-岗位-人员</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${path}/static/css/animate.css" rel="stylesheet">
      <!--LAYER-->
    <link href="${path}/static/js/plugins/layer/skin/layer.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
     <link href="${path}/static/css/zzjg_gw_ry.css" rel="stylesheet">
      <link href="${path}/static/css/ryda_gw_ry.css" rel="stylesheet">
    <style>
a.btn1{display:none;}
    </style>




</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>人员档案-岗位-人员</h5>
                        <div class="ibox-tools">
                        <a href="jypx_rydd.jsp" class="btn btn-primary btn-rounded btn-xs">人员调动</a>
                        	<a onclick="opadd(${id })" class="btn btn-primary btn-rounded btn-xs">新增</a>
                            <a onclick="back(${pid })"  class="btn btn-primary btn-rounded btn-xs">返回</a> <!-- //renyuanda_gw.jsp -->
                          
                        </div>
                    </div>
                   
		                       <div class="wrapper wrapper-content animated fadeInRight" style="">
		
							        <div class="row " >
		                        		
		                        		<div class="col-sm-12 ">
				                            <div class="ibox float-e-margins">
				                            <div class="ibox-content">
                      
						                        <div class="text-center"> 
							                   			<c:forEach items="${users}" var="template">
							                        	<div class="ibox-content text-center w10" ondblclick="xianshi(this)">
					                                		 <a class="btn btn-danger btn-circle btn1" onclick="deldiv(this)" title="删除"><i class="fa fa-close"></i></a>
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
							                                <div style="display:block;" class="ryxqhref">
						                                		<p class="font-bold">${template.username }</p>
					
						                               			<div class="text-center h10">
						                                   			 ${template.zhicheng }
						                                		</div>
						                                		
						                                	</div>
				                          				 </div>
				                          				 </c:forEach>
							                        	<%--  <div class="ibox-content text-center w10" ondblclick="xianshi(this)">
					                                		 <a class="btn btn-danger btn-circle btn1" onclick="deldiv(this)" title="删除"><i class="fa fa-close"></i></a>
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
							                                <div style="display:block;" class="ryxqhref">
						                                		<p class="font-bold">王毅1</p>
					
						                               			<div class="text-center h10">
						                                   			 副主任医师
						                                		</div>
						                                		
						                                	</div>
				                          				 </div>
												
							                        	 <div class="ibox-content text-center w10"  ondblclick="xianshi(this)">
					                                		 <a class="btn btn-danger btn-circle btn1" onclick="deldiv(this)" title="删除"><i class="fa fa-close"></i></a>
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<div style="display:block;" class="ryxqhref">
						                                		<p class="font-bold">王毅2</p>
					
						                               			<div class="text-center h10">
						                                   			 副主任医师
						                                		</div>
						                                		
						                                	</div>
					                                		
				                          				 </div>
												
							                        	 <div class="ibox-content text-center w10"  ondblclick="xianshi(this)">
					                                		 <a class="btn btn-danger btn-circle btn1" onclick="deldiv(this)" title="删除"><i class="fa fa-close"></i></a>
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<div style="display:block;" class="ryxqhref">
						                                		<p class="font-bold">王毅3</p>
					
						                               			<div class="text-center h10">
						                                   			 副主任医师
						                                		</div>
						                                		
						                                	</div>
				                          				 </div>
													
							                        	 <div class="ibox-content text-center w10"  ondblclick="xianshi(this)">
					                                		 <a class="btn btn-danger btn-circle btn1" onclick="deldiv(this)" title="删除"><i class="fa fa-close"></i></a>
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<div style="display:block;" class="ryxqhref">
						                                		<p class="font-bold">王4</p>
					
						                               			<div class="text-center h10">
						                                   			 副主任医师
						                                		</div>
						                                		
						                                	</div>
				                          				 </div>
											
													
							                        	 <div class="ibox-content text-center w10"  ondblclick="xianshi(this)">
					                                		<a class="btn btn-danger btn-circle btn1" onclick="deldiv(this)" title="删除"><i class="fa fa-close"></i></a>
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<div style="display:block;" class="ryxqhref">
						                                		<p class="font-bold">王毅5</p>
					
						                               			<div class="text-center h10">
						                                   			 副主任医师
						                                		</div>
						                                		
						                                	</div>
				                          				 </div>
												
							                        	 <div class="ibox-content text-center w10" ondblclick="xianshi(this)">
					                                		<a class="btn btn-danger btn-circle btn1" onclick="deldiv(this)" title="删除"><i class="fa fa-close"></i></a>
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<div style="display:block;" class="ryxqhref">
						                                		<p class="font-bold">王毅6</p>
					
						                               			<div class="text-center h10">
						                                   			 副主任医师
						                                		</div>
						                                		
						                                	</div>
				                          				 </div>
											
							                        	 <div class="ibox-content text-center w10"  ondblclick="xianshi(this)">
					                                		 <a class="btn btn-danger btn-circle btn1" onclick="deldiv(this)" title="删除"><i class="fa fa-close"></i></a>
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<div style="display:block;" class="ryxqhref">
						                                		<p class="font-bold">王毅7</p>
					
						                               			<div class="text-center h10">
						                                   			 副主任医师
						                                		</div>
						                                		
						                                	</div>
				                          				 </div>
										
							                        	 <div class="ibox-content text-center w10"  ondblclick="xianshi(this)">
					                                		 <a class="btn btn-danger btn-circle btn1" onclick="deldiv(this)" title="删除"><i class="fa fa-close"></i></a>
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<div style="display:block;" class="ryxqhref">
						                                		<p class="font-bold">王毅8</p>
					
						                               			<div class="text-center h10">
						                                   			 副主任医师
						                                		</div>
						                                		
						                                	</div>
				                          				 </div>
												
							                        	 <div class="ibox-content text-center w10"  ondblclick="xianshi(this)">
					                                		 <a class="btn btn-danger btn-circle btn1" onclick="deldiv(this)" title="删除"><i class="fa fa-close"></i></a>
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<div style="display:block;" class="ryxqhref">
						                                		<p class="font-bold">王毅9</p>
					
						                               			<div class="text-center h10">
						                                   			 副主任医师
						                                		</div>
						                                		
						                                	</div>
					                                	
				                          				 </div> --%>

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



    <!-- 自定义js -->
    <script src="${path}/static/js/content.js"></script>
  <!--layer弹出层-->
    <script type="text/javascript" src="${path}/static/js/plugins/layer/layer.min.js"></script>
 

  <%--   <!-- Peity -->
    <script src="${path}/static/js/plugins/peity/jquery.peity.min.js"></script>

    <!-- Peity -->
    <script src="${path}/static/js/demo/peity-demo.js"></script> --%>

   <script type="text/javascript">
   jQuery(document).ready(function() {
   	$('.ryxqhref').click(function(){
   	      tiaozhuan();//跳转到-人员详情
   	    });
   }); 
   function tiaozhuan(){//跳转到-人员详情
   	location.href="zuzzjg_gw_ryxq.jsp"
   };
  function deldiv(o){ //点击删除按钮 就删除当前的div 
	   layer.confirm('确认删除此人员？', {
          btn: ['确认','取消'] //按钮
          }, function(){//确认就删除
                var a=$(o).parent();
                    a.remove();
                    layer.msg('已删除', {icon: 1});
      });
	 
  };
  function opedit(){ //点击按钮 打开编辑页面 
	   layer.open({
          type: 2 //Page层类型
          ,area: ['30%', '40%']
          ,title: '人员档案-人员-编辑'
          ,shade: 0.6 //遮罩透明度
          ,maxmin: false //允许全屏最小化
          ,anim: 5 //0-6的动画形式，-1不开启
          ,content:['renyuanda_edit.jsp']
         
        });    

  };
  function opadd(index){ //点击按钮 打开新增页面 
	   layer.open({
          type: 2 //Page层类型
          ,area: ['70%', '80%']
          ,title: '人员档案-人员-新增'
          ,shade: 0.6 //遮罩透明度
          ,maxmin: false //允许全屏最小化
          ,anim: 5 //0-6的动画形式，-1不开启
          ,content:['${path}/renYuanDaController/toAddPage?orgid='+index]/* 'renyuanda_add.jsp' */
         
        });    

	 
  };
        //返回上一步
        function goback1(){
        	window.history.back(-1);
        }
        function xianshi(z){
        	a=$(z).find(".btn1");
        	a.css("display","block");
        }
		//返回岗位层
		function back(index){
			location.href="${path}/renYuanDaController/listByPid?id="+index;
		}
  </script>  

</body>

</html>
