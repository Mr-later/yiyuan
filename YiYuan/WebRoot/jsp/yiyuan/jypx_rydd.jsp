<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>人员调动</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
     <!--LAYER-->
    <link href="${path}/static/js/plugins/layer/skin/layer.css" rel="stylesheet">
    
      <!-- Data Tables -->
    <link href="${path}/static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
   
    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
     <link href="${path}/static/css/zzjg.css" rel="stylesheet">
     <link href="${path}/static/css/jypx.css" rel="stylesheet">
      <!-- jstree -->
    <link href="${path}/static/css/plugins/jsTree/style.min.css" rel="stylesheet">
    <style>
.red{color:#a94442;font-weight:bold}
.green{color:#3c763d;font-weight:bold}
.pur{color:#8E388E;font-weight:bold}
.fwb{font-weight:bold}
.client-avatar img {
    width: 45px;
    height: 55px;
    border-radius: 50%;
}
    </style>




</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>人员调动</h5>
                        <div class="ibox-tools">
                           <a href="renyuanda_gw_ry.jsp" class="btn btn-primary btn-rounded btn-xs">返回</a>
                            
                        </div>
                    </div>
                    <div>
                       <div class="wrapper wrapper-content animated fadeInRight" style="">
							 <div class="row">
							  	
			                    <div class="col-sm-12">
			                        <div class="ibox float-e-margins">
			                            <div class="ibox-title" style="border-bottom:none;height:60px">
			                               <div class="selecttree" style="">   
							  					<div class="col-sm-1" style="width:6%">       
			                             			<label class="" style="margin-top:7%">姓名</label>
			                             		</div>
				                                
				                               <div class="col-sm-2">
				                                	<input type="text" class="form-control" id="" name="" placeholder="" >
				                                </div>                                                                                                                                                             
				                              
				                                
				                                 <div class="col-sm-1">
				                                 	
				                                 	<a class="btn btn-info btn-rounded">查询</a>
				                                 </div>
				                                
			                    			</div>
			                            </div>
			                            <div class="ibox-content" style="border-top:none;">
			                                <table class="table table-striped table-bordered table-hover dataTables-example dataTable" id="editable">
					                            	<thead>
						                                <tr>
						                                	<th class="col-sm-1">id</th>
						                                	<th class="col-sm-1">照片</th>
						                                    <th class="col-sm-2">姓名</th>
						                                    <th class="col-sm-2">职称</th>
						                                     <th class="col-sm-2">所属组</th>
						                                      <th class="col-sm-3">所属岗</th>
						                                    <th class="col-sm-1">操作</th>
						                                </tr>
					                                </thead>
					                                <tbody>
						                                 <tr class="even">
						                                	<td >1</td>
						                                	<td class="client-avatar">
                                                           			 <img alt="image" src="${path}/static/img/1cun.jpg">
                                                        	</td>
						                                	<td >张毅</td>
						                                	<td >主治医师</td>
						                                	<td >临检与血液组</td>
						                                	<td >门诊血液仪器镜检岗</td>
						                                	<td >
						                                		<a class="btn btn-info btn-rounded btn-xs btntj">添加</a>
						                                		
						                                	
						                                	</td>
						                                	
						                                </tr>
						                                 <tr class="odd">
						                                	<td >2</td>
						                                	<td class="client-avatar">
                                                           			 <img alt="image" src="${path}/static/img/1cun.jpg">
                                                        	</td>
						                                	<td >张毅</td>
						                                	<td >主治医师</td>
						                                	<td >临检与血液组</td>
						                                	<td >门诊血液仪器镜检岗</td>
						                                	<td >
						                                		<a class="btn btn-info btn-rounded btn-xs btntj">添加</a>
						                                		
						                                	
						                                	</td>
						                                	
						                                </tr>
						                              
					                                </tbody>
					                            
					                        </table>
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
    
	<script src="${path}/static/js/plugins/jeditable/jquery.jeditable.js"></script>
    <!-- Data Tables -->
    <script src="${path}/static/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${path}/static/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="${path}/static/js/plugins/iCheck/icheck.min.js"></script>
 	
 	<!-- jsTree plugin javascript -->
    <script src="${path}/static/js/plugins/jsTree/jstree.min.js"></script>

    <!-- 自定义js -->
    <script src="${path}/static/js/content.js"></script>
 	
  <!--layer弹出层-->
    <script type="text/javascript" src="${path}/static/js/plugins/layer/layer.min.js"></script>
  
   <script type="text/javascript">
   
   
   var table;
  
   $(document).ready(function () {
       /*$('.dataTables-example').dataTable();*/
     
    	$('.btntj').click(function(){
	   	      layertj(this);//layer-msg添加成功
	   	    });
		       table = $('#editable').dataTable({
		    	   "bAutoWidth" : true,
					"processing" : true,
					"ordering" : false,
					"bFilter": true,
					"searching" : false,
					"bPaginate" : true,	
		   });
		      
  
   });
   
	function layertj(o){//添加按钮
             /*  layer.msg('已学习！', {icon: 1}); */
		 layer.confirm('确认添加？', {
	          btn: ['确认','取消'] //按钮
	          }, function(){//确认就添加
	                var a=$(o).parent().parent();
	                    a.remove();
	                    layer.msg('已添加至该组', {icon: 1});
	      });
         
	};
 
  </script>  

</body>

</html>
