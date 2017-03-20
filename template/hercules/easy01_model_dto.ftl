package ${config.cfg_easy_module_package}.entity;
import java.util.HashMap;
import java.util.Map;

import com.absmybatis.dao.annotation.EntityPK;
import com.absmybatis.dao.annotation.EntityColumn;

<#list table.columns as c >	
 		<#if   c.remarksMeans.meanType?? && c.remarksMeans.meanType = "0">
import com.web.common.ChainMap;	
import java.util.EnumMap;		
			<#break>
		</#if>
</#list>
	
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
@EntityPK(Pk = "<#if (table.primaryKeys?size==1)><#list table.primaryKeys as c >${c.columnName}</#list></#if>", tableName = "${table.tableName}")
public class ${table.className}Dto {//${table.remarks?if_exists}
<#list table.columns as c >
	//${c.remarks?if_exists}
	@EntityColumn(dataType=${c.dataType}, typeName="${c.typeName?if_exists}", remarks = "${c.remarks?if_exists}"  )
	private ${c.javaType} ${c.columnName};//${c.remarks?if_exists}
</#list>

<#list table.columns as c >	

   /**
	* 获取 ${c.remarks?if_exists}
	* @return
	*/
	public ${c.javaType} get${c.columnNameFcu}() {
		return ${c.columnName};
	}
	
   /**
	* 设置 ${c.remarks?if_exists}
	* @param ${c.columnName}
	*/
 	public void set${c.columnNameFcu}(${c.javaType} ${c.columnName}) {
		this.${c.columnName} = ${c.columnName};
	}
	 
</#list>


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
	<#list table.columns as c >	
		<#if   c.remarksMeans.meanType?? && c.remarksMeans.meanType = "0">
			propertyEnumMap.put("${c.columnName?upper_case}", new ChainMap<String,String>()
				<#list c.remarksMeans.meanName as mean>
					.chainPut("${mean[0]}", "${mean[1]}")
				</#list>
			) ; 
		</#if>
	</#list>
 		}
		public static Map<String, Map<String, String>> getPropertyEnumMap() {
			return propertyEnumMap;
		}
 		
 	}
 	
<#list table.columns as c >	
 		<#if   c.remarksMeans.meanType?? && c.remarksMeans.meanType = "0">
	public static  enum ${c.columnName?upper_case}Enum{
	
	<#list c.remarksMeans.meanName as mean>
		/**
 		 *  ${mean[1]}
 		 */
 		<#if  mean_has_next>
 			${c.columnName?upper_case}_${mean[0]}("${mean[0]}"),
 		<#else>
 			${c.columnName?upper_case}_${mean[0]}("${mean[0]}")
 			;
 		</#if>
	</#list>
 		 
 		private String value;

	    public String getValue() {
	        return value;
	    }
	    
	    ${c.columnName?upper_case}Enum(String value) {
	        this.value = value;
	    }
	    
	    public final static Map<${c.columnName?upper_case}Enum, String> map ;
	    static{
	    	map = new EnumMap<${c.columnName?upper_case}Enum, String>(${c.columnName?upper_case}Enum.class);
	    	<#list c.remarksMeans.meanName as mean>
		 	map.put(${c.columnName?upper_case}Enum.${c.columnName?upper_case}_${mean[0]} , "${mean[1]}");
			</#list>
	    }
	    /**
	     * 跟据value返回枚举对应的key
	     * 
	     * @param value
	     * @return NotifyErrorCode
	     */
	    public static ${c.columnName?upper_case}Enum getEnum(String value) {
	    	${c.columnName?upper_case}Enum tmpKey = null;
	        for (${c.columnName?upper_case}Enum tmpEnum : ${c.columnName?upper_case}Enum.values()) {
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
	        return ${c.columnName?upper_case}Enum.map.get(
	        		${c.columnName?upper_case}Enum.getEnum(value));
	    }
	    
 	}	
		</#if>
</#list>
}
