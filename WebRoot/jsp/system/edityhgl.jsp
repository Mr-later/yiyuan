<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 用户管理-编辑</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${path}/static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	

    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
	<link href="${path}/static/css/zstyle/yhgl.css" rel="stylesheet">
	<link href="${path}/static/css/plugins/jsTree/style.min.css" rel="stylesheet">
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
				                        <h5>编辑用户管理</h5>
				                        
				                    </div>
				                    <div class="ibox-content">
				                        <form method="get" class="form-horizontal" id="editform">
				                        <input type="hidden" value="${user.id}" id="id" name="id">
				                        <div class="col-sm-7">
						                        <div class="col-sm-12">
						                                <label class="col-sm-4 control-label">登录名</label>
						                                <div class="col-sm-8">
						                                    <label class="control-label"  >${user.loginname}</label>
						                                </div>
						                        </div>
						                        <div class="col-sm-12">
						                                <label class="col-sm-4 control-label">用户名</label>
						                                <div class="col-sm-8">
						                                    <input type="text" class="form-control" id="username" name="username" value="${user.username}"> 
						                                </div>
						                        </div>
											
		
						                         <%-- <div class="">
						                                <label class="col-sm-4 control-label">权限</label>
						                                <div class="col-sm-8">
						                                    <select  type="text" class="form-control" name="roleid" id="roleid">
						                                       <c:forEach var="role" items="${rolelist}">
						   	 									<option value="${role.id}" <c:if  test="${role.id==user.roleid}"> selected="selected"</c:if>>${role.rolename}</option>   
		   														</c:forEach>
						                                    </select>
						                                </div>
						                            </div> --%>
						                             <div class="col-sm-12" >
						                                <label class=" control-label" onclick="editpass()">点击修改密码</label>
						                           </div>
						                           
						                           <div class="" id="editpw" style="display: none">
						                                <label class="col-sm-4 control-label">密码</label>
						                                <div class="col-sm-8">
						                                    <input type="password" class="form-control" id="password" name="password" > 
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
    	var roleid=$("#id").val();
    	$('#jstree1').jstree({ 'core' : {
    	    'data' : {
    	        url : '${path}/roleinfoController/getTreeSelect?roleid='+roleid,
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
	    $("#editform").on("submit",function(){
	    	
	    	//非空验证  数字验证
	    	/* if($("#dictkey").val()==null || ""==$("#dictkey").val() ||  $("#dictkey").val()==undefined ||  $("#dictkey").val().trim()==""){
	    		layer.msg("请填写key值");
	    		$("#dictkey").focus();
	    		return false;
	    	}else if (isNaN($("#dictkey").val())) { 
	    	layer.msg("请输入数字");
	 		   return false;
	      }  */
	    
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
	    	var roleids="";
	    	var nodes = $.jstree.reference($("#jstree1")).get_selected(); 
	        $.each(nodes, function(i, n) {  
	        	roleids += n+",";
	    	}); 
	    	$.ajax({
				url : '${path}/userinfoController/editElement',
				method: 'post',
				async: false,
				data:$('#editform').serialize()+"&roleids="+roleids,
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


    function editpass(){
    	debugger;
    	var editpw = document.getElementById("editpw");
    	var state = editpw.style.display;
    	if(state == "none"){
    		document.getElementById("editpw").style.display = "block";
    	}else{
    		document.getElementById("editpw").style.display = "none";
    	}
    }

    </script>

    
    

</body>

</html>
