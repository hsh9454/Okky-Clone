package com.okkyclone.mapper;

import com.okkyclone.domain.MemberVO;

public interface MemberMapper {
    public MemberVO login(MemberVO vo);
	public void join(MemberVO member);
}