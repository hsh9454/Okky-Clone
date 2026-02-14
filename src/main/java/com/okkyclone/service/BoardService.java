package com.okkyclone.service;

import java.util.List;
import com.okkyclone.domain.BoardVO;
import com.okkyclone.domain.Criteria;

public interface BoardService {
	public BoardVO get(Long bno);
    public List<BoardVO> getList(Criteria cri);
    public void register(BoardVO board);
    public boolean modify(BoardVO board);
    public boolean remove(Long bno);
    public boolean toggleLike(Long bno, String userid);
	public boolean toggleDislike(Long bno, String userid);
    }