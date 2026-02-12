package com.okkyclone.mapper;

import com.okkyclone.domain.MemberVO;
import com.okkyclone.domain.ReplyVO;

public interface MemberMapper {
    public MemberVO login(MemberVO vo);
	public void join(MemberVO member);
	public int update(ReplyVO vo);
}