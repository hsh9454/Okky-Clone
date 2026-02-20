package com.okkyclone.service;

import com.okkyclone.domain.MemberVO;

public interface MemberService {
	public void join(MemberVO vo);
	public MemberVO login(MemberVO vo);
    public void register(MemberVO member);
    public MemberVO get(String userid);
    public void modifyProfileImg(String userid, String userImg);
	public MemberVO read(String userid);
	public boolean modifyProfile(MemberVO vo);

}