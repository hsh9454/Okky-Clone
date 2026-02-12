package com.okkyclone.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param; 
import com.okkyclone.domain.Criteria;      
import com.okkyclone.domain.ReplyVO;

public interface ReplyMapper {
    
    public int insert(ReplyVO vo);
    
    public List<ReplyVO> getList(Long bno);
    
    public int delete(Long rno);

    public List<ReplyVO> getListWithPaging(
            @Param("cri") Criteria cri, 
            @Param("bno") Long bno);
}