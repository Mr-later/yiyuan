<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 按钮管理</title>
    <meta name="keywords" content="">
    <meta name="description" content="">


    <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${path}/static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
   <!--LAYER-->
    <link href="${path}/static/js/plugins/layer/skin/layer.css" rel="stylesheet">

    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${path}/static/css/zstyle/cdgl.css" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
      
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>按钮管理</h5>
                       
                    </div>
                    <div class="ibox-content">
                   
                        <div class=" bfr">
                            <a class="btn btn-info" onclick="opadd()" >新增按钮</a>
                           <a class="btn btn-info" onclick="fh()" >返回</a>
                        </div>
                        <table class="table table-striped table-bordered table-hover text-center" id="editable">
                            <thead>
                                <tr>
                                	<th class="col-sm-2">序号</th>
                                    <th class="col-sm-2">按钮名称</th>
                                    <th class="col-sm-2">所属页面</th>
                                    <th class="col-sm-2">按钮id</th>
                                    <th class="col-sm-2">按钮name</th>
                                    <th class="col-sm-2">操作</th>
                                </tr>
                            </thead>
                             <!-- <tbody>
                                <tr class="gradeX">
                                 	<td>1</td> 
                                    <td>新增按钮</td> 
                                    <td>权限管理、菜单管理……</td>
                                    <td>addbtn</td>
                                    <td>addbtn</td>
                                    
                                  
                                    <td>
                                        <a onclick="opbj();" class="btn btn-primary btn-xs  ">编辑</a>
                                        <a onclick="deleteroww(this)" class="btn btn-primary btn-xs  ">删除</a>
                                    </td>

                                </tr>
                            
                            </tbody> -->
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
<!--     <script>
    var table;
        $(document).ready(function () {
            /*$('.dataTables-example').dataTable();*/
           
            table = $('#editable').dataTable({
				"bServerSide" : true,
				"bAutoWidth" : true,
				"processing" : true,
				"ordering" : false,
				"bFilter": true,
				"searching" : true,
				"bPaginate" : true,
		//		"bStateSave":true,
				"lengthMenu": [
						[ 10, 30, 50],
						[ 10, 30, 50]
				 ],
				"dom" : 'Blfrtip',
				"ajax" : {
					"url" : "${path}/cdglController/datagrid",
					"type" :"post",
					"data" : function(d) {
						//keywords search params pass to server
						var searchtext = $(".dataTables_wrapper .dataTables_filter input").val();
						if(searchtext != null){
							d.searchtext = encodeURI(searchtext);
						} 
						//keywords search params pass to server
						var sel = $('#btnSelected').val();  //columns name in selectbox
						if(sel == 1){
							d.keysearch = encodeURI($('#keysearch').val());
						}
					}
				},
				"columns" : [ {
					"data" : "id"
				}, {
					"data" : "functionname"
				},{
					"data" : "functiontemp11"
				}, {
					"data" : "functionurl"
				}, {
					"data" : "description"
				},{
					"data" : ""
				}   ],
				"columnDefs" : [
						{
							"orderable": false,
							"render" : function(data, type, row) {
								var buttons = '';
									buttons +="<a href='javascript:void(0);' class='btn btn-primary  btn-xs' onClick=\"opbj('" + row.id + "')\" >编辑</a>";
				                    buttons +=" <a href='javascript:void(0);' class='btn btn-primary  btn-xs ' onClick=\"deleteroww('" + row.id + "')\" >删除</a>";
								return buttons;
							},
							"targets" :5,
						}],
				 "language" : {
					 "url" : "../../static/i18n/Chinese.json"
				} 
        });
           

    
            //单击选中行就变色
             $('#editable tbody').on( 'click', 'tr', function () {
                if ( $(this).hasClass('selected') ) {
                $(this).removeClass('selected');
                }
            else {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
                }
            });

           
        });

    //删除行方法
        function deleteroww(id) {
          layer.confirm('确认删除？', {
                            btn: ['确认','取消'] //按钮
                            }, function(index){//确认就删除
                                // var a=$(n).parent().parent();
                                //     a.remove();
                                 //    layer.msg('已删除', {icon: 1});
                           	 $.ajax({
                    				type: "post",
                    				url : '${path}/cdglController/deleteElement',
                    				data:{
                    					id:id
                    				},
                    				dataType:'json',
                    				success:function(data){
                    					var result=eval(data);
                    					layer.msg(result.msg);
                    					//table.fnDraw(false);//fnDraw doesn't keep pagination state.
                    					table._fnAjaxUpdate(table.oSettings);
                    				
                        			
                    	    		}
                    			});
                       });

        };

    //打开编辑页面
        function opbj(id) {
          layer.open({
              type: 2 //Page层类型
              ,area: ['100%', '100%']
              ,title: '编辑'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['${path}/cdglController/toEditPage?id='+id]
          	  ,end: function(){
    			//layer.msg("修改成功");
	    		//table.fnDraw();
	    		table._fnAjaxUpdate(table.oSettings);
	       	}
            });    
  
        };

         //打开新增页面
        function opadd() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['100%', '100%']
              ,title: '新增'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['${path}/cdglController/toAddPage']
              ,end: function(){
        		table._fnAjaxUpdate(table.oSettings);
	    	}
            });    
  
        };
 -->
     <script>
    var table;
        $(document).ready(function () {
            /*$('.dataTables-example').dataTable();*/
           
            /* Init DataTables */
            //table = $('#editable').dataTable({
                /*"searching" : false,*/
               //  "bSort": false  
               // });
           table = $('#editable').dataTable({
				"bServerSide" : true,
				"bAutoWidth" : true,
				"processing" : true,
				"ordering" : false,
				"bFilter": true,
				"searching" : true,
				"bPaginate" : true,
		//		"bStateSave":true,
				"lengthMenu": [
						[ 10, 30, 50],
						[ 10, 30, 50]
				 ],
				"dom" : 'Blfrtip',
				"ajax" : {
					"url" : "${path}/buttoninfoController/datagrid",
					"type" :"post",
					"data" : function(d) {
						//keywords search params pass to server
						var searchtext = $(".dataTables_wrapper .dataTables_filter input").val();
						if(searchtext != null){
							d.searchtext = encodeURI(searchtext);
						} 
						//keywords search params pass to server
						var sel = $('#btnSelected').val();  //columns name in selectbox
						if(sel == 1){
							d.keysearch = encodeURI($('#keysearch').val());
						}
					}
				},
				"columns" : [ {
					"data" : "id"
				}, {
					"data" : "buttonname"
				}, {
					"data" : "buttonpage"
				}, {
					"data" : "buttonpageid"
				}, {
					"data" : "buttonpagename"
				}, {
					"data" : ""
				}   ],
				"columnDefs" : [
						{
							"orderable": false,
							"render" : function(data, type, row) {
								var buttons = '';
									buttons +="<a href='javascript:void(0);' class='btn btn-primary  btn-xs' onClick=\"buttoninfo_ed('" + row.id + "')\" >编辑</a>";
				                    buttons +=" <a href='javascript:void(0);' class='btn btn-primary  btn-xs ' onClick=\"buttoninfo_del('" + row.id + "')\" >删除</a>";
								return buttons;
							},
							"targets" :5,
						}],
				 "language" : {
					 "url" : "../../static/i18n/Chinese.json"
				} 
        });

    
            //单击选中行就变色
             $('#editable tbody').on( 'click', 'tr', function () {
                if ( $(this).hasClass('selected') ) {
                $(this).removeClass('selected');
                }
            else {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
                }
            });

           
        });

    //删除行方法
       /*  function deleteroww(n) {
          layer.confirm('确认删除？', {
                            btn: ['确认','取消'] //按钮
                            }, function(){//确认就删除
                                  var a=$(n).parent().parent();
                                      a.remove();
                                      layer.msg('已删除', {icon: 1});
                        });

        }; */
          function buttoninfo_del(id) {
            layer.confirm('确认删除？', {
                              btn: ['确认','取消'] //按钮
                              }, function(index){//确认就删除
                                   // var a=$(n).parent().parent();
                                   //     a.remove();
                                    //    layer.msg('已删除', {icon: 1});
                              	 $.ajax({
                       				type: "post",
                       				url : '${path}/buttoninfoController/deleteElement',
                       				data:{
                       					id:id
                       				},
                       				dataType:'json',
                       				success:function(data){
                       					var result=eval(data);
                       					layer.msg(result.msg);
                       					//table.fnDraw(false);//fnDraw doesn't keep pagination state.
                       					table._fnAjaxUpdate(table.oSettings);
                       				
                           			
                       	    		}
                       			});
                          });

          };

    //打开编辑页面
        /* function opbj(n) {
          layer.open({
              type: 2 //Page层类型
              ,area: ['100%', '100%']
              ,title: '编辑'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['editangl.jsp']
            });    
  
        }; */
         function buttoninfo_ed(id) {
            layer.open({
                type: 2 //Page层类型
                ,area: ['100%', '100%']
                ,title: '编辑'
                ,shade: 0.6 //遮罩透明度
                ,maxmin: false //允许全屏最小化
                ,anim: 5 //0-6的动画形式，-1不开启
                ,content: ['${path}/buttoninfoController/toEditPage?id='+id]
            	  ,end: function(){
            			//layer.msg("修改成功");
  		    		//table.fnDraw();
  		    		table._fnAjaxUpdate(table.oSettings);
  		       }
              });    
    
          };

         //打开新增页面
       /*  function opadd(n) {
          layer.open({
              type: 2 //Page层类型
              ,area: ['100%', '100%']
              ,title: '新增'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['addangl.jsp']
            });    
  
        }; */
	 function opadd() {
            layer.open({
                type: 2 //Page层类型
                ,area: ['100%', '100%']
                ,title: '新增'
                ,shade: 0.6 //遮罩透明度
                ,maxmin: false //允许全屏最小化
                ,anim: 5 //0-6的动画形式，-1不开启
                ,content: ['addangl.jsp']
            	  ,end: function(){
            		table._fnAjaxUpdate(table.oSettings);
  	    	}

              });    
    
          };

    </script>

    
    

</body>

</html>
