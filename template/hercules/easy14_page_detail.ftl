<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/page/common/easyui_head.jsp"%>
<title>模板内容页</title>
<script type='text/javascript' src='<%=basePath%>js/common.js'></script>
</head>
<body>
<div class="content-body">
	<div class="search-panel toggle-panel">
		<div class="search-panel-content">
				<div class="search-panel-bd">
					<table class="search-table">
					   <#list table.columns as c >
					   <#list table.primaryKeys as c1 > 
					   <#if (c1.columnName!=c.columnName)>
						   <#if (c.javaType=='java.util.Date'||(c.javaType=='java.sql.Timestamp'))>
							<tr>
								<th class="wd-20"><label>${c.remarks}</label></th>
								<td>
									<input type="text" id="detail_${c.columnName}" name="detail_${c.columnName}" style="width:200px;border-width: 0" readonly="true" />
								</td>
							 </tr>
							<#else>
							 <tr>
								<th class="wd-20"><label>${c.remarks}</label></th>
								<td>
									<input type="text" id="detail_${c.columnName}" name="detail_${c.columnName}"   style="width:200px;border-width: 0" readonly="true" />
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
	//页面加载时带出相关信息
	<%String pkid=request.getParameter("pkid"); %>
	$.ajax({
		type:'POST',
		url:'<%=path%>'+"/detail_${table.className}.do?pkid="+'<%=pkid%>',    
		success:function(data){
		 	data = $.parseJSON(data);
		 	var message = data.message;
		 	<#list table.columns as c >
				${"$"}("#detail_${c.columnName}").val(message.${c.columnName}); 
			</#list>  
		}
	});
}); 
</script>
</body>
</html>