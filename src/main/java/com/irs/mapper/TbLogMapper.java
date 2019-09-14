package com.irs.mapper;

import com.irs.pojo.TbLog;
import com.irs.pojo.TbLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbLogMapper {
	
    int countByExample(TbLogExample example);

    int deleteByExample(TbLogExample example);
    
    //根据主键进行查询,必须保证结果唯一
    //单个字段做主键时,可以直接写主键的值
    //联合主键时,key可以是实体类,也可以是Map
    int deleteByPrimaryKey(Long id);

    int insert(TbLog record);
    
	//插入一条数据,只插入不为null的字段,不会影响有默认值的字段
	//支持Oracle序列,UUID,类似Mysql的INDENTITY自动增长(自动回写)
	//优先使用传入的参数值,参数值空时,才会使用序列、UUID,自动增长
    int insertSelective(TbLog record);

    List<TbLog> selectByExample(TbLogExample example);

    TbLog selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbLog record, @Param("example") TbLogExample example);

    int updateByExample(@Param("record") TbLog record, @Param("example") TbLogExample example);

    //根据主键进行更新
	//只会更新不是null的数据
    int updateByPrimaryKeySelective(TbLog record);
    
    //根据主键进行更新,这里最多只会更新一条数据
    //参数为实体类
    int updateByPrimaryKey(TbLog record);
}