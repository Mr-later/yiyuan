<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>人员授权-岗位-人员</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${path}/static/css/animate.css" rel="stylesheet">
      <!--LAYER-->
    <link href="${path}/static/js/plugins/layer/skin/layer.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
     <link href="${path}/static/css/zzjg_gw_ry.css" rel="stylesheet">
    <style>
	
    </style>




</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>人员授权-岗位-人员</h5>
                        <div class="ibox-tools">
                        <a href="javascript:sqdc()" class="btn btn-primary btn-rounded btn-xs" >岗位授权导出</a>
                         <a href="javascript:sfsq2()" class="btn btn-primary btn-rounded btn-xs" >一键授权</a>
                         <a href="${path}/pageController/jumpPage?toPageName=yiyuan/renyuansq_gw" class="btn btn-primary btn-rounded btn-xs">返回</a><!-- renyuansq_gw.jsp -->
                            <!--  <a href="" class="btn btn-primary btn-rounded btn-xs">编辑</a>
                              <a href="" class="btn btn-info btn-rounded btn-xs">删除</a> -->
                        </div>
                    </div>
                   
		                       <div class="wrapper wrapper-content animated fadeInRight" style="">
		
							        <div class="row " >
							    	
		                        		
		                        		<div class="col-sm-12 ">
				                            <div class="ibox float-e-margins">
				                            <div class="ibox-content">
                      
						                        <div class="text-center"> 
							                     <!--   <a href="zuzzjg_gw_ryxq.jsp"> -->
							                        	 <div class="ibox-content text-center w10">
					                                		
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
							                                <div style="display:block;">
						                                		<a class="font-bold rm" onclick="opsqxq()">王毅1</a>
					
						                               			<div class="text-center h10">
						                                   			 副主任医师
						                                		</div>
						                                		<div class="h30" style="height:50px;">
						                                			<a type="button" class="btn btn-info btn-sm btn-sq" onclick="sfsq(this)">授权</a>
						                                		</div>
						                                	</div>
				                          				 </div>
													<!-- </a> -->
												<!-- 	<a href="zuzzjg_gw_ry.jsp"> -->
							                        	 <div class="ibox-content text-center w10">
					                                		
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<a class="font-bold rm" onclick="opsqxq()">王毅1</a>
				
					                               			<div class="text-center h10">
					                                   			 副主任医师
					                                		</div>
					                                		<a type="button" class="btn btn-info btn-sm btn-sq" onclick="sfsq(this)">授权</a>
				                          				 </div>
													<!-- </a> 
													<a href="zuzzjg_gw_ry.jsp">-->
							                        	 <div class="ibox-content text-center w10">
					                                		
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<a class="font-bold rm" onclick="opsqxq()">王毅1</a>
				
					                               			<div class="text-center h10">
					                                   			 副主任医师
					                                		</div>
					                                		<!-- <button type="button" class="btn btn-info btn-sm" onclick="sfsq()">授权</button> -->
				                          				 </div>
													<!-- </a>
													<a href="zuzzjg_gw_ry.jsp"> -->
							                        	 <div class="ibox-content text-center w10">
					                                		
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<a class="font-bold rm" onclick="opsqxq()">王毅1</a>
				
					                               			<div class="text-center h10">
					                                   			 副主任医师
					                                		</div>
					                                		<!-- <button type="button" class="btn btn-info btn-sm" onclick="sfsq()">授权</button> -->
				                          				 </div>
													<!-- </a>
													<a href="zuzzjg_gw_ry.jsp"> -->
							                        	 <div class="ibox-content text-center w10">
					                                		
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<a class="font-bold rm" onclick="opsqxq()">王毅1</a>
				
					                               			<div class="text-center h10">
					                                   			 副主任医师
					                                		</div>
					                                		<!-- <button type="button" class="btn btn-info btn-sm" onclick="sfsq()">授权</button> -->
				                          				 </div>
												<!-- 	</a>
													<a href="zuzzjg_gw_ry.jsp"> -->
							                        	 <div class="ibox-content text-center w10">
					                                		
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<a class="font-bold rm" onclick="opsqxq()">王毅1</a>
				
					                               			<div class="text-center h10">
					                                   			 副主任医师
					                                		</div>
					                                		<!-- <button type="button" class="btn btn-info btn-sm" onclick="sfsq()">授权</button> -->
				                          				 </div>
												<!-- 	</a>
													<a href="zuzzjg_gw_ry.jsp"> -->
							                        	 <div class="ibox-content text-center w10">
					                                		
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<a class="font-bold rm" onclick="opsqxq()">王毅1</a>
				
					                               			<div class="text-center h10">
					                                   			 副主任医师
					                                		</div>
					                                		<!-- <button type="button" class="btn btn-info btn-sm" onclick="sfsq()">授权</button> -->
				                          				 </div>
												<!-- 	</a>
													<a href="zuzzjg_gw_ry.jsp"> -->
							                        	 <div class="ibox-content text-center w10">
					                                		
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<a class="font-bold rm" onclick="opsqxq()">王毅1</a>
				
					                               			<div class="text-center h10">
					                                   			 副主任医师
					                                		</div>
					                                		<!-- <button type="button" class="btn btn-info btn-sm" onclick="sfsq()">授权</button> -->
				                          				 </div>
												<!-- 	</a>
													<a href="zuzzjg_gw_ry.jsp"> -->
							                        	 <div class="ibox-content text-center w10">
					                                		
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<a class="font-bold rm" onclick="opsqxq()">王毅1</a>
				
					                               			<div class="text-center h10">
					                                   			 副主任医师
					                                		</div>
					                                		<!-- <button type="button" class="btn btn-info btn-sm" onclick="sfsq()">授权</button> -->
				                          				 </div>
													<!-- </a>
													<a href="zuzzjg_gw_ry.jsp"> -->
							                        	 <div class="ibox-content text-center w10">
					                                		
							                                <div class="m-b-sm">
							                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
							                                </div>
					                                		<a class="font-bold rm" onclick="opsqxq()">王毅1</a>
				
					                               			<div class="text-center h10">
					                                   			 副主任医师
					                                		</div>
					                                		<!-- <button type="button" class="btn btn-info btn-sm" onclick="sfsq()">授权</button> -->
				                          				 </div>
													<!-- </a> -->
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
        	
             	alert(${pid})
        }); 
        //返回上一步
        function goback1(){
        	window.history.back(-1);
        }
      //是否授权
        function sfsq(o) {
        	var a=$(o).text();
        	
        	if (a =="授权"){
             layer.confirm('确认授权？',
            		 {
                       btn: ['确认','取消'] //按钮
                     }, 
                       function(){//确认就变成紫色
                    	 $(o).removeClass('btn-info');
         				$(o).addClass('btn-primary');
                     
                       $(o).text('取消授权');
                       /* a.remove(); */
                       layer.msg('已授权', {icon: 1});
                        }
              );
        	}
        	else{
        		layer.confirm('取消授权？', 
        			{btn: ['确认','取消'] //按钮
        			}, 
        			function(){//确认就变蓝色
        				 $(o).removeClass('btn-primary');
                         $(o).addClass('btn-info');
                    	layer.msg('已取消授权', {icon: 1});    
                    	$(o).text('授权');/* a.remove(); */}
                );
        	}
        	
      };
      //是否一键授权
        function sfsq2() {

             layer.confirm('确认全部授权？', {
                            btn: ['确认','取消'] //按钮
                            }, function(){//确认就删除
                                  var a=$('.btn-sq');
                                  $('.btn-sq').text('取消授权');
                                  $('.btn-sq').removeClass('btn-info');
                                  $('.btn-sq').addClass('btn-primary');
                                     /*  a.remove(); */
                                      layer.msg('全部已授权', {icon: 1});
                        });
      }
        //岗位授权导出
        function sqdc() {

        	 layer.open({
                /*  type: 2 //Page层类型
                 ,area: ['95%', '80%']
        	 	 ,title: false //不显示标题栏
                 ,shade: 0.6 //遮罩透明度
                 ,maxmin: false //允许全屏最小化
                 ,anim: 5 //0-6的动画形式，-1不开启 */
                 type: 2 //Page层类型
                 ,area: ['90%', '90%']
                 ,title: '岗位授权-导出'
                 ,shade: 0.6 //遮罩透明度
                 ,maxmin: false //允许全屏最小化
                 ,anim: 5 //0-6的动画形式，-1不开启
                 ,content: ['rysq_gwsq_dc.jsp']
               });    
     }
        //打开授权详情
        function opsqxq() {

        	 layer.open({
                 /* type: 2 //Page层类型
                 ,area: ['95%', '80%']
        	 	 ,title: false //不显示标题栏
                 ,shade: 0.6 //遮罩透明度
                 ,maxmin: false //允许全屏最小化
                 ,anim: 5 //0-6的动画形式，-1不开启 */
                 type: 2 //Page层类型
                 ,area: ['90%', '90%']
                 ,title: '授权详情'
                 ,shade: 0.6 //遮罩透明度
                 ,maxmin: false //允许全屏最小化
                 ,anim: 5 //0-6的动画形式，-1不开启
                 ,content: ['rysq_gwsq_sqxq.jsp']
               });    
     }
  </script>  

</body>

</html>
