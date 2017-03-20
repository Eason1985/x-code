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
			<form id="editTbTraceInfoFrom" name="editTbTraceInfoFrom" method='post'>
				<div class="search-panel-bd">
							<input type="hidden" id="edit_id" name="edit_id"   />
					<table class="search-table">
								 <tr>
									<th class="wd-20"><label>客户ID</label></th>
									<td>
											<select id="edit_cust_id" name="edit_cust_id" class="easyui-combobox"  style="width:200px;">
											</select>
									</td>
								  </tr>
								 <tr>
									<th class="wd-20"><label>是否新增</label></th>
									<td>
											<select id="edit_is_new" name="edit_is_new" class="easyui-combobox"  style="width:200px;">
												<option value="">未选择</option>
													<option value="0">0-否</option>
													<option value="1">1-是</option>
											</select>
									</td>
								  </tr>
								 <tr>
									<th class="wd-20"><label>渠道信息</label></th>
									<td>
											<input type="text" id="edit_channel_info" name="edit_channel_info" class="easyui-validatebox"   data-options="required:true,invalidMessage:'渠道信息不能为空',missingMessage:'渠道信息不能为空'"  style="width:200px;" />
									</td>
								  </tr>
								 <tr>
									<th class="wd-20"><label>合作业务</label></th>
									<td>
											<input type="text" id="edit_business" name="edit_business" class="easyui-validatebox"   data-options="required:true,invalidMessage:'合作业务不能为空',missingMessage:'合作业务不能为空'"  style="width:200px;" />
									</td>
								  </tr>
								 <tr>
									<th class="wd-20"><label>跟踪描述</label></th>
									<td>
											<input type="text" id="edit_trace_describe" name="edit_trace_describe" class="easyui-validatebox"   data-options="required:true,invalidMessage:'跟踪描述不能为空',missingMessage:'跟踪描述不能为空'"  style="width:200px;" />
									</td>
								  </tr>
								<tr>
									<th class="wd-20"><label>创建时间</label></th>
									<td>
										<input type="text" id="edit_gmt_created" name="edit_gmt_created"   class="easyui-datebox" data-options="required:true,invalidMessage:'创建时间格式必须为yyyy-mm-dd',missingMessage:'创建时间格式必须为yyyy-mm-dd'"  style="width:200px;"/>
									</td>
								 </tr>
								<tr>
									<th class="wd-20"><label>修改时间</label></th>
									<td>
										<input type="text" id="edit_gmt_modified" name="edit_gmt_modified"   class="easyui-datebox" data-options="required:true,invalidMessage:'修改时间格式必须为yyyy-mm-dd',missingMessage:'修改时间格式必须为yyyy-mm-dd'"  style="width:200px;"/>
									</td>
								 </tr>
								 <tr>
									<th class="wd-20"><label>创建人</label></th>
									<td>
											<input type="text" id="edit_creator" name="edit_creator" class="easyui-validatebox"   data-options="required:true,invalidMessage:'创建人不能为空',missingMessage:'创建人不能为空'"  style="width:200px;" />
									</td>
								  </tr>
								 <tr>
									<th class="wd-20"><label>修改人</label></th>
									<td>
											<input type="text" id="edit_modifier" name="edit_modifier" class="easyui-validatebox"   data-options="required:true,invalidMessage:'修改人不能为空',missingMessage:'修改人不能为空'"  style="width:200px;" />
									</td>
								  </tr>
								 <tr>
									<th class="wd-20"><label>是否删除</label></th>
									<td>
											<input type="text" id="edit_is_deleted" name="edit_is_deleted" class="easyui-validatebox"   data-options="required:true,invalidMessage:'是否删除不能为空',missingMessage:'是否删除不能为空'"  style="width:200px;" />
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
						$("#edit_cust_id").combobox({	
					    			data:data.rows,
					    			valueField:'id', 
					    			textField:'text' ,
					    		});
				}
		});	


	<%String pkid=request.getParameter("pkid"); %>
	$.ajax({
		type:'POST',
		url:'<%=path%>'+"/editDetail_TbTraceInfo.do?pkid="+'<%=pkid%>',    
		success:function(data){
		 	data = $.parseJSON(data);
		 	var message = data.message;
					$("#edit_id").val(message.id); 
		 			$("#edit_cust_id").combobox('select', message.cust_id);
		 			$("#edit_is_new").combobox('select', message.is_new);
					$("#edit_channel_info").val(message.channel_info); 
					$("#edit_business").val(message.business); 
					$("#edit_trace_describe").val(message.trace_describe); 
					$("#edit_gmt_created").val(message.gmt_created); 
					$("#edit_gmt_modified").val(message.gmt_modified); 
					$("#edit_creator").val(message.creator); 
					$("#edit_modifier").val(message.modifier); 
					$("#edit_is_deleted").val(message.is_deleted); 
		}
	});	
}); 
</script>
</body>
</html>