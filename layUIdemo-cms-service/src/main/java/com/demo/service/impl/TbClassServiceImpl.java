package com.demo.service.impl;

import com.demo.dao.TbClassMapper;
import com.demo.pojo.TbClass;
import com.demo.service.TbClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TbClassServiceImpl implements TbClassService {

    @Autowired
    private TbClassMapper tbClassMapper;

    @Override
    public List<TbClass> findAll() {
        return tbClassMapper.selectByExample(null);
    }
}
