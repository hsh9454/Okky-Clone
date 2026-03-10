package com.okkyclone.service;

import java.util.List;

import com.okkyclone.domain.ActivityVO;
import com.okkyclone.domain.MemberVO;

public interface MemberService {
	public void join(MemberVO vo);
	public MemberVO login(MemberVO vo);
    public void register(MemberVO member);
    public MemberVO get(String userid);
    public void modifyProfileImg(String userid, String userImg);
	public MemberVO read(String userid);
	public boolean modifyProfile(MemberVO vo);
	List<ActivityVO> getActivityList(String memberId);
	public boolean updateMemberProfile(MemberVO vo);
	public List<ActivityVO> getActivityByType(String userId, String type);
	
}