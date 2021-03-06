<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<!DOCTYPE html>
<html>

<head>

    <meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport"
		  content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>


    <title> 人员详情新增工作经历</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- Data Tables -->  
    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${path}/static/css/zstyle/xxedit.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${path}/static/webuploader/webuploader.css">
<style>

.col-sm-12,label.control-label,.col-sm-10{margin-top:1%;}

</style>
</head>
<body class="gray-bg">

        <div class="modal-dialog">
            <div class="modal-content">
               
                   <div class="row">
                         <div class="col-sm-12">
                             <div class="ibox float-e-margins">
                                  
                                    <div class="ibox-content">
                                        <form method="post" class="form-horizontal" id="modeladd" onsubmit="" enctype="" action="${path}/GzjlController/addElement?orgid=${orgid}&porgid=${porgid}&pporgid=${pporgid}&userid=${userid}"+$('#modeladd').serialize(); target="J_iframe">
                                              <input name="userId" id="" type="hidden"  value="${userid }">
                                              <div class="col-sm-12">
                                               		<label class="control-label col-sm-2">起止时间：</label>
	                                                <div class="col-sm-4" style="width:31%;margin-top:1%">
	                                                     <input type="text" name="shijianbeginstr" id="shijianbeginstr" class="layer-date form-control" value="" onclick="laydate({istime: true, format: 'YYYY-MM-DD',max: laydate.now()})" style="">  
	                                                </div> 
	                                                 <label class="control-label col-sm-1">至</label>
	                                                <div class="col-sm-4" style="width:30%;margin-top:1%">
	                                                     <input type="text" name="shijianendstr" id="shijianendstr" class="layer-date form-control" value="" onclick="laydate({istime: true, format: 'YYYY-MM-DD',max: laydate.now()})">  
	                                                </div>  
                                              		<label class="control-label col-sm-2">单位：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" name="danwei" id="danwei" class="form-control" value="">  
	                                                </div>
	                                               
	                                                 <label class="control-label col-sm-2">职务：</label>
	                                                <div class="col-sm-10" style="margin-top:1%">
	                                                     <input type="text" name="zhiwu" id="zhiwu" class="form-control" value="" style="">  
	                                                </div> 
	                                              
	                                                
                                 			  </div>
				                                <div class="form-group" >
				                                                    <div class="col-sm-9 "style="margin-left:35%;margin-top:2%">
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

    <!-- 全局js -->
    <script src="${path}/static/js/jquery.min.js"></script>
    <script src="${path}/static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${path}/static/js/plugins/iCheck/icheck.min.js"></script>
    <!--layer弹出层-->
    <script type="text/javascript" src="${path}/static/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${path}/static/js/content.js?v=1.0.0"></script>
<%--     <script src="${path}/static/webuploader/webuploader.js"></script>
    <script src="${path}/static/webuploader/bootstrap-filestyle.min.js"></script> --%>

    <!-- Page-Level Scripts -->
    <script src="${path}/static/js/plugins/layer/laydate/laydate.js"></script>

   <script type="text/javascript"> 
 
   $(function(){  

		
   });
   $("#modeladd").submit(function(){
	   /* if( $("#shijianbeginstr").val()==null || ""==$("#shijianbeginstr").val() ||  $("#shijianbeginstr").val()==undefined ||  $("#shijianbeginstr").val().trim()==""){
	   		layer.msg("请选择开始时间");
	   		$("#shijianbeginstr").focus();
	   		return false;
	   	} 
	   if( $("#shijianendstr").val()==null || ""==$("#shijianendstr").val() ||  $("#shijianendstr").val()==undefined ||  $("#shijianendstr").val().trim()==""){
	   		layer.msg("请选择结束时间");
	   		$("#shijianendstr").focus();
	   		return false;
	   	} 
	   if( $("#danwei").val()==null || ""==$("#danwei").val() ||  $("#danwei").val()==undefined ||  $("#danwei").val().trim()==""){
	   		layer.msg("请填写单位");
	   		$("#danwei").focus();
	   		return false;
	   	} 
	   if( $("#zhiwu").val()==null || ""==$("#zhiwu").val() ||  $("#zhiwu").val()==undefined ||  $("#zhiwu").val().trim()==""){
	   		layer.msg("请填写单位");
	   		$("#zhiwu").focus();
	   		return false;
	   	} 
	   $.ajax({
			url : '${path}/GzjlController/addElement',
			method: 'post',
			async: false,
			data:$('#modeladd').serialize(),
			dataType : 'json',
			success : function(result) {
				if(result.success==true)
				{
				//parent.layer.msg(result.msg);	
              	layer.msg(msg);
					closethis();
				}
				else
				{
					closethis();
				}
			}
		}); */
   })
   </script> 

    
    

</body>

</html>
