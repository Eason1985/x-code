package com.web.entity;
import java.util.HashMap;
import java.util.Map;

import com.absmybatis.dao.annotation.EntityPK;
import com.absmybatis.dao.annotation.EntityColumn;

import com.web.common.ChainMap;	
import java.util.EnumMap;		
	
/**
 * 类功能:自动代码生成 DTO 
 * <p>创建者:</p>
 * <p>创建时间:</p>
 * <p>修改者:</p>
 * <p>修改时间:</p>
 * <p>修改原因：</p>
 * <p>审核者:</p>
 * <p>审核时间:</p>
 * <p>审核意见：</p>
 *
 */
@EntityPK(Pk = "id", tableName = "tb_trace_info")
public class TbTraceInfoDto {//
	//
	@EntityColumn(dataType=12, typeName="VARCHAR", remarks = ""  )
	private java.lang.String id;//
	//客户ID
	@EntityColumn(dataType=12, typeName="VARCHAR", remarks = "客户ID"  )
	private java.lang.String cust_id;//客户ID
	//是否新增
	@EntityColumn(dataType=12, typeName="VARCHAR", remarks = "是否新增"  )
	private java.lang.String is_new;//是否新增
	//渠道信息
	@EntityColumn(dataType=12, typeName="VARCHAR", remarks = "渠道信息"  )
	private java.lang.String channel_info;//渠道信息
	//合作业务
	@EntityColumn(dataType=12, typeName="VARCHAR", remarks = "合作业务"  )
	private java.lang.String business;//合作业务
	//跟踪描述
	@EntityColumn(dataType=-1, typeName="TEXT", remarks = "跟踪描述"  )
	private java.lang.String trace_describe;//跟踪描述
	//创建时间
	@EntityColumn(dataType=93, typeName="DATETIME", remarks = "创建时间"  )
	private java.sql.Timestamp gmt_created;//创建时间
	//修改时间
	@EntityColumn(dataType=93, typeName="DATETIME", remarks = "修改时间"  )
	private java.sql.Timestamp gmt_modified;//修改时间
	//创建人
	@EntityColumn(dataType=12, typeName="VARCHAR", remarks = "创建人"  )
	private java.lang.String creator;//创建人
	//修改人
	@EntityColumn(dataType=12, typeName="VARCHAR", remarks = "修改人"  )
	private java.lang.String modifier;//修改人
	//是否删除
	@EntityColumn(dataType=1, typeName="CHAR", remarks = "是否删除"  )
	private java.lang.String is_deleted;//是否删除


   /**
	* 获取 
	* @return
	*/
	public java.lang.String getId() {
		return id;
	}
	
   /**
	* 设置 
	* @param id
	*/
 	public void setId(java.lang.String id) {
		this.id = id;
	}
	 

   /**
	* 获取 客户ID
	* @return
	*/
	public java.lang.String getCust_id() {
		return cust_id;
	}
	
   /**
	* 设置 客户ID
	* @param cust_id
	*/
 	public void setCust_id(java.lang.String cust_id) {
		this.cust_id = cust_id;
	}
	 

   /**
	* 获取 是否新增
	* @return
	*/
	public java.lang.String getIs_new() {
		return is_new;
	}
	
   /**
	* 设置 是否新增
	* @param is_new
	*/
 	public void setIs_new(java.lang.String is_new) {
		this.is_new = is_new;
	}
	 

   /**
	* 获取 渠道信息
	* @return
	*/
	public java.lang.String getChannel_info() {
		return channel_info;
	}
	
   /**
	* 设置 渠道信息
	* @param channel_info
	*/
 	public void setChannel_info(java.lang.String channel_info) {
		this.channel_info = channel_info;
	}
	 

   /**
	* 获取 合作业务
	* @return
	*/
	public java.lang.String getBusiness() {
		return business;
	}
	
   /**
	* 设置 合作业务
	* @param business
	*/
 	public void setBusiness(java.lang.String business) {
		this.business = business;
	}
	 

   /**
	* 获取 跟踪描述
	* @return
	*/
	public java.lang.String getTrace_describe() {
		return trace_describe;
	}
	
