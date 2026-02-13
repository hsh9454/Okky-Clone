package com.okkyclone.service;

import java.util.List;

import com.okkyclone.domain.BoardVO;

public interface BoardService {
	public BoardVO get(Long bno);
    public List<BoardVO> getList();
    public void register(BoardVO board);
    public boolean modify(BoardVO board);
    public boolean remove(Long bno);
    public boolean toggleLike(Long bno, String userid);
	public boolean toggleDislike(Long bno, String userid);
    }