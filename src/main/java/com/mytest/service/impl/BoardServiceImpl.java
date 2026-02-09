package com.mytest.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mytest.domain.BoardVO;
import com.mytest.mapper.BoardMapper;
import com.mytest.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper mapper;

    @Override
    public List<BoardVO> getList() {
        return mapper.getList();
    }
       
}