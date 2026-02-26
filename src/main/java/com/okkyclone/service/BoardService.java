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
	public List<BoardVO> getList();
	public List<BoardVO> getTechList();
	public List<BoardVO> getListWithCategory(Criteria cri, String category);
	public List<BoardVO> getPopularList(String type);
	public List<BoardVO> getCategoryList(String category);
    public List<BoardVO> getListByParent(String parentslug, Criteria cri);
    public List<BoardVO> getTechKnowledgeList();
    public int getTotal(Criteria cri, String category, String group);
    public int getTotalCountWithCategory(Criteria cri, String category);
    public List<BoardVO> getListWithCategory(Criteria cri, String category, String group);
    public List<BoardVO> getMainKnowledgeList();

}