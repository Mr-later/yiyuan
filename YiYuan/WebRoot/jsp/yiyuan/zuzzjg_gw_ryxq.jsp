<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>人员详情</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
     <!--LAYER-->
    <link href="${path}/static/js/plugins/layer/skin/layer.css" rel="stylesheet">

    <link href="${path}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${path}/static/css/animate.css" rel="stylesheet">
    <link href="${path}/static/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${path}/static/css/zstyle/xxck.css" rel="stylesheet">
    <%--  <link href="${path}/static/css/zstyle/zzjg_gw_ryxq.css" rel="stylesheet"> --%>

 	<style>
 table {width:100%;border-collapse: separate;empty-cells:show;} 
 
 .btn-new{ background-color: #96CDCD;border: 1px solid #96CDCD;margin-bottom:0px !important;}
    </style>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                     <div class="ibox-title">
                        <h5>人员详情</h5>
                        <div class="ibox-tools"> 
                        	<a onclick="opdaochu()" class="btn btn-primary btn-xs">pdf 导出</a>
                        	<a onclick="opedit()" class="btn btn-primary btn-xs">编辑基本信息</a>
                        	<!-- <a onclick="opadll()" class="btn btn-primary btn-xs">新增培训履历</a> -->
                         <!--    <a onclick="opadjkda()" class="btn btn-primary btn-xs">新增健康档案</a> -->
                              <a data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle" aria-expanded="true">操作 <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                <!--  <li><a onclick="opedit()" >编辑基本信息</a>
                                    </li> -->
                                     <li><a onclick="opadxx()" >新增学习经历</a>
                                    </li>
                                    <li><a onclick="opadgz()">新增工作经历</a>
                                    </li>
                                     <li><a onclick="opadlw()" >新增发表论文</a>
                                    </li>
                                    <li><a onclick="opadkt()">新增承担课题</a>
                                    </li>
                                    <li><a onclick="opadll()" >新增培训履历</a>
                                    </li>
                                    <li><a onclick="opadjkda()">新增健康档案</a>
                                    </li>
                                    
                                </ul>
                            <a onclick="goback1()" class="btn btn-primary btn-xs">返回</a>
                           
                              <!--  <a href="" class="btn btn-info btn-rounded btn-xs">删除</a> -->
                        </div>
                    </div>
                    <div>
                       
                        <div class="ibox-content profile-content">
                             <table class="col-sm-10 table table-bordered" >
	                              <tr>
	                                <td class="fw fwc" colspan="10">一、基本资料</td>
	                           	  </tr>
                             <tr>
                                <td class="col-sm-2 fw">姓名</td>
                                <td class="col-sm-1">${user.username }</td>
                                <td class="col-sm-1 fw" >性别</td>
                                <td class="col-sm-1">${user.usersex}</td>
                                <td class="col-sm-1 fw" >出生日期</td>
                                <td class="col-sm-1">${user.birthdaystr }</td>
                                 <td class="col-sm-1 fw">民族</td>
                                <td class="col-sm-1" colspan="2">${user.minzu }</td>
                                 <td class="col-sm-1" rowspan="3">
                                 	<img alt="image" class="img-responsive" src="${path}/static/img/1cun.jpg" width="100%">
                                 </td>
                               
                            </tr>
                            <tr>
                                <td class="col-sm-1 fw">党派</td>
                                <td class="col-sm-2">${user.dangpai }</td>
                                <td class="col-sm-1 fw" >学历</td>
                                <td class="col-sm-1">${user.xueli }</td>
                                <td class="col-sm-1 fw" >职称</td>
                                <td class="col-sm-2">${user.zhicheng }</td>
                                 <td class="col-sm-1 fw" >职务</td>
                                 <td class="" colspan="2">${user.zhiwu }</td>
                              
                               
                            </tr>
                             <tr>
                                <td class="col-sm-1 fw">工作单位</td>
                                <td class="" colspan="3">${user.gongzuodanwei }</td>
                                <td class="col-sm-1 fw" >邮编</td>
                                <td class="col-sm-1">${user.youbian }</td>
                                <td class="col-sm-1 fw" >专业组</td>
                                <td class="" colspan="2"></td>
                                
                              
                               
                            </tr>
                            <tr>
                                <td class="col-sm-1 fw">邮箱</td>
                                <td class="" colspan="3">${user.youxiang }</td>
                                <td class="col-sm-1 fw" >手机</td>
                                <td class="" colspan="5">${user.shoujihao }</td>             
                            </tr>
                             <tr>
	                                <td class="fw fwc" colspan="10">二、学习经历</td>
	                          </tr>
	                           <tr>
                                <td class="fw text-center" colspan="1">开始时间</td>
                                
                                <td class="fw text-center" colspan="1">结束时间</td>
                               
                                <td class="fw text-center"  colspan="3">院校</td>
                                
                                <td class="fw text-center"  colspan="1">专业</td>
                                
                                <td class="fw text-center"  colspan="2">学位</td>
                                
                                <td class="fw text-center"  colspan="2">操作</td>
 
                            </tr>
                             <tr>
                                 <td class="text-center" colspan="1"></td>
                                 
                                <td class="text-center" colspan="1"></td>
                               
                                <td class="text-center"  colspan="3"></td>
                                
                                <td class="text-center"  colspan="1"></td>
                                
                                <td class="text-center"  colspan="2"></td>
                                
                                <td class="text-center"  colspan="2">
                                	
									<a onclick="opedxx()" class="btn btn-primary btn-rounded btn-xs btn-new">编辑</a>
                        			<a onclick="delthisrow(this)" class="btn btn-primary btn-rounded btn-xs btn-new">删除</a>
                                </td>
                            </tr>
                             <tr>
	                                <td class="fw fwc" colspan="10">三、工作经历</td>
	                          </tr>
                           <tr>
                                <td class="fw text-center" colspan="1">开始时间</td>
                                
                                <td class="fw text-center" colspan="1">结束时间</td>
                               
                                <td class="fw text-center"  colspan="3">单位</td>
                                
                                <td class="fw text-center"  colspan="3">职务</td>
                                
                                <td class="fw text-center"  colspan="2">操作</td>
                                
                            </tr>
                              <tr>
                                  <td class="text-center" colspan="1"></td>
                                
                                <td class="text-center" colspan="1"></td>
                               
                                <td class="text-center"  colspan="3"></td>
                                
                                <td class="text-center"  colspan="3"></td>
                                
                                <td class="text-center"  colspan="2">
                                	<a onclick="opeditgz()" class="btn btn-primary btn-rounded btn-xs btn-new">编辑</a>
                        			<a onclick="delthisrow(this)" class="btn btn-primary btn-rounded btn-xs btn-new">删除</a>
                                </td>
                                
                            </tr>
                             <tr>
                                <td class="fw fwc" colspan="10">四、其他</td>
                                
                            </tr>
	                        <tr >
                                <td class="fw " colspan="2">发表论文<br>（作者、论文题目、杂志、年、期、卷、页码）</td>
                                <td class=""  colspan="9"></td>
                            </tr>
                            <tr >
                                <td class="fw " colspan="2">承担课题<br>包括（年限、基金来源、题目、金额）</td>
                                <td class=""  colspan="9"></td>
                            </tr> 
	                         <tr>
                                <td class="fw fwc" colspan="10">五、培训履历</td>
                                
                            </tr>
                            <tr>
                            <td class="fw text-center" colspan="1">开始时间</td>
                                <td class="fw text-center" colspan="1">结束时间</td>
                                <td class="fw text-center" colspan="3">培训名称</td>
                                <td class="fw text-center" colspan="2">获得证书名称</td>
                                <td class="fw text-center " colspan="3">操作</td>
                               
                            </tr>
                            <tr>
                                <td class="fw text-center" colspan="1"></td>
                                <td class="fw text-center" colspan="1"></td>
                                <td class="fw text-center" colspan="3"></td>
                                <td class="fw text-center" colspan="2"></td>
                                <td class="fw text-center " colspan="3">
                                	<a onclick="opckll()" class="btn btn-primary btn-rounded btn-xs btn-new">查看</a>
									<a onclick="opeditll()" class="btn btn-primary btn-rounded btn-xs btn-new">编辑</a>
                        			<a onclick="delthisrow(this)" class="btn btn-primary btn-rounded btn-xs btn-new">删除</a>
                                </td>
                             
                            </tr>
                          
                              <tr>
                                <td class="col-sm-2 fw fwc" colspan="7">六、健康档案</td>
                                <td class="col-sm-2 fw fwc text-center" colspan="3">操作</td>
                                
                            </tr>
                            <tr>
                                <td class="col-sm-2" colspan="7">2014年度健康档案</td>
                                 <td class="text-center" colspan="3">
                                 <a onclick="opckjk()" class="btn btn-primary btn-rounded btn-xs btn-new">查看</a>
									<a onclick="opedjkda()" class="btn btn-primary btn-rounded btn-xs btn-new">编辑</a>
                        			<a onclick="delthisrow(this)" class="btn btn-primary btn-rounded btn-xs btn-new">删除</a>
								</td>
                                
                            </tr>
                             
                    
                           
                            
                            
                        </table>
                         
                          
                           <div class=" sol-sm-10 user-button text-center">
                                <div class="row text-center" style="margin-left:40%">

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


  <!--layer弹出层-->
    <script type="text/javascript" src="${path}/static/js/plugins/layer/layer.min.js"></script>
    <!-- 自定义js -->
    <script src="${path}/static/js/content.js?v=1.0.0"></script>

 <!-- Page-Level Scripts -->
    <script>
  //返回上一步
    function goback1(){
    	window.history.back(-1);
    }
         //打开基本信息编辑页面
        function opedit() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '80%']
              ,title: '人员详情-编辑'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_edit.jsp']
            });    
  
        };
        function delthisrow(o){ //点击删除按钮 就删除当前的div 
     	   layer.confirm('确认删除？', {
                btn: ['确认','取消'] //按钮
                }, function(){//确认就删除
                      var a=$(o).parent().parent();
                          a.remove();
                          layer.msg('已删除', {icon: 1});
            });
     	 
        };

         //是否删除询问
        function sfdel() {
          layer.confirm('确认删除本资料？', {
          btn: ['确定','取消'] //按钮
            });
        };

        //打开新增培训履历页面
        function opadll() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '65%']
              ,title: '人员详情-新增培训履历'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_adlvli.jsp']
            });    
  
        };
        //打开新增健康档案页面
        function opadjkda() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '60%']
              ,title: '人员详情-新增健康档案'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_adjkda.jsp']
            });    
  
        };
        //打开查看健康档案页面
        function opckjk() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '60%']
              ,title: '人员详情-查看健康档案'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_ckjkda.jsp']
            });    
  
        };
      //打开编辑培训履历页面
        function opeditll() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '65%']
              ,title: '人员详情-编辑培训履历'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_adlvli.jsp']
            });    
  
        };
      //打开查看培训履历页面
        function opckll() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '60%']
              ,title: '人员详情-查看培训履历'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_ckpxll.jsp']
            });    
  
        };
      //打开pdf导出并打印页面
        function opdaochu() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['95%', '95%']
              ,title: '人员详情-pdf 导出'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_dcdy.jsp']
            });    
  
        };
      //打开编辑健康档案页面
        function opedjkda() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '60%']
              ,title: '人员详情-编辑健康档案'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_adjkda.jsp']
            });    
  
        };
      //打开新增学习经历页面
        function opadxx() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '60%']
              ,title: '人员详情-新增学习经历'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_adxuexijl.jsp']
            });    
  
        };
      //打开编辑学习经历页面
        function opedxx() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '60%']
              ,title: '人员详情-编辑学习经历'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_edxuexijl.jsp']
            });    
  
        };
        //打开新增工作经历页面
        function opadgz() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '60%']
              ,title: '人员详情-新增工作经历'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_adgzjl.jsp']
            });    
  
        };
        //打开编辑工作经历页面
        function opeditgz() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '60%']
              ,title: '人员详情-编辑工作经历'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_edgzjl.jsp']
            });    
  
        };
      //打开新增发表论文页面
        function opadlw() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '60%']
              ,title: '人员详情-新增发表论文'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_adfblw.jsp']
            });    
  
        };
      //打开新增承担课题页面
        function opadkt() {
          layer.open({
              type: 2 //Page层类型
              ,area: ['70%', '60%']
              ,title: '人员详情-新增承担课题'
              ,shade: 0.6 //遮罩透明度
              ,maxmin: false //允许全屏最小化
              ,anim: 5 //0-6的动画形式，-1不开启
              ,content: ['ryxq_adcdkt.jsp']
            });    
  
        };
      





    </script>

</body>

</html>
