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
					   							 <tr>
								<th class="wd-20"><label>客户ID</label></th>
								<td>
									<input type="text" id="detail_cust_id" name="detail_cust_id"   style="width:200px;border-width: 0" readonly="true" />
								</td>
							  </tr>
							 <tr>
								<th class="wd-20"><label>是否新增</label></th>
								<td>
									<input type="text" id="detail_is_new" name="detail_is_new"   style="width:200px;border-width: 0" readonly="true" />
								</td>
							  </tr>
							 <tr>
								<th class="wd-20"><label>渠道信息</label></th>
								<td>
									<input type="text" id="detail_channel_info" name="detail_channel_info"   style="width:200px;border-width: 0" readonly="true" />
								</td>
							  </tr>
							 <tr>
								<th class="wd-20"><label>合作业务</label></th>
								<td>
									<input type="text" id="detail_business" name="detail_business"   style="width:200px;border-width: 0" readonly="true" />
								</td>
							  </tr>
							 <tr>
								<th class="wd-20"><label>跟踪描述</label></th>
								<td>
									<input type="text" id="detail_trace_describe" name="detail_trace_describe"   style="width:200px;border-width: 0" readonly="true" />
								</td>
							  </tr>
							<tr>
								<th class="wd-20"><label>创建时间</label></th>
								<td>
									<input type="text" id="detail_gmt_created" name="detail_gmt_created" style="width:200px;border-width: 0" readonly="true" />
								</td>
							 </tr>
							<tr>
								<th class="wd-20"><label>修改时间</label></th>
								<td>
									<input type="text" id="detail_gmt_modified" name="detail_gmt_modified" style="width:200px;border-width: 0" readonly="true" />
								</td>
							 </tr>
							 <tr>
								<th class="wd-20"><label>创建人</label></th>
								<td>
									<input type="text" id="detail_creator" name="detail_creator"   style="width:200px;border-width: 0" readonly="true" />
								</td>
							  </tr>
							 <tr>
								<th class="wd-20"><label>修改人</label></th>
								<td>
									<input type="text" id="detail_modifier" name="detail_modifier"   style="width:200px;border-width: 0" readonly="true" />
								</td>
							  </tr>
							 <tr>
								<th class="wd-20"><label>是否删除</label></th>
								<td>
									<input type="text" id="detail_is_deleted" name="detail_is_deleted"   style="width:200px;border-width: 0" readonly="true" />
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
	//页面加载时带出相关信息
	<%String pkid=request.getParameter("pkid"); %>
	$.ajax({
		type:'POST',
		url:'<%=path%>'+"/detail_TbTraceInfo.do?pkid="+'<%=pkid%>',    
		success:function(data){
		 	data = $.parseJSON(data);
		 	var message = data.message;
				$("#detail_id").val(message.id); 
				$("#detail_cust_id").val(message.cust_id); 
				$("#detail_is_new").val(message.is_new); 
				$("#detail_channel_info").val(message.channel_info); 
				$("#detail_business").val(message.business); 
				$("#detail_trace_describe").val(message.trace_describe); 
				$("#detail_gmt_created").val(message.gmt_created); 
				$("#detail_gmt_modified").val(message.gmt_modified); 
				$("#detail_creator").val(message.creator); 
				$("#detail_modifier").val(message.modifier); 
				$("#detail_is_deleted").val(message.is_deleted); 
		}
	});
}); 
</script>
</body>
</html>