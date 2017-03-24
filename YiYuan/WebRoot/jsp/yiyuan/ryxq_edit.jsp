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


    <title> 人员详情编辑</title>
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
                                        <form method="post" class="form-horizontal" id="modeladd" onsubmit="" enctype="" action="${path}/renYuanDaController/editElement?orgid=${orgid}&porgid=${porgid}&gopage=yiyuan/zuzzjg_gw_ryxq&backpage=yiyuan/zuzzjg_gw_ry&"+$('#modeladd').serialize(), target="J_iframe">
                                              <div class="col-sm-12">
                                              <input type="hidden" value="${user.id}" id="id" name="id">
                                           
                                              		<label class="control-label col-sm-2">登录名：</label>
	                                               <div class="col-sm-10">
	                                                     <input type="text" name="" class="form-control" value="${user.loginname}" disabled="true">  
	                                                </div>
	                                               <!--  <div class="col-sm-12"> -->
						                               <%--  <label class="col-sm-4 control-label"></label>
						                                <div class="col-sm-8">
						                                    <label class="control-label"  >${user.loginname}</label>
						                                    <input type="hidden" value="${user.loginname}" id="loginname" name="loginname">
						                                </div> --%>
						                     <!--    </div> -->
                                              		<label class="control-label col-sm-2">姓名：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" name="username" class="form-control" value="${user.username }">  
	                                                </div>
	                                                <label class="control-label col-sm-2">密码：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="password" name="password" class="form-control" value="${user.password }"> 
	                                                </div>
	                                                <label class="control-label col-sm-2">性别：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" name="usersex" class="form-control" value="${user.usersex }">
	                                                </div>  
	                                                 <label class="control-label col-sm-2">出生日期：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" name="birthdaystr" class="laydate-icon form-control layer-date" value="" onclick="laydate({istime: true, format: 'YYYY-MM-DD',max: laydate.now()})">  
	                                                </div> 
	                                                 <label class="control-label col-sm-2">民族：</label>
	                                                <div class="col-sm-10">
	                                                 <input type="text" name="minzu" class="form-control"  value="${user.minzu }"> 
	                                                </div> 
	                                                <label class="control-label col-sm-2">党派：</label>
	                                                <div class="col-sm-10">
	                                                <input type="text" name="dangpai" class="form-control" value="${user.dangpai }">  
	                                                </div>  
	                                                <label class="control-label col-sm-2">学历：</label>
	                                                <div class="col-sm-10">
	                                                <input type="text" name="xueli" class="form-control" value="${user.xueli }">
	                                                </div> 
	                                                <label class="control-label col-sm-2">职称：</label>
	                                                <div class="col-sm-10">
	                                               <input type="text" name="zhicheng" class="form-control"  value="${user.zhicheng }"> 
	                                                </div>
	                                                <label class="control-label col-sm-2">职务：</label>
	                                                <div class="col-sm-10">
	                                                <input type="text" name="zhiwu" class="form-control"  value="${user.zhiwu }">   
	                                                </div>
	                                                <label class="control-label col-sm-2">工作单位：</label>
	                                                <div class="col-sm-10">
	                                               <input type="text" name="gongzuodanwei" class="form-control" value="${user.gongzuodanwei }">
	                                                </div>
	                                                <label class="control-label col-sm-2">邮编：</label>
	                                                <div class="col-sm-10">
	                                                <input type="text" name="youbian" class="form-control" value="${user.youbian }">  
	                                                </div>
	                                                <!-- <label class="control-label col-sm-2">专业组：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" name="" class="form-control" value="" onclick="laydate({istime: true, format: 'YYYY-MM-DD',max: laydate.now()})">  
	                                                </div> -->
	                                                <label class="control-label col-sm-2">邮箱：</label>
	                                                <div class="col-sm-10">
	                                                  <input type="text" name="youxiang" class="form-control" value="${user.youxiang }">   
	                                                </div>
	                                                <label class="control-label col-sm-2">手机：</label>
	                                                <div class="col-sm-10">
	                                                 <input type="text" name="shoujihao" class="form-control" value="${user.shoujihao }">  
	                                                </div>
	                                                <label class="control-label col-sm-2">发表论文：</label>
	                                                <div class="col-sm-10">
	                                                     <textarea class="form-control" name="fabiaolunwen" style="height:150px" maxlength="" value="${user.fabiaolunwen }"></textarea>
	                                                </div>
	                                                <label class="control-label col-sm-2">承担课题：</label>
	                                                <div class="col-sm-10">
	                                                     <textarea class="form-control" name="chengdanketi" style="height:150px" maxlength="" value="${user.chengdanketi }"></textarea>
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
   //提交表单
   $("#modeladd").submit(function(){
	
   /* 	if( $("#loginname").val()==null || ""==$("#loginname").val() ||  $("#loginname").val()==undefined ||  $("#loginname").val().trim()==""){
   		layer.msg("请填写登陆名");
   		$("#loginname").focus();
   		return false;
   	} */
   	/* if($("#username").val()==null || ""==$("#username").val() ||  $("#username").val()==undefined ||  $("#username").val().trim()==""){
   		layer.msg("请填写姓名");
   		$("#username").focus();
   		return false;
   	}  */
	  /*  $.ajax({
			url : '${path}/renYuanDaController/editElement',
			method: 'post',
			async: false,
			data:$('#modeladd').serialize()+"&orgid=${orgid}&porgid=${porgid}&gopage=yiyuan/zuzzjg_gw_ryxq&backpage=yiyuan/zuzzjg_gw_ry",
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
		}); */
	 });
   </script> 

    
    

</body>

</html>
