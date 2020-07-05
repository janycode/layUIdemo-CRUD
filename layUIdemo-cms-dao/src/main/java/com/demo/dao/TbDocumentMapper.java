package com.demo.dao;

import com.demo.pojo.TbDocument;
import com.demo.pojo.TbDocumentExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbDocumentMapper {
    int countByExample(TbDocumentExample example);

    int deleteByExample(TbDocumentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TbDocument record);

    int insertSelective(TbDocument record);

    List<TbDocument> selectByExample(TbDocumentExample example);

    TbDocument selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TbDocument record, @Param("example") TbDocumentExample example);

    int updateByExample(@Param("record") TbDocument record, @Param("example") TbDocumentExample example);

    int updateByPrimaryKeySelective(TbDocument record);

    int updateByPrimaryKey(TbDocument record);

    List<TbDocument> findAll(Integer classId);
}