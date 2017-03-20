<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>结构管理-组-人员</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${path}/static/css/animate.css" rel="stylesheet">
      <!--LAYER-->
    <link href="${path}/static/js/plugins/layer/skin/layer.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
     <link href="${path}/static/css/zzjg_z_ry.css" rel="stylesheet">
     <link href="${path}/static/css/zzjg_gw.css" rel="stylesheet">
    <style>
		
    </style>




</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>组织结构-${parentOrg.orgname}-岗位</h5>
                        <div class="ibox-tools">
                         	<a onclick="opadd(${parentOrg.id})" class="btn btn-primary btn-rounded btn-xs">新增</a>
                         	<a onclick="opedit()" class="btn btn-primary btn-rounded btn-xs">编辑</a>
                         	<a onclick="deldiv()" class="btn btn-primary btn-rounded btn-xs">删除</a>
                            <a href="${path}/jsp/yiyuan/zuzhijiegou.jsp" class="btn btn-primary btn-rounded btn-xs">返回</a>
                            <!--  <a href="" class="btn btn-primary btn-rounded btn-xs">编辑</a>
                              <a href="" class="btn btn-info btn-rounded btn-xs">删除</a> -->
                        </div>
                    </div>
                   
		                       <div class="wrapper wrapper-content animated fadeInRight" style="">
		
							        <div class="row " >
							    		<div class="col-sm-2">
							    		<!-- 组长列表遍历 -->
							    		<c:forEach items="${fuzhuzhangs}"  var="template">
				                            <div class="ibox-content text-center">
					                                <h1>${template.zhiwu }</h1>
						                                <div class="m-b-sm">
						                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
						                                </div>
					                                <p class="font-bold">${template.username }</p>
				
					                                <div class="text-center">
					                                    ${template.zhicheng }
					                                </div>
				                            </div>
				                            </c:forEach>
				                            <!-- 副组长列表遍历 -->
				                            <c:forEach items="${ zhuzhangs}" var="template">
				                             <div class="ibox-content text-center">
					                                <h1>${template.zhiwu}</h1>
						                                <div class="m-b-sm">
						                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
						                                </div>
					                                <p class="font-bold">${template.username }</p>
				
					                                <div class="text-center">
					                                   ${template.zhicheng }
					                                </div>
				                            </div>
				                            </c:forEach>
		                        		</div>
		                        		<!-- 岗位列表遍历 -->
		                        		<div class="col-sm-10 ">
				                            <div class="ibox float-e-margins">
				                            <div class="ibox-content">
                      
						                        <div class="text-center"> 
							                       <c:forEach items="${yyOrginfoList}" var="tempElement">
							                        	<div class="widget style1 lazur-bg w10" id="${tempElement.id}"  onclick="go_renyuan(${tempElement.id})">
							                        	
																	                    <div class="row vertical-align">
																	                       
																	                        <div class="text-right">
																	                            <h2 class="font-bold" style="word-wrap: break-word;">${tempElement.orgname}</h2>
																	                        </div>
																	                    </div>
																
														</div>
													</c:forEach>
													<!-- <div class="widget style1 lazur-bg w10">
																                    <div class="row vertical-align">
																                       
																                        <div class="text-right">
																                            <h2 class="font-bold" style="width:10%;word-wrap: break-word;">门诊体液仪器镜检岗</h2>
																                        </div>
																                    </div>
													</div>
													<div class="widget style1 lazur-bg w10">
																                    <div class="row vertical-align">
																                       
																                        <div class="text-right">
																                            <h2 class="font-bold" style="width:10%;word-wrap: break-word;">病房血液仪器镜检岗</h2>
																                        </div>
																                    </div>
													</div>
													<div class="widget style1 lazur-bg w10">
																                    <div class="row vertical-align">
																                       
																                        <div class="text-right">
																                            <h2 class="font-bold" style="width:10%;word-wrap: break-word;">病房体液仪器镜检岗</h2>
																                        </div>
																                    </div>
													</div>
													<div class="widget style1 lazur-bg w10">
																                    <div class="row vertical-align">
																                       
																                        <div class="text-right">
																                            <h2 class="font-bold" style="width:10%;word-wrap: break-word;">儿科病房采血岗</h2>
																                        </div>
																                    </div>
													</div>
													<div class="widget style1 lazur-bg w10">
																                    <div class="row vertical-align">
																                       
																                        <div class="text-right">
																                            <h2 class="font-bold" style="width:10%;word-wrap: break-word;">血液病房采血岗</h2>
																                        </div>
																                    </div>
													</div>
													<div class="widget style1 lazur-bg w10">
													
																                    <div class="row vertical-align">
																                       
																                        <div class="text-right">
																                            <h2 class="font-bold" style="width:10%;word-wrap: break-word;">凝血检测岗</h2>
																                        </div>
																                    </div>
													</div>
													<div class="widget style1 lazur-bg w10">
																                    <div class="row vertical-align">
																                       
																                        <div class="text-right">
																                            <h2 class="font-bold" style="width:10%;word-wrap: break-word;">急诊临检仪器岗</h2>
																                        </div>
																                    </div>
													</div>
													<div class="widget style1 lazur-bg w10">
																                    <div class="row vertical-align">
																                       
																                        <div class="text-right">
																                            <h2 class="font-bold" style="width:10%;word-wrap: break-word;">急诊采血窗口岗</h2>
																                        </div>
																                    </div>
													</div>
													<div class="widget style1 lazur-bg w10">
																                    <div class="row vertical-align">
																                       
																                        <div class="text-right">
																                            <h2 class="font-bold" style="width:10%;word-wrap: break-word;">流式细胞术检测岗</h2>
																                        </div>
																                    </div>
													</div>
													<div class="widget style1 lazur-bg w10">
																                    <div class="row vertical-align">
																                       
																                        <div class="text-right">
																                            <h2 class="font-bold" style="width:10%;word-wrap: break-word;">血液流变检测岗</h2>
																                        </div>
																                    </div>
													</div>
														<div class="widget style1 lazur-bg w10">
																                    <div class="row vertical-align">
																                       
																                        <div class="text-right">
																                            <h2 class="font-bold" style="width:10%;word-wrap: break-word;">脱落细胞检测岗</h2>
																                        </div>
																                    </div>
													</div>
													<div class="widget style1 lazur-bg w10">
																                    <div class="row vertical-align">
																                       
																                        <div class="text-right">
																                            <h2 class="font-bold" style="width:10%;word-wrap: break-word;">脱落细胞检测岗</h2>
																                        </div>
																                    </div>
													</div> -->
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
    <script type="text/javascript" src="${path}/static/js/plugins/layer/extend/layer.ext.js"></script>


   <script type="text/javascript">
        jQuery(document).ready(function() {
        	$('.w10').click(function(){
        		if ( $(this).hasClass('selected') ) {
                    $(this).removeClass('selected');
                    }
                else {
                    $('.selected').removeClass('selected');
                    $(this).addClass('selected');
                    }
      	    });
             	
        }); 
      
        
        function deldiv(){ //点击删除按钮 就删除当前的div 
                if($('div').hasClass('selected')){
                	$('.w10').each(function(index,item){
                        if($(item).hasClass('selected')){
                            layer.prompt({title: '请输入登陆密码确认删除', formType: 1}, function(pass, index){
	                            	$.ajax({
	                   		 		 cache: true,
	                   	             type: "POST",
	                   	             url:'${path}/orgController/passwordConform?pw='+pass+'&id='+item.id,
	                   	             async: false,
	                   	             success: function(data) {
	                   	            	 if(data.success==true)
	                   	            	 {
	                   	            		 layer.close(index);
	                   	            		 var a=$('.selected');
	                                         a.remove();
	                       	        		 layer.msg("删除成功！");
	                   	            	 }
	                   	            	 else{
	                   	            		 layer.msg("密码错误！");
	                   	            	 }
	                   	            	 
	                   	             }
	                   		 		
	                   		 	});	
                            });
                        }
                        
                    })
                }
                else{
                	layer.msg('您没有选择要删除的岗位');
                }
     	   
     	 
        };
        function opedit(){ //点击按钮 打开编辑页面 
        	if($('div').hasClass('selected')){
            	$('.w10').each(function(index,item){
                    if($(item).hasClass('selected')){
                        layer.open({
                            type: 2 //Page层类型
                            ,area: ['30%', '35%']
                            ,title: '组织结构-岗位-编辑'
                            ,shade: 0.6 //遮罩透明度
                            ,maxmin: false //允许全屏最小化
                            ,anim: 5 //0-6的动画形式，-1不开启
                            ,content:['${path}/orgController/toEditPageGw?id='+item.id]//zzjg_gw_edit.jsp
                           
                          });    

                    }
                    
                })
            }
            else{
            	layer.msg('您没有选择要编辑的岗位');
            }
        	
        	
     	   
        };
        function opadd(id){ //点击按钮 打开新增页面 
     	   layer.open({
                type: 2 //Page层类型
                ,area: ['30%', '35%']
                ,title: '组织结构-岗位-新增'
                ,shade: 0.6 //遮罩透明度
                ,maxmin: false //允许全屏最小化
                ,anim: 5 //0-6的动画形式，-1不开启
                ,content:['${path}/orgController/toAddPageGw?pid='+id]//zzjg_gw_add.jsp
               
              });    
    
     	 
        }
        function go_renyuan(index){
        	location.href="${path}/orgController/GetUsersByOrgid?id="+index+"&gopage=yiyuan/zuzzjg_gw_ry";
        }
  </script>  

</body>

</html>
