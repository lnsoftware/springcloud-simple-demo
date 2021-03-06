<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/jsp/mytag.jsp"%>
<%@include file="/common/jsp/bootstrap.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>错误信息查询</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row base-margin" id="query">
			<form class="form-inline"  method="post" id="queryForm">
				<div class="form-group">
					<label >合作机构:</label> 
					<input type="text"  class="hidden" name="coOrgCode"  id="coOrgCode"> 
					<input type="text" class="form-control"  readonly="readonly"  name="coOrgName" id="coOrgName"  onclick="selectOrg()" placeholder="请选择"/>
				</div>
				<div class="form-group">
					<label >业务号:</label> 
					<input type="text" class="form-control" name="iouNo" id="iouNo" />
				</div>
				<div class="form-group">
                	<label>证件类型：</label>
                        <select id="credType" name="credType" class="form-control">
                        	<option class="form-control" selected="selected" value="">请选择</option>
                            <option class="form-control" value="0">身份证</option>
                            <option value="1">户口簿</option>
                            <option value="2">护照</option>
                            <option value="3">军官证</option>
                            <option value="4">士兵证</option>
                            <option value="5">港澳居民来往内地通行证</option>
                            <option value="6">台湾同胞来往内地通行证</option>
                            <option value="7">临时身份证</option>
                            <option value="8">外国人居留证</option>
                            <option value="9">警官证</option>
                            <option value="X">其他证件</option>
                        </select>
                 </div>
				<div class="form-group">
					<label >证件号码:</label> 
					<input type="text" class="form-control" name="credCode" id="credCode" />
				</div>
				<div class="form-group">
					<label >数据来源:</label> 
					 <select id="dataSrc" name="dataSrc" class="form-control">
                            <option class="form-control" selected="selected" value="0">请选择</option>
                            <option value="1">信贷</option>
                            <option value="2">CSV</option>
                        </select>
				</div>
				<div class="form-group btn1">
					<button type="button" id="queryBtn" class="btn btn-primary">查询</button>
					<button type="button" id="delBtn" class="btn btn-primary">删除</button>
					<button type="button" id="resetBtn" class="btn btn-primary">重置</button>
				</div>
			</form>
		</div>
		<div class="container fit-body">
			<div class="fixed-table-toolbar">
	        	<div class="bs-bars pull-left">
		    		<div id="toolbar" class="btn-group group3">
				       <div class="btn-group">
				        	<button id="exportBtn" class="btn btn-primary " >导出</button>
				       </div>
		    		</div>
		    	</div>
	      	</div>
			<table id="error-table"> </table>
		</div>
	</div>
		
