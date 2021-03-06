<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/jsp/mytag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>合同交易信息历史</title>
<!-- 导入jquery bootstrap js css lib -->
<%@include file="/common/jsp/bootstrap.jsp"%>

</head>
<body>
	<div class="container-fluid">
		<br/>
		<div class="container fit-body">
			<table id="tradehis-table">
			</table>
		</div>
	</div>
	
	<script>
	var data_status = "2";//默认查询校验通过的信息
	var tradehisTableUrl = "${webRoot}/trade/searchListByPage?dataStatus="+data_status;
		$(function() {
			
			initTradehisTable();

			$("#resetBtn").click(function() {
				$('.form-control').val('');
			});
			
			
			$("#queryBtn").click(function() {
				$('#tradehis-table').bootstrapTable('refresh');
			});

		});

		function doQuery(params) {
			$('#tradehis-table').bootstrapTable('refresh'); //刷新表格
		}

		/**
		 * 去掉双重滚动条
		 */
		function tableHeight() {
			var window_height = $(window).height();
			var obj_off_y = $(".fit-body").offset().top;
			var result_height = window_height - obj_off_y;
			return result_height;
		}
		
		function initTradehisTable() {
			$('#tradehis-table').bootstrapTable(
			{
				method : 'GET',
				dataType : 'json',
				contentType : "application/json;charset=utf-8",
				pagination : true, //是否显示分页（*）
				toolbar : '#toolbar',
				cache : false,
				striped : true, //是否显示行间隔色
				sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
				clickToSelect : true, //是否启用点击选中行
				showToggle : false, //是否显示详细视图和列表视图的切换按钮
				singleSelect : false,//复选框单选
				url : tradehisTableUrl,
				height:tableHeight(),
				showRefresh : true,
				showColumns : true,
				queryParamsType : "undefined",
				queryParams : function queryParams(params) { //设置查询参数  
					var param = {
						pageSize : params.pageSize,
						pageNumber : params.pageNumber,
						name : $("#name").val(),
						certno : $("#certNo").val(),
						account : $("#account").val()
				
					};
					return param;
				},
				minimumCountColumns : 2,
				pageNumber : pageNumber, //初始化加载第一页，默认第一页
				pageSize : pageIndexSize, //每页的记录行数（*）
				pageList : pageList, //可供选择的每页的行数（*）
				uniqueId : "id", //每一行的唯一标识，一般为主键列
				columns : [{field: '', title: '序号', formatter: function (value, row, index) { return index+1; }},{
					field : 'name',
					title : '姓名',
					align : 'center',
					valign : 'middle',
				}, {
					field : 'certtype',
					title : '证件类型',
					align : 'center',
					valign : 'middle',
					formatter: function (value) {return getCredType(value)}
				}, {
					field : 'certno',
					title : '证件号',
					align : 'center',
					valign : 'middle'
				}, {
					field : 'deptcode',
					title : '数据发生机构代码',
					align : 'center',
					valign : 'middle'
				}, {
					field : 'account',
					title : '业务号',
					align : 'center',
					valign : 'middle'
				}, {
					field : 'tradeid',
					title : '交易ID',
					align : 'center',
					valign : 'middle'
				}, {
					field : 'creditlimit',
					title : '授信额度',
					align : 'center',
					valign : 'middle'
				}, {
					field : 'shareaccount',
					title : '共享额度',
					align : 'center',
					valign : 'middle'
				}, {
					field : 'maxdebt',
					title : '最大负债额',
					align : 'center',
					valign : 'middle'
				},{
					field : 'guaranteeway',
					title : '担保方式',
					align : 'center',
					valign : 'middle',
					formatter: function (value) {return getGuaranteeway(value)}
				},{
					field : 'termsfreq',
					title : '还款频率',
					align : 'center',
					valign : 'middle',
					formatter: function (value) {return getTermsfreq(value)}
				},{
					field : 'monthduration',
					title : '还款月数',
					align : 'center',
					valign : 'middle'
				} ]
			});
		}

		
		function formReset() {
			document.getElementById("queryForm").reset()
		}
		
	</script>
</body>
</html>