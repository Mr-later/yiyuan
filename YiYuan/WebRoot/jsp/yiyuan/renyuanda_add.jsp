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


    <title> 新增人员档案-人员</title>
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
                                   <!--  <div class="ibox-title">
                                        <h5>编辑信息</h5>
                                        
                                    </div> -->
                                    <div class="ibox-content">
                                        <!-- <form method="post" class="form-horizontal" id="modeladd" onsubmit="" enctype="" action="" target="">
                                              <div class="col-sm-12">
                                             		<label class="control-label col-sm-2">登陆名：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" id="loginname" name="loginname" class="form-control" value="" onblur="loginnametest()" >  
	                                                </div>
                                             		<label class="control-label col-sm-2">姓名：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" id="username" name="username" class="form-control" value="">  
	                                                </div>
	                                                <label class="control-label col-sm-2">性别：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" name="usersex" class="form-control" value="">  
	                                                </div>  
	                                                 <label class="control-label col-sm-2">出生日期：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" name="birthdaystr" id="birthdaystr" class="laydate-icon form-control layer-date" value="" onclick="laydate({istime: true, format: 'YYYY-MM-DD',max: laydate.now()})">  
	                                                </div>   
                                               		<label class="control-label col-sm-2">所在组：</label>
                                                     <div class="col-sm-10">
                                                      <select class="form-control" name="userinfotemp2" id="groupRenyuan"  onchange="gangwei_Renyuan()">
                                                            <option value="" selected="selected">请选择...</option>
                                                            
                                                            <option value="" >1组</option>
                                                            <option value="" >2组</option>
                                                      </select>
                                                      
                                                     </div> 
                                                     <label class="control-label col-sm-2">目前岗位：</label>
                                                     <div class="col-sm-10">
                                                      <select class="form-control" name="zhiwu" id="gangweiRenyuan" >
                                                            <option value="" selected="selected">请选择...</option>
                                                            <option value="" >主任医师</option>
                                                            <option value="" >副主任医师</option>
                                                      </select> 
                                                     </div>  
                                                            <label class="control-label col-sm-2">在岗时间：</label>
			                                                <div class="col-sm-10">
			                                                     <input type="text" name="" class="form-control" value="">  
			                                                </div> 
			                                                 <label class="control-label col-sm-2">身份证号：</label>
			                                                <div class="col-sm-10">
			                                                     <input type="text" name="shenfenzhenghao" class="form-control" value="">  
			                                                </div>
			                                                 <label class="control-label col-sm-2">民族：</label>
			                                                <div class="col-sm-10">
			                                                     <input type="text" name="minzu" class="form-control" value="">  
			                                                </div>
			                                                <label class="control-label col-sm-2">学历证书：</label>
			                                                <div class="col-sm-10">
			                                                     <input type="text" name="xueli" class="form-control" value="">  
			                                                </div> 
			                                                 <label class="control-label col-sm-2">职称证书：</label>
			                                                <div class="col-sm-10">
			                                                     <input type="text" name="" class="form-control" value="">  
			                                                </div>
			                                                 <label class="control-label col-sm-2">参加工作时间：</label>
			                                                <div class="col-sm-10">
			                                                    <input type="text" name="" class="laydate-icon form-control layer-date" value="" onclick="laydate({istime: true, format: 'YYYY-MM-DD',max: laydate.now()})">  
			                                                </div>
			                                                 <label class="control-label col-sm-2">存档时间：</label>
			                                                <div class="col-sm-10">
			                                                     <input type="text" name="" class="laydate-icon form-control layer-date" value="" onclick="laydate({istime: true, format: 'YYYY-MM-DD',max: laydate.now()})">  
			                                                </div> 
			                                                 <label class="control-label col-sm-2">毕业院校：</label>
			                                                <div class="col-sm-10">
			                                                     <input type="text" name="" class="form-control" value="">  
			                                                </div>
			                                                 <label class="control-label col-sm-2">毕业证书编号：</label>
			                                                <div class="col-sm-10">
			                                                     <input type="text" name="" class="form-control" value="">  
			                                                </div>
			                                                 <label class="control-label col-sm-2">职业资格证书编号：</label>
			                                                <div class="col-sm-10">
			                                                     <input type="text" name="" class="form-control" value="">  
			                                                </div>
			                                                 <label class="control-label col-sm-2">职业资格证书管理号：</label>
			                                                <div class="col-sm-10">
			                                                     <input type="text" name="" class="form-control" value="">  
			                                                </div>         
                                 			  </div>
				                                <div class="form-group" >
				                                                    <div class="col-sm-9 "style="margin-left:30%;margin-top:2%">
				                                                        <button class="btn btn-primary" type="submit">保存</button>
				                                                        <button class="btn btn-white" type="" onclick="closethis()">取消</button>
				                                                    </div>
				                                </div>            
                                        </form> -->
                                         <form method="post" class="form-horizontal" id="modeladd" onsubmit="" enctype="" action="${path}/renYuanDaController/addElement?"+$('#modeladd').serialize(); target="J_iframe">
                                              <div class="col-sm-12">
                                              <input type="hidden" value="${user.id}" id="id" name="id">
                                            <input type="hidden" value="${orgid}" id="userinfotemp4" name="userinfotemp4">
                                              <input type="hidden" value="${porgid}" id="userinfotemp3" name="userinfotemp3">
                                              <input type="hidden" value="${pporgid}" id="userinfotemp2" name="userinfotemp2">
	                                               
						                     		<label class="control-label col-sm-2">登录名：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" id="loginname" name="loginname" class="form-control" value=""  onblur="loginnametest()">  
	                                                </div>
                                              		<label class="control-label col-sm-2">姓名：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" id="username" name="username" class="form-control" value="">  
	                                                </div>
	                                                <label class="control-label col-sm-2">密码：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="password" name="password" class="form-control" value="">  
	                                                </div>
	                                                <!-- <label class="control-label col-sm-2">性别：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" name="usersex" class="form-control" value="">  
	                                                </div>  --> 
	                                                <label class="control-label col-sm-2">性别：</label>
                                                     <div class="col-sm-10">
	                                                <select class="form-control" name="usersex" id="usersex" >
                                                            <option value="0" selected="selected">请选择...</option>
                                                            <option value="男" >男</option>
                                                            <option value="女" >女</option>
                                                      </select>
                                                      </div>
	                                                 <label class="control-label col-sm-2">出生日期：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" name="birthdaystr" class="laydate-icon form-control layer-date" value="" onclick="laydate({istime: true, format: 'YYYY-MM-DD',max: laydate.now()})">  
	                                                </div> 
	                                                 <label class="control-label col-sm-2">民族：</label>
	                                                <div class="col-sm-10">
	                                                 <input type="text" name="minzu" class="form-control" value="">  
	                                                </div> 
	                                                <label class="control-label col-sm-2">党派：</label>
	                                                <div class="col-sm-10">
	                                                <input type="text" name="dangpai" class="form-control" value="">  
	                                                </div>  
	                                                <label class="control-label col-sm-2">学历：</label>
	                                                <div class="col-sm-10">
	                                                <input type="text" name="xueli" class="form-control" value="">  
	                                                </div> 
	                                                <label class="control-label col-sm-2">职称：</label>
	                                                <div class="col-sm-10">
	                                               <input type="text" name="zhicheng" class="form-control" value="">  
	                                                </div>
	                                               <!--  <label class="control-label col-sm-2">职务：</label>
	                                                <div class="col-sm-10">
	                                                <input type="text" name="zhiwu" class="form-control" value="">  
	                                                </div> -->
	                                                 <label class="control-label col-sm-2">职务：</label>
                                                     <div class="col-sm-10">
	                                                <select class="form-control" name="zhiwu" id="zhiwu" >
                                                            <!-- <option value="0" selected="selected">请选择...</option>
                                                            <option value="组长" >组长</option>
                                                            <option value="副组长" >副组长</option> -->
                                                      </select>
                                                      </div>
	                                                <label class="control-label col-sm-2">工作单位：</label>
	                                                <div class="col-sm-10">
	                                               <input type="text" name="gongzuodanwei" class="form-control" value="">  
	                                                </div>
	                                                <label class="control-label col-sm-2">邮编：</label>
	                                                <div class="col-sm-10">
	                                                <input type="text" name="youbian" id="youbian" class="form-control" value="">  
	                                                </div>
	                                                <!-- <label class="control-label col-sm-2">专业组：</label>
	                                                <div class="col-sm-10">
	                                                     <input type="text" name="" class="form-control" value="" onclick="laydate({istime: true, format: 'YYYY-MM-DD',max: laydate.now()})">  
	                                                </div> -->
	                                                <label class="control-label col-sm-2">邮箱：</label>
	                                                <div class="col-sm-10">
	                                                  <input type="text" name="youxiang" id="youxiang" class="form-control" value="">  
	                                                </div>
	                                                <label class="control-label col-sm-2">手机：</label>
	                                                <div class="col-sm-10">
	                                                 <input type="text" name="shoujihao" id="shoujihao" class="form-control" value="">  
	                                                </div>
	                                                <label class="control-label col-sm-2">发表论文：</label>
	                                                <div class="col-sm-10">
	                                                     <textarea class="form-control" name="fabiaolunwen" style="height:150px" maxlength=""></textarea>
	                                                </div>
	                                                <label class="control-label col-sm-2">承担课题：</label>
	                                                <div class="col-sm-10">
	                                                     <textarea class="form-control" name="chengdanketi" style="height:150px" maxlength=""></textarea>
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
	   var s=<%=request.getParameter("porgid")%>
	   $("#zhiwu").append("<option value=0>请选择...</option>");
		 if(s=="" || s==null ){
			 alert(null)
			 $("#zhiwu").append("<option value='主任'>主任</option><option value='副主任'>副主任</option>");
		}else if(s!="" && s!=null ){
			alert(324)
			 $("#zhiwu").append("<option value='组长'>组长</option><option value='副组长'>副组长</option>");
		}  
			/*  $.ajax({
		    url : '${path}/renYuanDaController/getZu',
			method: 'post',
			data:null,
			async: false,
			dataType : 'json',
			success : function(result) {
				if(result.success==true)
				{
					$("#groupRenyuan").empty();
					$("#groupRenyuan").append("<option value=0>请选择...</option>");
					var zus=result.zus;
					for(var i=0;i<zus.length;i++){
						 $("#groupRenyuan").append("<option value='"+zus[i].id+"'>"+zus[i].orgname+"</option>");
					}
					$("#gangweiRenyuan").append("<option value='主任'>主任</option><option value='副主任'>副主任</option>");
				}
				
			}
		   
	   }) */
   });
  //检查登录名唯一性
  function loginnametest(){
	  var loginname = document.getElementById("loginname").value;
		$.ajax({
			type: "post",
			url : '${path}/userinfoController/verify',
			data:{
				"name":loginname
			},
			dataType : 'json',
			success : function(data) {
				var result=eval(data);
				if(result.success){
					layer.msg(result.msg);	
					//$("#loginname").attr("value","");
					document.getElementById("loginname").value=result.username;
					$("#loginname").focus();
				}
			}
		});
  }
  //
   function gangwei_Renyuan(){
	var val =$("#groupRenyuan option:selected").val();
	
	      if(val!=0){
	    	$("#gangweiRenyuan").empty();
		    $("#gangweiRenyuan").append("<option value=0>请选择...</option><option value='组长'>组长</option><option value='副组长'>副组长</option>");
	   		} else  if(val==0){
   			$("#gangweiRenyuan").empty();
   			$("#gangweiRenyuan").append("<option value=0>请选择...</option><option value='主任'>主任</option><option value='副主任'>副主任</option>");
	   		}  
   }
   //提交表单
   $("#modeladd").submit(function(){
   	 /* if( $("#loginname").val()==null || ""==$("#loginname").val() ||  $("#loginname").val()==undefined ||  $("#loginname").val().trim()==""){
   		layer.msg("请填写登陆名");
   		$("#loginname").focus();
   		return false;
   	} 
    	if($("#username").val()==null || ""==$("#username").val() ||  $("#username").val()==undefined ||  $("#username").val().trim()==""){
   		layer.msg("请填写姓名");
   		$("#username").focus();
   		return false;
   	}  
    	 var patt=new RegExp("[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
   	var youxiang =$("#youxiang").val();
   	if(patt.test(youxiang)){
   		layer.msg("请填写正确的邮箱");
   		$("#youxiang").focus();
   		return false;
   	}  
   	 var patt1=new RegExp("[1-9]\d{5}(?!\d)");
	var youbian =$("#youbian").val();
   	if(patt1.test(youbian)){
   		layer.msg("请填写正确的邮编");
   		$("#youbian").focus();
   		return false;           
   	}; 
	   var patt2=new RegExp("/^1\d{10}$/");
		var shoujihao =$("#shoujihao").val();
	   	if(patt2.test(shoujihao)){
	   		layer.msg("请填写正确的手机号");
	   		$("#shoujihao").focus();
	   		return false;           
	   	};  */
	   	//alert("orgid="+$("#userinfotemp4").val()+"|porgid="+$("#userinfotemp3").val()+"|pporgid="+$("#userinfotemp2").val()+"|")
	 /* 	location.href="${path}/renYuanDaController/addElement?"+$('#modeladd').serialize();
	   	  $.ajax({
			url : '${path}/renYuanDaController/addElement',
			method: 'post',
			async: false,
			data:$('#modeladd').serialize(),
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
