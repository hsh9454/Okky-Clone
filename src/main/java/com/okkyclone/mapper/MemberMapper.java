package com.okkyclone.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.okkyclone.domain.ActivityVO;
import com.okkyclone.domain.MemberVO;
import com.okkyclone.domain.ReplyVO;

public interface MemberMapper {
    public MemberVO login(MemberVO vo);
	public void join(MemberVO member);
	public int update(ReplyVO vo);
	public int updateProfileImg(@Param("userid") String userid, @Param("userImg") String userImg);
	public MemberVO read(String userid);
	public int updateMemberProfile(MemberVO vo);
	List<ActivityVO> selectActivityList(String memberId);
	public MemberVO readMember(String userid);
}