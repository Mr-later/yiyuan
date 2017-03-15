<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 数据字典-编辑</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${path}/static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	

    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
	<link href="${path}/static/css/zstyle/sjzdedit.css" rel="stylesheet">
	<style>
.col-sm-9{margin-bottom:1%;}
.col-sm-4{width:30%;display:inline-block;}
.col-sm-8{width:60%;display:inline-block;}
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
				                        <h5>编辑数据字典</h5>
				                        
				                    </div>
				                    <div class="ibox-content">
				                        <form method="post" class="form-horizontal" id="editsjzd_form">
				                        <div>
				                        	<input type="hidden" value="${yyDict.id} " id="id" name="id">
				                         <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">key</label>
				                                <div class="col-sm-8">
				                                  <input type="text" class="form-control" value="${yyDict.dictkey}" id="dictkey" name="dictkey"> 
				                                </div>
				                            </div>
				                           
				                           

				                              <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">value</label>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control" value="${yyDict.dictvalue}" id="dictvalue" name="dictvalue"> 
				                                </div>
				                            </div>
				                             <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">group</label>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control" value="${yyDict.dictgroup}" id="dictgroup" name="dictgroup"> 
				                                </div>
				                            </div>
				                             <div class="col-sm-9">
				                                <label class="col-sm-4 control-label">description</label>
				                                <div class="col-sm-8">
				                                    <input type="text" class="form-control" value="${yyDict.description}" id="description" name="description"> 
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
    $(function(){
    	var index = parent.layer.getFrameIndex(window.name);
	    $("#editsjzd_form").on("submit",function(){
	    	
	    	//非空验证  数字验证
	    	if($("#dictkey").val()==null || ""==$("#dictkey").val() ||  $("#dictkey").val()==undefined ||  $("#dictkey").val().trim()==""){
	    		layer.msg("请填写key值");
	    		$("#dictkey").focus();
	    		return false;
	    	}else if (isNaN($("#dictkey").val())) { 
	    	layer.msg("请输入数字");
	 		   return false;
	      } 
	    
	    /* 	if( $("#dictvalue").val()==null || ""==$("#dictvalue").val() ||  $("#dictvalue").val()==undefined ||  $("#dictvalue").val().trim()==""){
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
				url : '${path}/dictController/editElement',
				method: 'post',
				async: false,
				data:$('#editsjzd_form').serialize(),
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
