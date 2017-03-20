<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/page/common/easyui_head.jsp"%>
<title>模板内容页</title>
</head>
<body>
<div class="content-body" id="addTbTraceInfo">
	<div class="search-panel toggle-panel">
		<div class="search-panel-content">
			<form id="addTbTraceInfoFrom" name="addTbTraceInfoFrom" method="post">
				<div class="search-panel-bd">
				 <table class="search-table">
						 <tr>
							<th class="wd-20"><label>客户ID</label></th>
							<td>
									<select id="add_cust_id" name="add_cust_id" class="easyui-combobox"  style="width:200px;">
									</select>
							</td>
						  </tr>
						 <tr>
							<th class="wd-20"><label>是否新增</label></th>
							<td>
									<select id="add_is_new" class="easyui-combobox" name="add_is_new" style="width:200px;">
											<option value="0">0-否</option>
											<option value="1">1-是</option>
									</select>
							</td>
						  </tr>
						 <tr>
							<th class="wd-20"><label>渠道信息</label></th>
							<td>
									<input type="text" id="add_channel_info" name="add_channel_info" class="easyui-validatebox"   data-options="required:true,invalidMessage:'channel_info不能为空',missingMessage:'channel_info不能为空'"  style="width:200px;" />
							</td>
						  </tr>
						 <tr>
							<th class="wd-20"><label>合作业务</label></th>
							<td>
									<input type="text" id="add_business" name="add_business" class="easyui-validatebox"   data-options="required:true,invalidMessage:'business不能为空',missingMessage:'business不能为空'"  style="width:200px;" />
							</td>
						  </tr>
						 <tr>
							<th class="wd-20"><label>跟踪描述</label></th>
							<td>
									<input type="text" id="add_trace_describe" name="add_trace_describe" class="easyui-validatebox"   data-options="required:true,invalidMessage:'trace_describe不能为空',missingMessage:'trace_describe不能为空'"  style="width:200px;" />
							</td>
						  </tr>
						<tr>
							<th class="wd-20"><label>创建时间</label></th>
							<td>
								<input type="text" id="add_gmt_created" name="add_gmt_created" class="easyui-datebox" data-options="required:true,invalidMessage:'gmt_created格式必须为yyyy-mm-dd',missingMessage:'gmt_created格式必须为yyyy-mm-dd'"  style="width:200px;"/>
							</td>
						 </tr>
						<tr>
							<th class="wd-20"><label>修改时间</label></th>
							<td>
								<input type="text" id="add_gmt_modified" name="add_gmt_modified" class="easyui-datebox" data-options="required:true,invalidMessage:'gmt_modified格式必须为yyyy-mm-dd',missingMessage:'gmt_modified格式必须为yyyy-mm-dd'"  style="width:200px;"/>
							</td>
						 </tr>
						 <tr>
							<th class="wd-20"><label>创建人</label></th>
							<td>
									<input type="text" id="add_creator" name="add_creator" class="easyui-validatebox"   data-options="required:true,invalidMessage:'creator不能为空',missingMessage:'creator不能为空'"  style="width:200px;" />
							</td>
						  </tr>
						 <tr>
							<th class="wd-20"><label>修改人</label></th>
							<td>
									<input type="text" id="add_modifier" name="add_modifier" class="easyui-validatebox"   data-options="required:true,invalidMessage:'modifier不能为空',missingMessage:'modifier不能为空'"  style="width:200px;" />
							</td>
						  </tr>
						 <tr>
							<th class="wd-20"><label>是否删除</label></th>
							<td>
									<input type="text" id="add_is_deleted" name="add_is_deleted" class="easyui-validatebox"   data-options="required:true,invalidMessage:'is_deleted不能为空',missingMessage:'is_deleted不能为空'"  style="width:200px;" />
							</td>
						  </tr>
				  </table>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">

$(document).ready(function(){ 
			$.ajax({
			 type:'POST',
			 cache:false,
			 async: false,
		     url:'<%=path%>'+"/obtainTbCustInfo.do",
			 success:function(data){
						data = $.parseJSON(data);
						$("#add_cust_id").combobox({	
					    			data:data.rows,
					    			valueField:'id', 
					    			textField:'text' ,
					    		});
				}
		});	
}); 
</script>
</body>
</html>