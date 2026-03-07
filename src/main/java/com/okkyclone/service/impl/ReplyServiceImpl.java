package com.okkyclone.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.okkyclone.domain.Criteria;
import com.okkyclone.domain.ReplyLikeVO;
import com.okkyclone.domain.ReplyVO;
import com.okkyclone.mapper.BoardMapper;
import com.okkyclone.mapper.ReplyMapper;
import com.okkyclone.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;

	@Autowired
	private BoardMapper boardMapper;

	@Transactional
	@Override
	public int register(ReplyVO vo) {
		System.out.println("댓글 등록 및 게시글 댓글수 업데이트 호출: " + vo);
		int result = mapper.insert(vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		return result;
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		System.out.println("댓글 목록 조회 서비스 호출 (BNO): " + bno);
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public int remove(Long rno) {
		System.out.println("댓글 삭제 서비스 호출 (RNO): " + rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Long bno) {
		System.out.println("서비스에서 댓글 리스트 가져오는 중... BNO: " + bno);
		return mapper.getList(bno);
	}

	@Override
	public int modify(ReplyVO vo) {
		System.out.println("서비스에서 수정 처리 중... VO: " + vo);
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int updateLike(ReplyLikeVO vo) {
	    String existingType = mapper.checkReplyLike(vo); 
	    
	    if (existingType != null) {
	        if (existingType.equals(vo.getLike_type())) {
	            mapper.deleteReplyLike(vo);
	            mapper.updateLikeCountMinus(vo.getRno(), vo.getLike_type());
	            return 2; 
	        } else {
	            return 0;
	        }
	    }	   
	    mapper.insertReplyLike(vo);
	    return mapper.updateLikeCount(vo.getRno(), vo.getLike_type());
	}
}