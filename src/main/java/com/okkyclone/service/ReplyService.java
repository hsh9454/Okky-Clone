package com.okkyclone.service;

import java.util.List;

import com.okkyclone.domain.Criteria;
import com.okkyclone.domain.ReplyVO;

public interface ReplyService {

    public int register(ReplyVO vo);
    public List<ReplyVO> getList(Long bno);
    public int remove(Long rno);
    public List<ReplyVO> getList(Criteria cri, Long bno);
}