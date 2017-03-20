<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/page/common/easyui_head.jsp"%>
<title>模板内容页</title>
</head>
<body>
<div class="content-body">
	<div class="search-panel toggle-panel">
		<div class="search-panel-content">
			<form id="edit${table.className}From" name="edit${table.className}From" method='post'>
				<div class="search-panel-bd">
					<#if (table.primaryKeys?size==1)>
						<#list table.primaryKeys as c > 
							<input type="hidden" id="edit_${c.columnName}" name="edit_${c.columnName}"   />
						</#list>
					</#if>
					<table class="search-table">
					   <#list table.columns as c >
					   <#list table.primaryKeys as c1 > 
					  	<#if (c1.columnName!=c.columnName)>
						    <#if (c.javaType=='java.util.Date'||(c.javaType=='java.sql.Timestamp'))>
								<tr>
									<th class="wd-20"><label>${c.remarks}</label></th>
									<td>
										<input type="text" id="edit_${c.columnName}" name="edit_${c.columnName}"   class="easyui-datebox" data-options="required:true,invalidMessage:'${c.remarks}格式必须为yyyy-mm-dd',missingMessage:'${c.remarks}格式必须为yyyy-mm-dd'"  style="width:200px;"/>
									</td>
								 </tr>
								</#if>
							    <#if (c.javaType=='java.math.BigDecimal')||(c.javaType=='java.lang.Long') ||(c.javaType=='java.lang.Integer')||(c.javaType=='java.lang.Float')||(c.javaType=='java.lang.Double')>
								 <tr>
									<th class="wd-20"><label>${c.remarks}</label></th>
									<td>
										<input type="text" id="edit_${c.columnName}" name="edit_${c.columnName}"   class="easyui-validatebox" data-options="required:true,validType:'number[2,16]',invalidMessage:'${c.remarks}必须为数字',missingMessage:'${c.remarks}必须为数字'" style="width:200px;"/>
									</td>
								  </tr>
							    </#if>
							    <#if (c.javaType=='java.lang.String')||(c.javaType=='Boolean')> 
								 <tr>
									<th class="wd-20"><label>${c.remarks}</label></th>
									<td>
										<#if c.remarksMeans.meanType?? && c.remarksMeans.meanType = "0">
											<select id="edit_${c.columnName}" name="edit_${c.columnName}" class="easyui-combobox"  style="width:200px;">
												<option value="">未选择</option>
												<#list c.remarksMeans.meanName as mean>
													<option value="${mean[0]}">${mean[1]}</option>
												</#list>
											</select>
										</#if>
										<#if  c.remarksMeans.meanType?? && c.remarksMeans.meanType = "1">
											<input type="text" id="edit_${c.columnName}" name="edit_${c.columnName}" class="easyui-validatebox"   data-options="required:true,invalidMessage:'格式为:${c.remarksMeans.format}',missingMessage:'格式为:${c.remarksMeans.format}'"  style="width:200px;" />
										</#if>
										<#if  c.remarksMeans.meanType?? && c.remarksMeans.meanType = "2">
											<select id="edit_${c.columnName}" name="edit_${c.columnName}" class="easyui-combobox"  style="width:200px;">
											</select>
										</#if>
										<#if  c.remarksMeans.meanType?? && c.remarksMeans.meanType = "3">
											<input type="text" id="edit_${c.columnName}" name="edit_${c.columnName}" class="easyui-validatebox"   style="width:200px;" />
										</#if>
										<#if  c.remarksMeans.meanType?? && c.remarksMeans.meanType = "-">
											<input type="text" id="edit_${c.columnName}" name="edit_${c.columnName}" class="easyui-validatebox"   data-options="required:true,invalidMessage:'${c.remarks}不能为空',missingMessage:'${c.remarks}不能为空'"  style="width:200px;" />
										</#if>
									</td>
								  </tr>
					   		 </#if>
						  </#if>
					   </#list>
					 </#list>
					</table>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){ 
	
	<#list table.columns as c >
		<#if  c.remarksMeans.meanType?? && c.remarksMeans.meanType = "2">
			$.ajax({
			 type:'POST',
			 cache:false,
			 async: false,
		     url:'<%=path%>'+"/obtain${c.remarksMeans.tablelName}.do",
			 success:function(data){
						data = $.parseJSON(data);
						$("#edit_${c.columnName}").combobox({	
					    			data:data.rows,
					    			valueField:'id', 
					    			textField:'text' ,
					    		});
				}
		});	
		</#if>
	</#list>


	<%String pkid=request.getParameter("pkid"); %>
	$.ajax({
		type:'POST',
		url:'<%=path%>'+"/editDetail_${table.className}.do?pkid="+'<%=pkid%>',    
		success:function(data){
		 	data = $.parseJSON(data);
		 	var message = data.message;
		 	<#list table.columns as c >
		 		<#if c.remarksMeans.meanType?? && (c.remarksMeans.meanType = "0" || c.remarksMeans.meanType = "2" )>
		 			$("#edit_${c.columnName}").combobox('select', message.${c.columnName});
		 		<#else>
					$("#edit_${c.columnName}").val(message.${c.columnName}); 
				</#if>
			</#list>  
		}
	});	
}); 
</script>
</body>
</html>