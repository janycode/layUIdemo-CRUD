package com.demo.dao;

import com.demo.pojo.TbClass;
import com.demo.pojo.TbClassExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbClassMapper {
    int countByExample(TbClassExample example);

    int deleteByExample(TbClassExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TbClass record);

    int insertSelective(TbClass record);

    List<TbClass> selectByExample(TbClassExample example);

    TbClass selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TbClass record, @Param("example") TbClassExample example);

    int updateByExample(@Param("record") TbClass record, @Param("example") TbClassExample example);

    int updateByPrimaryKeySelective(TbClass record);

    int updateByPrimaryKey(TbClass record);
}