<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/page/common/easyui_head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"> 
<title>模板内容页</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="css/themes/icon.css">
<script type='text/javascript' src='<%=basePath%>js/common.js'></script>
</head>
<body>
<!--内容-->
<div id="div_${table.lowerCaseFirstClassName}_list" class="container">
	<div class="page-toolbar clearfix">
		<ul class="page-toolbar-list">
			<li><a href="javascript:;" id="add_btn"><i class="icon-add"></i>新增</a></li>
		</ul>
	</div>
	<article id="content" class="content">
		<div class="content-body">
			<!--搜索栏开始-->
			<div class="search-panel toggle-panel">
				<div class="panel-header" data-role="toggle-handle">
					<h2 class="panel-title">查询条件</h2>
				</div>
				<div class="search-panel-content">
					<form id="searchForm" name="searchForm" method="post" >
						<div class="search-panel-bd">
							<table class="search-table">
								<#list table.columns as c >
								   <#if (c.javaType=='java.util.Date'||(c.javaType=='java.sql.Timestamp'))>
									<tr>
										<th class="wd-20"><label>${c.remarks}</label></th>
										<td>
											<input type="text"  name="search_${c.columnName}"   style="width:200px;" class="easyui-datebox" />
										</td>
									 </tr>
									<#else>
									 <tr>
										<th class="wd-20"><label>${c.remarks}</label></th>
										<td>
											<#if c.remarksMeans.meanType?? && c.remarksMeans.meanType = "0">
												<select name="search_${c.columnName}"  class="easyui-combobox"　 style="width:200px;">
													<option value="">未选择</option>
													<#list c.remarksMeans.meanName as mean>
														<option value="${mean[0]}">${mean[1]}</option>
													</#list>
												</select>
											</#if>
											<#if  c.remarksMeans.meanType?? && c.remarksMeans.meanType = "1">
												<input type="text" name="search_${c.columnName}"    data-options="required:true,invalidMessage:'格式为:${c.remarksMeans.format}',missingMessage:'格式为:${c.remarksMeans.format}'"  style="width:200px;" />
											</#if>
											<#if  c.remarksMeans.meanType?? && c.remarksMeans.meanType = "2">
												<select id="search_${c.columnName}" name="search_${c.columnName}" class="easyui-combobox"  style="width:200px;">
												</select>
											</#if>
											<#if  c.remarksMeans.meanType?? && c.remarksMeans.meanType = "3">
												<input type="text"  name="search_${c.columnName}" class="easyui-validatebox"   style="width:200px;" />
											</#if>
											<#if  c.remarksMeans.meanType?? && c.remarksMeans.meanType = "-">
												<input type="text" name="search_${c.columnName}"  data-options="required:true"  style="width:200px;"/>
											</#if>
										</td>
									  </tr>
								    </#if>
								</#list>
							</table>
						</div>
						<div class="search-btn-area">
							<input id="search_btn" type="button" value="查 询" />
							<input id="clear_btn" type="button" value="清 除" />
						</div>
					</form>
				</div>
			</div>
			<!--搜索栏结束-->
			
			<!--搜索结果开始-->
			<div class="result-content">
				<table  id="dg_${table.lowerCaseFirstClassName}" class="easyui-datagrid" title="DataGrid Title" style="width:auto;height:300px"
					data-options="rownumbers:true,singleSelect:true,collapsible:true,sortName:'',sortOrder:'desc',pagination:'true',url:'<%=path%>/search_${table.lowerCaseFirstClassName}_getListData.do',method:'post'">
					<thead>
						<tr>
						 	<th data-options="field:'detail',width:50,align:'center'">明细</th>
							<th data-options="field:'edit',width:50,align:'center'">编辑</th>
						<#list table.columns as c >
							<th data-options="field:'${c.columnName}',width:120,sortable:'true',align:'right'">${c.remarks}</th>
						</#list>
						</tr>
					</thead>
				</table>
			</div>
			<!--搜索栏结果end-->
		</div>
	</article>
</div>

