package com.okkyclone.mapper;

import java.util.List;
import com.okkyclone.domain.BoardVO;
import org.apache.ibatis.annotations.Param;
import com.okkyclone.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getListWithCategory(@Param("cri") Criteria cri, @Param("category") String category);
	public List<BoardVO> getList(); 
	public List<BoardVO> getTechList();
	public List<BoardVO> getPopularList(String type);
    public void insert(BoardVO board);
    public BoardVO read(Long bno);
    public void updateViewCount(Long bno);
    public int update(BoardVO board);
    public int delete(Long bno);
    public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
    public List<BoardVO> getCategoryList(String category);
    
    int checkLikeLog(@Param("bno") Long bno, @Param("userid") String userid, @Param("type") int type);
    void addLikeLog(@Param("bno") Long bno, @Param("userid") String userid, @Param("type") int type);
    void removeLikeLog(@Param("bno") Long bno, @Param("userid") String userid, @Param("type") int type);
    void updateLikeCount(@Param("bno") Long bno, @Param("amount") int amount);
    void updateDislikeCount(@Param("bno") Long bno, @Param("amount") int amount);

}