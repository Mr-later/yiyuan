<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 权限管理-编辑</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- Data Tables -->  
    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
	<link href="${path}/static/css/zstyle/qxgl.css" rel="stylesheet">
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
				                        <h5>编辑角色管理</h5>
				                        
				                    </div>
				                    <div class="ibox-content">
				                        <div class="modal-body">
								                    <div class="row">
								                    <form role="form" id="editqxgl_form">
								                        <div class="col-sm-4 b-r">
								                           
								                            <input type="hidden" id="id" name="id" value="${yyRoleinfo.id}">
								                                <div class="form-group">
								                                    <label>角色名称：</label>
								                                    <input type="text" class="form-control" id="rolename" name="rolename" value="${yyRoleinfo.rolename}">
								                                </div>
								                                <div class="form-group">
								                                    <label>说明：</label>
								                                    <input type="text" class="form-control" id="miaoshu" name="miaoshu" value="${yyRoleinfo.miaoshu}">
								                                </div>
								                                <div>
								                                   <button class="btn btn-primary" type="submit">保存</button>
												                   <button class="btn btn-white"  onclick="closethis()" type="">取消</button>
								                                </div>
								                            
								                        </div>
								                        <div class="col-sm-4 " style="border-right:1px solid #ccc;">
									                         <p>菜单设置</p>
									                         <div id="jstree1">
									                        </div>
								                        </div>
								                         <div class="col-sm-4 ">
									                         <p>按钮设置</p>
									                         <div id="jstree2">
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
$(function () {
	
	var roleid=$('#id').val();
  	$('#jstree1').jstree({
			                'core': {
			                    'check_callback': true, 
			                    'data' : {
			            	        url : '${path}/functionController/getTreeSelect?roleid='+roleid,
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
  	$('#jstree2').jstree({
        'core': {
            'check_callback': true, 
            'data' : {
    	        url : '${path}/buttoninfoController/getTreeSelect?roleid='+roleid,
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
  	
	$("#editqxgl_form").on("submit",function(){
    	
		if($("#rolename").val()==null || ""==$("#rolename").val() ||  $("#rolename").val()==undefined ||  $("#rolename").val().trim()==""){
    		layer.msg("请填写角色名称");
    		$("#rolename").focus();
    		return false;
    	}
    	var functionids="";
    	var buttonids="";
    	var nodes = $.jstree.reference($("#jstree1")).get_selected(); 
        $.each(nodes, function(i, n) {  
        	functionids += n+",";
    	});  
       
        var nodes = $.jstree.reference($("#jstree2")).get_selected(); 
        $.each(nodes, function(i, n) {  
        	buttonids += n+",";
    	});
    	
    	var rolename = $("#rolename").val();
    	var miaoshu = $("#miaoshu").val();
    	$.ajax({
    		 
			url : '${path}/roleinfoController/editElement',
			method: 'post',
			async: false,
			data:{id : roleid,functionids : functionids ,buttonids:buttonids, rolename : rolename , miaoshu : miaoshu},
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
