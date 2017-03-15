<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 用户管理-新增</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${path}/static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	

    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${path}/static/css/plugins/jsTree/style.min.css" rel="stylesheet">
	<link href="${path}/static/css/zstyle/yhgl.css" rel="stylesheet">
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
				                        <h5>新增用户管理</h5>
				                        
				                    </div>
				                    <div class="ibox-content">
				                        <form method="get" class="form-horizontal" id="adduser_form">
				                       
				                         <div class="col-sm-7">
					                         <div class="">
					                                <label class="col-sm-4 control-label">登录名</label>
					                                <div class="col-sm-8">
					                                     <input type="text" class="form-control" id="loginname" name="loginname" onblur="loginnametest()"> 
					                                 </div>
					                        </div>
					                        <div class="">
					                                <label class="col-sm-4 control-label">用户名</label>
					                                <div class="col-sm-8">
					                                    <input type="text" class="form-control" id="username" name="username"> 
					                                </div>
					                        </div>
											<div class="">
					                                <label class="col-sm-4 control-label">密码</label>
					                                <div class="col-sm-8">
					                                    <input type="password" class="form-control" id="password" name="password"> 
					                                </div>
					                        </div>
					                     </div>

				                         <div class="col-sm-5">
				                              
							                         <p>角色设置</p>
							                         <div id="jstree1"></div>
						                        
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
<!-- jsTree plugin javascript -->
    <script src="${path}/static/js/plugins/jsTree/jstree.min.js"></script>

    <!-- 自定义js -->
    <script src="${path}/static/js/content.js?v=1.0.0"></script>


    <!-- Page-Level Scripts -->
    <script>
    $(function(){
    	$('#jstree1').jstree({ 'core' : {
    	    'data' : {
    	        url : '${path}/roleinfoController/getTree',
    		}
    	},
    	'plugins': ['checkbox'],
        'types': {
            'default': {
                'icon': 'fa fa-folder'
            },
            'html': {
                'icon': 'fa fa-file-code-o'
            },
            'svg': {
                'icon': 'fa fa-file-picture-o'
            },
            'css': {
                'icon': 'fa fa-file-code-o'
            },
            'img': {
                'icon': 'fa fa-file-image-o'
            },
            'js': {
                'icon': 'fa fa-file-text-o'
            }

        }
    	
    	
    	});
    	 var index = parent.layer.getFrameIndex(window.name);
	    $("#adduser_form").on("submit",function(){
	    	 if($("#loginname").val()==null || ""==$("#loginname").val() ||  $("#loginname").val()==undefined ||  $("#loginname").val().trim()==""){
	    		layer.msg("请填写登录名");
	    		$("#loginname").focus();
	    		return false;
	    	}
	    	
	    	if( $("#username").val()==null || ""==$("#username").val() ||  $("#username").val()==undefined ||  $("#username").val().trim()==""){
	    		layer.msg("请填写用户名");
	    		$("#username").focus();
	    		return false;
	    	}
	    	if($("#password").val()==null || ""==$("#password").val() ||  $("#password").val()==undefined ||  $("#password").val().trim()==""){
	    		layer.msg("请填写密码");
	    		$("#password").focus();
	    		return false;
	    	}
	    	
	    	var roleids="";
	    	var nodes = $.jstree.reference($("#jstree1")).get_selected(); 
	        $.each(nodes, function(i, n) {  
	        	roleids += n+",";
	    	});  
	    	var loginname = $("#loginname").val();
	    	var username = $("#username").val();
	    	$.ajax({
				url : '${path}/userinfoController/addElement',
				method: 'post',
				async: false,
				data:$('#adduser_form').serialize()+"&roleids="+roleids,
				dataType : 'json',
				success : function(data) {
					var result=eval(data);
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
    
  //验证登录姓名
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
					document.getElementById("loginname").value="";
				}
			}
		});
	}


    </script>

    
    

</body>

</html>