   /**
	* 设置 跟踪描述
	* @param trace_describe
	*/
 	public void setTrace_describe(java.lang.String trace_describe) {
		this.trace_describe = trace_describe;
	}
	 

   /**
	* 获取 创建时间
	* @return
	*/
	public java.sql.Timestamp getGmt_created() {
		return gmt_created;
	}
	
   /**
	* 设置 创建时间
	* @param gmt_created
	*/
 	public void setGmt_created(java.sql.Timestamp gmt_created) {
		this.gmt_created = gmt_created;
	}
	 

   /**
	* 获取 修改时间
	* @return
	*/
	public java.sql.Timestamp getGmt_modified() {
		return gmt_modified;
	}
	
   /**
	* 设置 修改时间
	* @param gmt_modified
	*/
 	public void setGmt_modified(java.sql.Timestamp gmt_modified) {
		this.gmt_modified = gmt_modified;
	}
	 

   /**
	* 获取 创建人
	* @return
	*/
	public java.lang.String getCreator() {
		return creator;
	}
	
   /**
	* 设置 创建人
	* @param creator
	*/
 	public void setCreator(java.lang.String creator) {
		this.creator = creator;
	}
	 

   /**
	* 获取 修改人
	* @return
	*/
	public java.lang.String getModifier() {
		return modifier;
	}
	
   /**
	* 设置 修改人
	* @param modifier
	*/
 	public void setModifier(java.lang.String modifier) {
		this.modifier = modifier;
	}
	 

   /**
	* 获取 是否删除
	* @return
	*/
	public java.lang.String getIs_deleted() {
		return is_deleted;
	}
	
   /**
	* 设置 是否删除
	* @param is_deleted
	*/
 	public void setIs_deleted(java.lang.String is_deleted) {
		this.is_deleted = is_deleted;
	}
	 


/**
 	 * 
 	 * 属性枚举类
 	 * 状态【0-正常,1-密码锁定,2-无效】
 	 * @author Administrator
 	 *
 	 */
 	public static  class PropertyEnum{
 		/*
 		 * 数据格式： 
 		 * <user_stat,<0,正常;1,密码锁定;2,无效>>
 		 */
 		private  static Map<String,Map<String,String>> propertyEnumMap = new HashMap<String,Map<String,String>>();
 		static{
			propertyEnumMap.put("IS_NEW", new ChainMap<String,String>()
					.chainPut("0", "0-否")
					.chainPut("1", "1-是")
			) ; 
 		}
		public static Map<String, Map<String, String>> getPropertyEnumMap() {
			return propertyEnumMap;
		}
 		
 	}
 	
	public static  enum IS_NEWEnum{
	
		/**
 		 *  0-否
 		 */
 			IS_NEW_0("0"),
		/**
 		 *  1-是
 		 */
 			IS_NEW_1("1")
 			;
 		 
 		private String value;

	    public String getValue() {
	        return value;
	    }
	    
	    IS_NEWEnum(String value) {
	        this.value = value;
	    }
	    
	    public final static Map<IS_NEWEnum, String> map ;
	    static{
	    	map = new EnumMap<IS_NEWEnum, String>(IS_NEWEnum.class);
		 	map.put(IS_NEWEnum.IS_NEW_0 , "0-否");
		 	map.put(IS_NEWEnum.IS_NEW_1 , "1-是");
	    }
	    /**
	     * 跟据value返回枚举对应的key
	     * 
	     * @param value
	     * @return NotifyErrorCode
	     */
	    public static IS_NEWEnum getEnum(String value) {
	    	IS_NEWEnum tmpKey = null;
	        for (IS_NEWEnum tmpEnum : IS_NEWEnum.values()) {
	            if (tmpEnum.value.equals(value)) {
	                tmpKey = tmpEnum;
	                break;
	            }
	        }
	        return tmpKey;
	    }
	    /**
	     * 返回NotifyErrorCode对应的描述.
	     * @param value int.
	     * @return String
	     */
	    public static String getEnumDesc(final String value) {
	        return IS_NEWEnum.map.get(
	        		IS_NEWEnum.getEnum(value));
	    }
	    
 	}	
}
