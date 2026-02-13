package com.okkyclone.mapper;

import java.util.List;
import com.okkyclone.domain.BoardVO;
import org.apache.ibatis.annotations.Param;

public interface BoardMapper {
   
	public List<BoardVO> getList(); 
    public void insert(BoardVO board);
    public BoardVO read(Long bno);
    public void updateViewCount(Long bno);
    public int update(BoardVO board);
    public int delete(Long bno);
    
    int checkLikeLog(@Param("bno") Long bno, @Param("userid") String userid, @Param("type") int type);
    void addLikeLog(@Param("bno") Long bno, @Param("userid") String userid, @Param("type") int type);
    void removeLikeLog(@Param("bno") Long bno, @Param("userid") String userid, @Param("type") int type);
    void updateLikeCount(@Param("bno") Long bno, @Param("amount") int amount);
    void updateDislikeCount(@Param("bno") Long bno, @Param("amount") int amount);

}