<script>
var ${table.lowerCaseFirstClassName}_list ={};
jQuery(function($){
	var path = '<%=path%>';
	
    //定义一览页面查询的参数(JSON格式)
    ${table.lowerCaseFirstClassName}_list.buildJsonQueryParams = function(){
		  	var searchContent =	{
		  		//标准查询部分
			 	pageNumber:$('div#div_${table.lowerCaseFirstClassName}_list #dg_${table.lowerCaseFirstClassName}').datagrid('options').pageNumber,
		  		//页面查询框部分
				<#list table.columns as c >
					${c.columnName} :$("input[name='search_${c.columnName}']").val(), 
				</#list>  
		    };
			var searchContentStr  =JSON.stringify(searchContent);
			//传到到后台的URL 必须先编码化
			return encodeURI(searchContentStr);
	 };
	 
	//定义新增信息的参数(JSON格式)
    ${table.lowerCaseFirstClassName}_list.buildJsonAddParams = function(){
		  	var addContent =	{
		  		//页面输入框部分
				<#list table.columns as c >
					${c.columnName} :$("input[name='add_${c.columnName}']").val(), 
				</#list>  
		    };
			var addContentStr  =JSON.stringify(addContent);
			//传到到后台的URL 必须先编码化
			return encodeURI(addContentStr);
	 };
	
	//重新按照条件刷新查询一览内容
	$('div#div_${table.lowerCaseFirstClassName}_list #search_btn').click(function(){
		var searchContentStr = ${table.lowerCaseFirstClassName}_list.buildJsonQueryParams();		
		var url = path+"/search_${table.lowerCaseFirstClassName}_getListData.do?searchContentStr="+searchContentStr; 
		//重新赋值url 属性
        $("#dg_${table.lowerCaseFirstClassName}").datagrid("options").url=url;
        $("#dg_${table.lowerCaseFirstClassName}").datagrid("reload"); 
	});
	
	//重置查询条件并刷新内容
	$('div#div_${table.lowerCaseFirstClassName}_list #clear_btn').click(function(){
		//清空查询条件
		<#list table.columns as c >
			$("input[name='search_${c.columnName}']").val("");
		</#list>  
		var form = $(searchForm);
	    form.find("select.easyui-combobox").combobox("setValue","");
	    form.find("input.easyui-datebox").datebox("clear");
	    form.find(":input[name]").not(":hidden").val("");
		var searchContentStr = ${table.lowerCaseFirstClassName}_list.buildQueryParams();
		var url = path+"/search_${table.lowerCaseFirstClassName}_getListData.do?searchContentStr="+searchContentStr; 
	    $("#dg_${table.lowerCaseFirstClassName}").datagrid("options").url=url;
	    $("#dg_${table.lowerCaseFirstClassName}").datagrid("reload"); 
	});
	
	/*
	 * 点击新增按钮打开新增信息弹框
	 */
	$('div#div_${table.lowerCaseFirstClassName}_list #add_btn').click(function(){
		var add_form_id ='#add${table.className}From';
		$('<div id="dialog_holder"></div>').dialog({
		    title: '新增${table.tableName}',
		    width: 800,
		    height: 500,
		    href: path+'/page/${table.lowerCaseFirstClassName}/add${table.className}Page.jsp',
		    modal: true,
		    method: "POST",
			onClose: function(){
				$(this).dialog("destroy");
			},
		    buttons: [{
		    	text: "保存",
		    	handler: function(){
		    		if($(add_form_id).form("validate")==true){
						$.messager.progress(); 
						$.ajax({
							 type:'POST',
							 cache:false,
					 		 async: false,
						     url:'<%=path%>'+"/add_${table.className}.do?addContentStr="+${table.lowerCaseFirstClassName}_list.buildJsonAddParams(),
							 success:function(data){
							        $.messager.progress('close');
									data = $.parseJSON(data);
									if(data.error){
									    $.messager.alert("操作提示",data.message);
									    return;
									}else{
									    $.messager.alert("操作提示",data.message);
										$('#dialog_holder').dialog('close');
								        $("#dg_${table.lowerCaseFirstClassName}").datagrid("reload"); 
									} 
							}
						});
					};   
		    	},id:'add_save'
		    },{text: "退出",
		    	handler: function(e){
		    		$("#dialog_holder").dialog("destroy");
			 		$("#dialog_holder").dialog('close');
		    	},id:'add_cancel'}
		    ]
		});
	});
	
	
	//定义修改信息的参数(JSON格式)
    ${table.lowerCaseFirstClassName}_list.buildJsonEditParams = function(){
		  	var editContent =	{
		  		//页面输入框部分
				<#list table.columns as c >
					${c.columnName} :$("input[name='edit_${c.columnName}']").val(), 
				</#list>  
		    };
			var editContentStr  =JSON.stringify(editContent);
			//传到到后台的URL 必须先编码化
			return encodeURI(editContentStr);
	 };
	 
	/*
	 * 点击编辑按钮弹出编辑信息框
	 pkid:主键
	 */
	${table.lowerCaseFirstClassName}_list.updateFormSubmit = function(pkid){
	    var edit_form_id ='#edit${table.className}From';
		$('<div id="dialog_holder"></div>').dialog({
		    title: '${table.className}',
		    width: 800,
		    height: 500,
		    href: path+"/page/${table.lowerCaseFirstClassName}/edit${table.className}Page.jsp?pkid="+pkid,
		    modal: true,
		    method: "POST",
		    async: false,
			onClose: function(){
				$(this).dialog("destroy");
			},
		    buttons: [{
		    	text: "保 存",
		    	handler: function(e){
				    //验证不能为空的信息是否都填充
				    if($(edit_form_id).form("validate")==true){
					  	$.messager.progress(); 
			      		$.ajax({
							type:'POST',
							cache:false,
					 		async: false,
						    url:'<%=path%>'+"/edit_${table.className}.do?editContentStr="+${table.lowerCaseFirstClassName}_list.buildJsonEditParams(),
							success:function(data){
							        $.messager.progress('close');
									data = $.parseJSON(data);
									if(data.error){
									    $.messager.alert("操作提示",data.message);
									    return;
									}else{
									    $.messager.alert("操作提示",data.message);
										$('#dialog_holder').dialog('close');
								        $("#dg_${table.lowerCaseFirstClassName}").datagrid("reload"); 
									} 
							}
						}); 
					};   
		    	},id:'edit_save'
		    },{text:'退出',
				    handler:function(e){
				      $("#dialog_holder").dialog("destroy");
					  $("#dialog_holder").dialog('close');
					},id:'add_cancel'
			},{ text: "删  除",
				    handler: function(e){
				    	var del = confirm("确定删除吗?");
				    	if(!del){
					       return false;
					    }
		     			$.ajax({
						 		type:'POST',
						 		url:path+"/del_${table.className}.do?pkid="+pkid,    
						 		success:function(data){
						 		 	data = $.parseJSON(data);
						 		 	if(data.error){
									    $.messager.alert("操作提示",data.message);
									    return;
						 		 	}else{
									    $.messager.alert("操作提示",data.message);
							 			$("#dialog_holder").dialog("destroy");
							 		    $("#dialog_holder").dialog("close");
							 		    $("#dg_${table.lowerCaseFirstClassName}").datagrid("reload"); 
						 		 	}		 		 		
						 		}
						 	});
						   } ,
						   id:'del_cancel'}
						   ]
						});
	} ;
	
	//详细
	${table.lowerCaseFirstClassName}_list.detailFormSubmit = function(pkid){
		$('<div id="dialog_holder"></div>').dialog({
		    title: '详细${table.className}',
		    width: 800,
		    height: 500,
		    href: path+"/page/${table.lowerCaseFirstClassName}/detail${table.className}Page.jsp?pkid="+pkid, 
		    modal: true,
		    method: "POST",
			onClose: function(){
				$(this).dialog("destroy");
			},
		    success:function(data){
				if(data.error){
				    $.messager.alert("操作提示",data.message);
				    return;
				}else{
				    $.messager.alert("操作提示",data.message);
					$('#dialog_holder').dialog('close');
			        $("#dg_${table.lowerCaseFirstClassName}").datagrid("reload"); 
				}
		     },buttons: [{
		    	text: "关闭",
		    	handler: function(){
		    		$("#dialog_holder").dialog('close');
		    	}
		    }]
		});
	};
	
	
	
	<#list table.columns as c >
		<#if  c.remarksMeans.meanType?? && c.remarksMeans.meanType = "2">
			$.ajax({
			 type:'POST',
			 cache:false,
			 async: false,
		     url:'<%=path%>'+"/obtain${c.remarksMeans.tablelName}.do",
			 success:function(data){
						data = $.parseJSON(data);
					    $("#search_${c.columnName}").combobox({	
					    			data:data.rows,
					    			valueField:'id', 
					    			textField:'text' ,
					    		});
				}
		});	
		</#if>
	</#list>
	
});

</script>
<%@ include file="/page/common/footer.jsp"%>
</body>
</html>