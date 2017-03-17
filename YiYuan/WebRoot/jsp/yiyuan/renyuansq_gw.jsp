<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>人员授权-岗位</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
     <link href="${path}/static/css/zzjg_z_ry.css" rel="stylesheet">
      <link href="${path}/static/css/rysq_gw.css" rel="stylesheet">
    <style>
	
    </style>




</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>人员授权-${parentOrg.orgname}-岗位</h5>
                        <div class="ibox-tools">
                            <a href="${path}/pageController/jumpPage?toPageName=yiyuan/renyuanshouquan" class="btn btn-primary btn-rounded btn-xs">返回</a><!-- renyuanshouquan.jsp -->
                            <!--  <a href="" class="btn btn-primary btn-rounded btn-xs">编辑</a>
                              <a href="" class="btn btn-info btn-rounded btn-xs">删除</a> -->
                        </div>
                    </div>
                
		                       <div class="wrapper wrapper-content animated fadeInRight" style="">
		
							        <div class="row " >
							    		<div class="col-sm-2"  id="shangjijiedian">
				                            <div class="ibox-content text-center">
					                                <h1>组长</h1>
						                                <div class="m-b-sm">
						                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
						                                </div>
					                                <p class="font-bold">王毅</p>
				
					                                <div class="text-center">
					                                    主任医师
					                                </div>
				                            </div>
				                             <div class="ibox-content text-center">
					                                <h1>副组长</h1>
						                                <div class="m-b-sm">
						                                    <img alt="image" class="img-circle" src="${path}/static/img/1cun.jpg">
						                                </div>
					                                <p class="font-bold">王毅</p>
				
					                                <div class="text-center">
					                                    副主任医师
					                                </div>
				                            </div> 
		                        		</div>
		    
		                        		                		
		                        		<div class="col-sm-10 ">
				                            <div class="ibox float-e-margins">
				                            <div class="ibox-content">
                      
						                        <div class="text-center"  id="xiajijiedian"> 
						                         <c:forEach items="${yyOrginfoList}" var="tempElement">
							                        	<a href="${path}/pageController/jumpPage?toPageName=yiyuan/renyuansq_gw_ry"><!-- renyuansq_gw_ry.jsp -->
							                        	<div class="widget style1 lazur-bg w10">
							                        	<span class="badge badge-danger">2</span>
																	                    <div class="row vertical-align">
																	                       
																	                        <div class="text-right">
																	                            <h2 class="font-bold" style="word-wrap: break-word;">${tempElement.orgname}</h2>
																	                        </div>
																	                    </div>
														</div>
													</a>
													</c:forEach>
							                        <!-- <a href="renyuansq_gw_ry.jsp">
							                        	<div class="widget style1 lazur-bg w10">
							                        	<span class="badge badge-danger">2</span>
																	                    <div class="row vertical-align">
																	                       
																	                        <div class="text-right">
																	                            <h2 class="font-bold" style="word-wrap: break-word;">门诊血液仪器镜检岗</h2>
																	                        </div>
																	                    </div>
														</div>
													</a>
													<div class="widget style1 lazur-bg w10">
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
													<span class="badge badge-danger">12</span>
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


  <%--   <!-- Peity -->
    <script src="${path}/static/js/plugins/peity/jquery.peity.min.js"></script>

    <!-- Peity -->
    <script src="${path}/static/js/demo/peity-demo.js"></script> --%>

   <script type="text/javascript">
        
        //返回上一步
        function goback1(){
        	window.history.back(-1);
        }
  </script>  

</body>

</html>
