<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 按钮管理-编辑</title>
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
				                        <h5>编辑按钮管理</h5>
				                        
				                    </div>
				                    <div class="ibox-content">
				                        <form method="get" class="form-horizontal"  id="addangl_form">
				                        <div>
				                        <input type="hidden" value="${yyButtoninfo.id} " id="id" name="id">
				                        <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">按钮名称</label>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control" value="${yyButtoninfo.buttonname }" id="buttonname" name="buttonname"> 
				                                </div>
				                        </div>
				                         <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">所属页面</label>
				                               <%--  <div class="col-sm-8">
				                                    <select  type="text" class="form-control" value="${yyButtoninfo.buttonpage }" name="buttonpage" id="buttonpage">
				                                    	<!-- <option value="100">根节点</option>   -->
				                                    	<c:forEach var="tempPara" items="${parentFunctionList}">
				   	 									<option value="${tempPara.id}">${tempPara.functionname}</option>   
   														</c:forEach>
				                                    </select>
				                                </div> --%>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control" value="${yyButtoninfo.buttonpage }" id=buttonpage name="buttonpage"> 
				                                </div>
				                            </div>
				                            <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">按钮id</label>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control"  value="${yyButtoninfo.buttonpageid }" id="buttonpageid" name="buttonpageid"> 
				                                </div>
				                        </div>
				                        <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">按钮name</label>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control"  value="${yyButtoninfo.buttonpagename}" id="buttonpagename" name="buttonpagename"> 
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
	    $("#addangl_form").on("submit",function(){
	    	
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
	    	}*/
	    	if($("#buttonname").val()==null || ""==$("#buttonname").val() ||  $("#buttonname").val()==undefined ||  $("#buttonname").val().trim()==""){
	    		layer.msg("请填写按钮名称");
	    		$("#buttonname").focus();
	    		return false;
	    	}  
	    	$.ajax({
				url : '${path}/buttoninfoController/editElement',
				method: 'post',
				async: false,
				data:$('#addangl_form').serialize(),
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
