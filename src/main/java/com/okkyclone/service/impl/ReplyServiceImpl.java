package com.okkyclone.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.okkyclone.domain.Criteria;
import com.okkyclone.domain.ReplyVO;
import com.okkyclone.mapper.ReplyMapper;
import com.okkyclone.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    private ReplyMapper mapper;

    @Override
    public int register(ReplyVO vo) {
        System.out.println("댓글 등록 서비스 호출: " + vo);
        return mapper.insert(vo);
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
		// TODO Auto-generated method stub
		return null;
	}
}