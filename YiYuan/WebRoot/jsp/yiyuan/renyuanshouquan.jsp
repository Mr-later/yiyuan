<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>人员授权</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
     <link href="${path}/static/css/zzjg.css" rel="stylesheet">
      <link href="${path}/static/css/rysq.css" rel="stylesheet">
    <style>



    </style>




</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>人员授权</h5>
                        <div class="ibox-tools">
                        <a href="../index_v1.jsp" class="btn btn-primary btn-rounded btn-xs">返回主页</a>
                            <!-- <a href="" class="btn btn-primary btn-rounded btn-xs">新增</a>
                             <a href="" class="btn btn-primary btn-rounded btn-xs">编辑</a>
                              <a href="" class="btn btn-info btn-rounded btn-xs">删除</a> -->
                        </div>
                    </div>
                    <div>
                       <div class="wrapper wrapper-content animated fadeInRight" style="">

					        <div class="row text-center" style="display:block">
					    
										        <div class="col-sm-3" style="margin-left:38%;">
											          
											                <div class="widget red-bg p-lg text-center">
											               <!--  <span class="badge badge-warning"">12</span> -->
											                    <div class="m-b-md">
											                        <i class="fa fa-user-md fa-4x"></i>
											                        <h2 class="m-xs">&nbsp;</h2>
											                        <h2 class="font-bold no-margins">
											                               检验科
											                        </h2>
											                       
											                    </div>
											                </div>
											          
										           </div>
										        
					          
					        </div>
					         <div class="row text-center" >
					         	<div class="row_1" >
					         		
											                <div class="widget navy-bg p-lg text-center w100">
												                <span class="badge badge-danger">14</span>
												                    <div class="m-b-md fontlink_zu">
												                      
												                        <h2 class="font-bold no-margins">
												                                临检与血液组
												                        </h2>
												                       
												                    </div>
											                </div>
								
											                <div class="widget lazur-bg p-lg text-center w100">
											                    <div class="m-b-md fontlink_zu">
											                        
											                        <h2 class="font-bold no-margins ">
											                                  生化组
											                        </h2>
											                       
											                    </div>
											                </div>
											         
									                <div class="widget navy-bg p-lg text-center w100">
									                <span class="badge badge-danger">1</span>
									                    <div class="m-b-md fontlink_zu">
									                       
									                        <h2 class="font-bold no-margins">
									                                 免疫组
									                        </h2>
									                       
									                    </div>
									                </div>
									          
											                <div class="widget lazur-bg p-lg text-center w100">
											                    <div class="m-b-md fontlink_zu">
											                       
											                        <h2 class="font-bold no-margins">
											                                  微生物组
											                        </h2>
											                       
											                    </div>
											                </div>
											         
											                <div class="widget navy-bg p-lg text-center w100">
											                    <div class="m-b-md fontlink_zu">
											                       
											                        <h2 class="font-bold no-margins">
											                                  分子生物组
											                        </h2>
											                       
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


<%--     <!-- Peity -->
    <script src="${path}/static/js/plugins/peity/jquery.peity.min.js"></script>

    <!-- Peity -->
    <script src="${path}/static/js/demo/peity-demo.js"></script> --%>

   <script type="text/javascript">
        jQuery(document).ready(function() {
        	$('.fontlink_zu').click(function(){
      	      tiaozhuan();//跳转到人员授权-组
      	    });
             	
        });
        function tiaozhuan(){//跳转到人员授权-组
	    	location.href="renyuansq_gw.jsp"
	    };
       
  </script>  

</body>

</html>
