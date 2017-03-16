<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 菜单管理-新增</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${path}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${path}/static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	

    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css" rel="stylesheet">
	<link href="${path}/static/css/zstyle/cdgl.css" rel="stylesheet">
	<style>

	</style>


</head>

<body class="gray-bg">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="">
                   <div class="row">
           				 <div class="col-sm-12">
               				 <div class="ibox float-e-margins">
				                    <div class="ibox-title">
				                        <h5>新增菜单管理</h5>
				                        
				                    </div>
				                    <div class="ibox-content">
				                        <form method="get" class="form-horizontal" id="addcdgl_form">
				                        <div>
				                        <div name="id" ></div>
				                        <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">菜单名称</label>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control" id="functionname" name="functionname"> 
				                                </div>
				                        </div>
				                         <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">父级菜单</label>
				                                <div class="col-sm-8">
				                                    <select  type="text" class="form-control" name="pid" id="pid">
				                                    	<!-- <option value="100">根节点</option>   -->
				                                    	<option value="0">根节点</option>
				                                    	<c:forEach var="yyFunction" items="${pids}">
				   	 									<option value="${yyFunction.id}" ${yyFunction.functionname}</option>   
   														</c:forEach>
				                                    </select>
				                                </div>
				                            </div>
				                            <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">菜单路径</label>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control" id="functionurl" name="functionurl"> 
				                                </div>
				                        </div>
				                        <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">菜单颜色</label>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control" id="beijingyanse" name="beijingyanse"> 
				                                </div>
				                        </div>
										<div class="col-sm-9">
				                                <label class="col-sm-4 control-label">菜单图标</label>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control" id="functiontubiao" name="functiontubiao"> 
				                                </div>
				                        </div>
				                        <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">首页路径</label>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control" id="shouyelujing" name="shouyelujing"> 
				                                </div>
				                        </div>
				                        <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">描述</label>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control" id="miaoshu" name="miaoshu"> 
				                                </div>
				                        </div>

				                       
				                            <div class="form-group" >
				                                <div class="col-sm-9 "style="margin-left:30%;margin-top:2%">
				                                    <button class="btn btn-primary" type="submit">保存</button>
				                                    <button class="btn btn-white" type="" onclick="closethis()">取消</button>
				                                </div>
				                            </div>
				                        </form>
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
	<!--layer弹出层-->
	<script type="text/javascript" src="${path}/static/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${path}/static/js/content.js"></script>


    <!-- Page-Level Scripts -->
    <script>
    $(function(){
    	var index = parent.layer.getFrameIndex(window.name);
	    $("#addcdgl_form").on("submit",function(){
	    	
	    	/* if($("#dictkey").val()==null || ""==$("#dictkey").val() ||  $("#dictkey").val()==undefined ||  $("#dictkey").val().trim()==""){
	    		layer.msg("请填写key值");
	    		$("#dictkey").focus();
	    		return false;
	    	}else if (isNaN($("#dictkey").val())) { 
	    		layer.msg("请输入数字");
	    		$("#dictkey").focus();
	 		   	return false;
	      	} 
	    	
	    	if( $("#dictvalue").val()==null || ""==$("#dictvalue").val() ||  $("#dictvalue").val()==undefined ||  $("#dictvalue").val().trim()==""){
	    		layer.msg("请填写value值");
	    		$("#dictvalue").focus();
	    		return false;
	    	}
	    	if($("#dictgroup").val()==null || ""==$("#dictgroup").val() ||  $("#dictgroup").val()==undefined ||  $("#dictgroup").val().trim()==""){
	    		layer.msg("请填写group值");
	    		$("#dictgroup").focus();
	    		return false;
	    	}
	    	if($("#description").val()==null || ""==$("#description").val() ||  $("#description").val()==undefined ||  $("#description").val().trim()==""){
	    		layer.msg("请填写description值");
	    		$("#description").focus();
	    		return false;
	    	}  */
	    	
	    	$.ajax({
				url : '${path}/functionController/addElement',
				method: 'post',
				async: false,
				data:$('#addcdgl_form').serialize(),
				dataType : 'json',
				success : function(result) {
					if(result.success==true)
					{
						parent.layer.msg(result.msg);	
						closethis();
					}
					else
					{
						closethis();
					}
				}
			});
			
	    })
    	
    });
		
    </script>

    
    

</body>

</html>