<script>
	var queryUrl = "${webRoot}/error/errorMsgPage";
	
	/**
	 * 机构下拉框
	 */
	function selectOrg(){
		var projectNum;
		var index = layer.open({
			  type: 2,
			  title: '选择机构',
			  maxmin: true,
			  content: '${webRoot}/publicquery/org',
			  area: ['850px', '500px'],
			  btn: ['确定','关闭'],
              yes: function(index){
                  projectNum = window["layui-layer-iframe" + index].callbackdata();
                  $("#coOrgCode").val(projectNum[0]);
                  $("#coOrgName").val(projectNum[1]);
                  //最后关闭弹出层
                  layer.close(index);
              },
              cancel: function(){
              }
		});
	}
	$(function() {
		
		
		initTable();
		
		/*
		 * 默认导出全部数据文件
		 */
		$('#exportBtn').click(function () {
			var coOrgNo = $("#coOrgCode").val();
			var iouNo = $("#iouNo").val();
			var credCode = $("#credCode").val();
			var credType = $("#credType").val();
			var dataSrc = $("#dataSrc").val();
			exportDatas(coOrgNo,iouNo,credCode,credType,dataSrc);
	    });
		
		/**
		 * 根据所选条件删除数据
		 */
		$('#delBtn').click(function () {
			var coOrgNo = $("#coOrgCode").val();
			var iouNo = $("#iouNo").val();
			var credCode = $("#credCode").val();
			var credType = $("#credType").val();
			var dataSrc = $("#dataSrc").val();
			var index = layer.confirm('是否确认删除？', {
				  btn: ['是','否'] 
			},function(){
				delSelectedDatas(coOrgNo,iouNo,credCode,credType,dataSrc);
			},function(){
				layer.close(index);
			});
		});
		
		
		/**
		* 主页查询按钮
		*/
		$("#queryBtn").click(function() {
			$('#error-table').bootstrapTable( 'refresh');
		});
		
		/**
		 * 重置按钮
		 */
		$("#resetBtn").click(function() {
			document.getElementById('queryForm').reset();
		});
	});

		function exportDatas(coOrgNo,iouNo,credCode,credType,dataSrc){
			window.location.href="${webRoot}/error/exportErrorDatas?coOrgNo="+coOrgNo+"&&iouNo="+iouNo+"&&credCode="+credCode+"&&credType="+credType+"&&dataSrc="+dataSrc;
		}
		
		/**
		 * 删除
		 */
		function delSelectedDatas(coOrgNo,iouNo,credCode,credType,dataSrc){
			$.ajax({
				type : 'post',
				url : '${webRoot}/error/delSelectedDatas',
				data : { 'coOrgNo' : coOrgNo,'iouNo':iouNo,'credCode':credCode,'credType':credType,'dataSrc':dataSrc },
				beforeSend: function () {  
		        	i = ityzl_SHOW_LOAD_LAYER();  
		    	}, 
				success : function(data) {
					ityzl_CLOSE_LOAD_LAYER(i);  
					if (data.status == 1) {
						parent.layer.alert("删除成功",{icon: 1});
					} else {
						parent.layer.alert("删除失败");
					}
					$('#error-table').bootstrapTable('refresh'); //刷新表格
				},
				error : function() {
					ityzl_CLOSE_LOAD_LAYER(i);  
					parent.layer.alert("删除出错",{icon: 2});
				},

			});
		}
	
		function doQuery(params) {
			$('#error-table').bootstrapTable('refresh'); //刷新表格
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
		
		/**
		 * 初始化table
		 */
		function initTable() {
			$('#error-table').bootstrapTable({
				url : queryUrl,
				height:tableHeight(),
				method : 'GET',
				showExport: false,
				queryParams : function queryParams(params) { 
					var param = {
						pageSize : params.pageSize,
						pageNumber : params.pageNumber,
						coOrgNo : $("#coOrgCode").val(),
						iouNo : $("#iouNo").val(),
						credCode : $("#credCode").val(),
						credType : $("#credType").val(),
						dataSrc : $("#dataSrc").val()
					};
					return param;
				},
				columns : [ 
						{
							field: '',
							title: '序号', 
							valign : 'left',
							formatter: function (value, row, index) { 
								return index+1; }
						},
						{
							field : 'ruleNo',
							title : '校验编号',
							align : 'left',
							valign : 'middle'
						}, 
						{
							field : 'checkDate',
							title : '检查日期',
							align : 'left',
							valign : 'middle',
							formatter: function (value) {
								return dateFormatUtil(value);
							}
						}, 
						{
							field : 'checkType',
							title : '检查目标类型',
							align : 'left',
							valign : 'middle'
						}, 
						{
							field : 'dataSrc',
							title : '数据来源',
							align : 'left',
							valign : 'middle'
						}, 
						{
							field : 'coOrgCode',
							title : '机构代码',
							align : 'left',
							valign : 'middle'
						}, 
						{
							field : 'conNo',
							title : '合同号',
							align : 'left',
							valign : 'middle'
						}, 
						{
							field : 'iouNo',
							title : '业务号',
							align : 'left',
							valign : 'middle'
						}, 
						{
							field : 'credType',
							title : '证件类型',
							align : 'left',
							valign : 'middle'
						}, 
						{
							field : 'credCode',
							title : '证件号码',
							align : 'left',
							valign : 'middle'
						},
						{
							field : 'tableName',
							title : '检查表名',
							align : 'left',
							valign : 'middle'
						}, 
						{
							field : 'columnName',
							title : '检查字段',
							align : 'left',
							valign : 'middle'
						}, 
						{
							field : 'columnCname',
							title : '检查逻辑字段',
							align : 'left',
							valign : 'middle'
						}, 
						{
							field : 'ruleDesc',
							title : '检查规则描述',
							align : 'left',
							valign : 'middle'
						} 
					]
			});
		}
	</script>
</body>
</html>