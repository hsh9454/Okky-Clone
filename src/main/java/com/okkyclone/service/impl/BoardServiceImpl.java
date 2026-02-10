package com.okkyclone.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.okkyclone.domain.BoardVO;
import com.okkyclone.mapper.BoardMapper;
import com.okkyclone.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper mapper;

    @Override
    public List<BoardVO> getList() {
        return mapper.getList();
    }
    
    @Override
    public void register(BoardVO board) {
        mapper.insert(board); 
    } 
    
    @Override
    public BoardVO get(Long bno) {
    	mapper.updateViewCount(bno);
        return mapper.read(bno);
    }
    
    @Override
    public boolean modify(BoardVO board) {
        return mapper.update(board) == 1; 
    }
    
}