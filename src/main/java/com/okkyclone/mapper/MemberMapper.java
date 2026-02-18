package com.okkyclone.mapper;

import com.okkyclone.domain.MemberVO;
import com.okkyclone.domain.ReplyVO;
import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
    public MemberVO login(MemberVO vo);
	public void join(MemberVO member);
	public int update(ReplyVO vo);
	public int updateProfileImg(@Param("userid") String userid, @Param("userImg") String userImg);
	public MemberVO read(String userid);
	}