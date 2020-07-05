package com.demo.service;

import com.demo.pojo.TbDocument;
import com.github.pagehelper.PageInfo;

public interface TbDocumentService {

    PageInfo<TbDocument> findAll(Integer pageNum, Integer pageSize, Integer classId);

    TbDocument findDocById(Integer id);

    int addDoc(TbDocument tbDocument);

    int updateDoc(TbDocument tbDocument);

    int deleteById(Integer id);
}
