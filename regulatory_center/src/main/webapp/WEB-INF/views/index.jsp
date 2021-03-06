<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
     <%@ include file="/common/jsp/mytag.jsp"%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>赫美征信测试平台主页</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${webRoot}/plug-in/hplus/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${webRoot}/plug-in/hplus/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${webRoot}/plug-in/hplus/css/animate.min.css" rel="stylesheet">
    <link href="${webRoot}/plug-in/hplus/css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#" id="foutBold">
                               <span class="block m-t-xs"><strong class="font-bold">赫美征信测试平台</strong></span>
                            </a>
                        </div>
                        <div class="logo-element">
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">报送管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
								<a class="J_menuItem" href="${webRoot}/creditinfo/index" data-index="0">信贷信息管理</a>
                            </li>
                           	<li> 
                                <a class="J_menuItem" href="${webRoot}/creditinfo/factoryInspection">信贷信息管理（厂检）</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${webRoot}/creditinfo/importCsv">机构导入信息管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${webRoot}/creditinfo/importOrgLogForPage">机构导入信息日志</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${webRoot}/datareportcfg/index">不报配置管理</a>
                            </li> 
                            <li>
                                <a class="J_menuItem" href="${webRoot}/datareportcfg/info">不报信息查询</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${webRoot}/error/index">错误信息查询</a>
                            </li>  
                        </ul>
                    </li>
                    
                     <li>
                        <a href="#">
                            <i class="fa fa-table"></i>
                            <span class="nav-label">基础信息管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        <li>
                                <a class="J_menuItem" href="${webRoot}/customer/custom" >客户信息管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${webRoot}/trademanage/index">交易信息管理</a>
                            </li>
                        </ul>
                    
                       <li>
                        <a href="#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">统计查询</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<li>
                                <a class="J_menuItem" href="${webRoot}/unreported/index">应报未报数据查询</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${webRoot}/datacheck/index">自检数据管理</a>
                            </li>
                             <li>
                                <a class="J_menuItem" href="${webRoot}/customer/index">已报信息查询</a>
                            </li>
                        </ul>

                    </li>
                    <li>
                        <a href="#" onclick="dataClearFunc('${webRoot}/datacheck/dataClear')"><span class="nav-label">数据清理</span></a>
                    </li>
                    
                   <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">短信功能</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="${webRoot}/sms/smsModuleList">短信配置功能</a>
                            </li>
                               <li>
                                <a class="J_menuItem" href="${webRoot}/sms/smsSendList">短信发送管理</a>
                            </li>  
                            <li>
                                <a class="J_menuItem" href="${webRoot}/sms/smsSendDetailList">短信发送明细查询</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${webRoot}/sms/smsSendStatistical">短信发送统计台账</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${webRoot}/qm/quartzManagerPage">定时任务管理</a>
                            </li> 
                        </ul>
                    </li> 
                    
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="#" class="active J_menuTab" data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
             <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%"  frameborder="0" data-id="index_v1.html" seamless>
                </iframe>
            </div>
            
            <div class="footer">
                <div class="pull-right">&copy; 2017-2020 <a href="http://xxx/" target="_blank" id="footers">赫美征信平台</a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>
   
    <script src="plug-in/jquery/1.10.2/jquery.js"></script>
    <script src="plug-in/hplus/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="plug-in/metisMenu/jquery.metisMenu.js"></script>
    <script src="plug-in/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="plug-in/layer/layer.min.js"></script>
    <script src="plug-in/hplus/js/hplus.min.js?v=4.1.0"></script>
    <script src="plug-in/hplus/js/contabs.min.js"></script>
    <script src="plug-in/pace/pace.min.js"></script>
    <script type="text/javascript">
    
    $(function(){
    	//debugger;
    	//获取路径
    	var pathName=window.document.location.pathname;
    	var host = window.document.location.host;
    	//截取，得到项目名称
    	var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    	//var projectIP=pathName.substring(0,pathName.substr(0).indexOf('/')+1);
    	if(projectName == "/regulatory_center"){
    		document.title = '个人征信平台';
    		$("#foutBold").text('个人征信平台') ;
    		 $("#footers").text('个人征信平台') ; 
    		   //tue = "个人征信平台";
    	}else if(projectName == "/regulatory_center_hm"){
    		document.title = '赫美征信平台';
    		$("#foutBold").text('赫美征信平台') ;
    		$("#footers").text('赫美征信平台') ; 
    	}else {
    		document.title = '综合征信平台';
    		$("#foutBold").text('综合征信平台') ;
    		$("#footers").text('综合征信平台') ;
    	}
    });
    
		function dataClearFunc(url){
			debugger;
		    var trtitle = webRoot ;
		    	var tr = trtitle.split("/")[1];
			$.ajax({
				url: url,
				type: 'post',
				success:function(result){
					layer.alert(result);
				}
			})
			
		}
    </script>
</body>
</html>
