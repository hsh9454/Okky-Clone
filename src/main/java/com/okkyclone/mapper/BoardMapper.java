package com.okkyclone.mapper;

import java.util.List;

import com.okkyclone.domain.BoardVO;

public interface BoardMapper {
    public List<BoardVO> getList(); 
    public void insert(BoardVO board);
    public BoardVO read(Long bno);
    
}