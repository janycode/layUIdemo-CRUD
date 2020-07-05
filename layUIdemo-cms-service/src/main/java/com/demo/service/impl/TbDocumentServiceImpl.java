package com.demo.service.impl;

import com.demo.dao.TbDocumentMapper;
import com.demo.pojo.TbDocument;
import com.demo.service.TbDocumentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TbDocumentServiceImpl implements TbDocumentService {

    @Autowired
    private TbDocumentMapper tbDocumentMapper;

    @Override
    public PageInfo<TbDocument> findAll(Integer pageNum, Integer pageSize, Integer classId) {
        PageHelper.startPage(pageNum, pageSize);
        List<TbDocument> docList = tbDocumentMapper.findAll(classId);
        PageInfo<TbDocument> pageInfo = new PageInfo<>(docList);
        return pageInfo;
    }

    @Override
    public TbDocument findDocById(Integer id) {
        return tbDocumentMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addDoc(TbDocument tbDocument) {
        return tbDocumentMapper.insert(tbDocument);
    }

    @Override
    public int updateDoc(TbDocument tbDocument) {
        return tbDocumentMapper.updateByPrimaryKey(tbDocument);
    }

    @Override
    public int deleteById(Integer id) {
        return tbDocumentMapper.deleteByPrimaryKey(id);
    }
}
