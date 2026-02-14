package com.okkyclone.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; 

import com.okkyclone.domain.BoardVO;
import com.okkyclone.domain.Criteria; 
import com.okkyclone.mapper.BoardMapper;
import com.okkyclone.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper mapper;

    @Override
    public List<BoardVO> getList(Criteria cri) {
        System.out.println("목록 가져오기 (페이징 포함): " + cri);
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
    
    @Override
    public boolean remove(Long bno) {
    	return mapper.delete(bno) == 1;
    }
    
    @Override
    @Transactional
    public boolean toggleLike(Long bno, String userid) {
    	if (mapper.checkLikeLog(bno, userid, 2) > 0) {
    		return false; 
        }
    	
        int count = mapper.checkLikeLog(bno, userid, 1);   	
        if (count > 0) {
    		mapper.removeLikeLog(bno, userid, 1);
    		mapper.updateLikeCount(bno, -1);
    		return false;
    	}else {
    		mapper.addLikeLog(bno, userid, 1);
            mapper.updateLikeCount(bno, 1);
            return true;
        }
    }

    @Override
    @Transactional
    public boolean toggleDislike(Long bno, String userid) {
    	if (mapper.checkLikeLog(bno, userid, 1) > 0) {
            return false;
        }
    	
    	int count = mapper.checkLikeLog(bno, userid, 2);
    	if (count > 0) {
            mapper.removeLikeLog(bno, userid, 2);
            mapper.updateDislikeCount(bno, -1);
            return false; 
        } else {
            mapper.addLikeLog(bno, userid, 2);
            mapper.updateDislikeCount(bno, 1);
            return true; 
        }
    }
}
    	