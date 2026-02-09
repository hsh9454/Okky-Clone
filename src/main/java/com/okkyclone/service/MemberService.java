package com.okkyclone.service;

import com.okkyclone.domain.MemberVO;

public interface MemberService {
	public MemberVO login(MemberVO vo);
    public void register(MemberVO member);
    public MemberVO get(String userid);
}