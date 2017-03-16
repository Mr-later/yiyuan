<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 人员授权岗位授权情况导出</title>
    <meta name="keywords" content="">
    <meta name="description" content="">


    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${path}/static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <!--LAYER-->
    <link href="${path}/static/js/plugins/layer/skin/layer.css" rel="stylesheet">

    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
<link href="${path}/static/css/sqdc.css" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
      
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>XXX授权记录</h5>
                        <div class=" bfr" style="right: 20px;top: 7px;">
                            <a class="btn btn-info" onclick="" style="font-size:20px">Excel 导出</a>
                        </div>
                    </div>
                    <div class="ibox-content">
                   
                        <table class="table table-striped table-bordered table-hover text-center" id="editable">
                            <thead>
                                <tr>
                                <th class="col-sm-3">序号</th>
                               		<th class="col-sm-3">岗位名称</th>
                                    <th class="col-sm-3">授权日期</th>
                                    <th class="col-sm-3">取消授权日期</th>
                                    
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="gradeX">
                                	<td>1</td> 
                                    <td>赵一</td> 
                                    <td>2016-01-01</td>
                                    <td>2017-01-01</td>

                                </tr>
                               <tr class="gradeX">
                                	<td>2</td> 
                                    <td>赵二</td> 
                                    <td>2016-01-01</td>
                                    <td>2017-01-01</td>

                                </tr>
                               <tr class="gradeX">
                                	<td>3</td> 
                                    <td>赵三</td> 
                                    <td>2016-01-01</td>
                                    <td>2017-01-01</td>

                                </tr>
                            </tbody>
                          
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 全局js -->
    <script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${path}/static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${path}/static/js/plugins/jeditable/jquery.jeditable.js"></script>
    <!-- Data Tables -->
    <script src="${path}/static/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${path}/static/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="${path}/static/js/plugins/iCheck/icheck.min.js"></script>
    <!--layer弹出层-->
    <script type="text/javascript" src="${path}/static/js/plugins/layer/layer.min.js"></script>
    <!-- 自定义js -->
    <script src="${path}/static/js/content.js?v=1.0.0"></script>


    <!-- Page-Level Scripts -->
 <script>
    var table;
        $(document).ready(function () {
            /*$('.dataTables-example').dataTable();*/
           
            /* Init DataTables */
            table = $('#editable').dataTable({
             	/*"searching" : false,*/
            	 "bSort": false ,
             	 "paging": false ,
             	"searching" : false
         		});
    
        });

  
    </script>

    
    

</body>

</html>
