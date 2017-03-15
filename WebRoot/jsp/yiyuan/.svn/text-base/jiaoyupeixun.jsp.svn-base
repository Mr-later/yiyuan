<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>教育培训</title>
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
    </style>




</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>用户：王毅</h5><h5>&nbsp;&nbsp;职称：主任医师</h5>
                        <div class="ibox-tools">
                           <a href="javascript:wjsc();" class="btn btn-primary btn-rounded btn-xs">文件上传</a>
                           <a href="javascript:tksc();" class="btn btn-primary btn-rounded btn-xs">题库上传</a>
                           <a href="../index_v1.jsp" class="btn btn-primary btn-rounded btn-xs">返回主页</a>
                             <!--  <a href="" class="btn btn-primary btn-rounded btn-xs">编辑</a>
                              <a href="" class="btn btn-info btn-rounded btn-xs">删除</a> -->
                        </div>
                    </div>
                    <div>
                       <div class="wrapper wrapper-content animated fadeInRight" style="">
							 <div class="row">
							  	
			                    <div class="col-sm-12">
			                        <div class="ibox float-e-margins">
			                            <div class="ibox-title" style="border-bottom:none;height:60px">
			                               <div class="selecttree" style="">   
							  					
				                               <div class="col-sm-6">
				                                	<input type="text" class="form-control" id="" name="" placeholder="请输入关键字" >
				                                </div>
				                              
				                                
				                                 <div class="col-sm-1">
				                                 	<!-- <a href="" class="btn btn-info  btn-rounded">上传</a> -->
				                                 	<a href="" class="btn btn-info  btn-rounded">查询</a>
				                                 </div>
				                                
			                    			</div>
			                            </div>
			                            <div class="ibox-content" style="border-top:none;">
			                                <table class="table table-striped table-bordered table-hover dataTables-example dataTable" id="editable">
					                            	<thead>
						                                <tr>
						                                	<th class="col-sm-1">id</th>
						                                    <th class="col-sm-6">文件名</th>
						                                    <th class="col-sm-2">答题状态</th>
						                                    <th class="col-sm-3">操作</th>
						                                </tr>
					                                </thead>
					                                <tbody>
						                                 <tr class="even">
						                                	<td >1</td>
						                                	<td >临床医生业务学习记录.wps</td>
						                                	<td class="fwb">无习题</td>
						                                	<td >
						                                		<a class="btn btn-info btn-rounded btn-xs btn11">学习</a>
						                                		<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                		<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	
						                                	</td>
						                                	
						                                </tr>
						                                 <tr class="odd">
						                                	<td >2</td>
						                                	<td >临床医生业务学习记录.pdf</td>
						                                	<td class="red">未答题</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn11">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                </tr>
						                                 <tr class="even">
						                                	<td >3</td>
						                                	<td >临床医生业务学习记录.wps</td>
						                                	<td class="green">已答题并通过</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn22">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                </tr>
						                                <tr class="odd">
						                                	<td >4</td>
						                                	<td >临床医生业务学习记录.pdf</td>
						                                	<td class="pur">已答题未通过</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn11">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                </tr>
						                                 <tr class="even">
						                                	<td >5</td>
						                                	<td >临床医生业务学习记录.wps</td>
						                                	<td class="fwb">无习题</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn11">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                	
						                                </tr>
						                                 <tr class="odd">
						                                	<td >6</td>
						                                	<td >临床医生业务学习记录.pdf</td>
						                                	<td class="red">未答题</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn11">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                </tr>
						                                 <tr class="even">
						                                	<td >7</td>
						                                	<td >临床医生业务学习记录.wps</td>
						                                	<td class="green">已答题并通过</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn22">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                </tr>
						                                <tr class="odd">
						                                	<td >8</td>
						                                	<td >临床医生业务学习记录.pdf</td>
						                                	<td class="pur">已答题未通过</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn11">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                </tr>
						                                 <tr class="even">
						                                	<td >1</td>
						                                	<td >临床医生业务学习记录.wps</td>
						                                	<td class="fwb">无习题</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn11">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                	
						                                </tr>
						                                 <tr class="odd">
						                                	<td >2</td>
						                                	<td >临床医生业务学习记录.pdf</td>
						                                	<td class="red">未答题</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn11">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                </tr>
						                                 <tr class="even">
						                                	<td >3</td>
						                                	<td >临床医生业务学习记录.wps</td>
						                                	<td class="green">已答题并通过</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn22">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                </tr>
						                                <tr class="odd">
						                                	<td >4</td>
						                                	<td >临床医生业务学习记录.pdf</td>
						                                	<td class="pur">已答题未通过</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn11">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                </tr>
						                                 <tr class="even">
						                                	<td >5</td>
						                                	<td >临床医生业务学习记录.wps</td>
						                                	<td class="fwb">无习题</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn11">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                	
						                                </tr>
						                                 <tr class="odd">
						                                	<td >6</td>
						                                	<td >临床医生业务学习记录.pdf</td>
						                                	<td class="red">未答题</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn11">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                </tr>
						                                 <tr class="even">
						                                	<td >7</td>
						                                	<td >临床医生业务学习记录.wps</td>
						                                	<td class="green">已答题并通过</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn22">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
						                                	</td>
						                                </tr>
						                                <tr class="odd">
						                                	<td >8</td>
						                                	<td >临床医生业务学习记录.pdf</td>
						                                	<td class="pur">已答题未通过</td>
						                                	<td >
						                                	<a class="btn btn-info btn-rounded btn-xs btn11">学习</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndt">答题</a>
						                                	<a class="btn btn-info btn-rounded btn-xs btndel">删除</a>
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
      	$('.btn11').click(function(){
	   	      tiaozhuan1();//跳转到教育培训-答题
	   	    });
    	$('.btn22').click(function(){
    		tiaozhuan1();//跳转到教育培训-答题
	   	    });
    	$('.btndt').click(function(){
	   	      tiaozhuandt();//跳转到-答题内容页
	   	    });
		       table = $('#editable').dataTable({
		    	   "bAutoWidth" : true,
					"processing" : true,
					"ordering" : false,
					"bFilter": true,
					"searching" : false,
					"bPaginate" : true,	
		   });
		 $('.btndel').click(function(){
			  deldiv(this);//删除此行
			});
  
   });
   	function tiaozhuan1(){//跳转到教育培训-答题
	   	location.href="jypx_dati.jsp"
	   };
	function tiaozhuandt(){//跳转到教育培训-答题内容
		   	location.href="jypx_datict.jsp"
		   };
	function yixuexi(){//跳转到教育培训-答题（已学习）
		
              layer.msg('已学习！', {icon: 1});
         
	};
	function deldiv(o){ //点击删除按钮 就删除当前的div 
		   layer.confirm('确认删除此人员？', {
	          btn: ['确认','取消'] //按钮
	          }, function(){//确认就删除
	                var a=$(o).parent().parent();
	                    a.remove();
	                    layer.msg('已删除', {icon: 1});
	      });
		 
	  };
	  function wjsc(){ //点击按钮 打开文件上传页面 
   	   layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '50%']
              ,title: '教育培训-文件上传'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content:['jypx_wjsc.jsp']
             
            });    

      };
      function tksc(){ //点击按钮 打开题库上传页面 
      	   layer.open({
                 type: 2 //Page层类型
                 ,area: ['70%', '50%']
                 ,title: '教育培训-题库上传'
                 ,shade: 0.6 //遮罩透明度
                 ,maxmin: false //允许全屏最小化
                 ,anim: 5 //0-6的动画形式，-1不开启
                 ,content:['jypx_tksc.jsp']
                
               });    

         };
      
 
  </script>  

</body>

</html>
