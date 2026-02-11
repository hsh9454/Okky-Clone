package com.okkyclone.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.okkyclone.domain.MemberVO;
import com.okkyclone.mapper.MemberMapper;
import com.okkyclone.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper mapper;
    
    @Override
    public void join(MemberVO vo) {
    	System.out.println("Service: 회원가입 처리 중 -> " + vo.getUserid());
    	mapper.join(vo);
    }
    
    @Override
    public MemberVO login(MemberVO vo) {
    	System.out.println("Service: 로그인 확인 중 -> " + vo.getUserid());
        return mapper.login(vo);
    }
    
    @Override
    public void register(MemberVO member) {
    }

    @Override
    public MemberVO get(String userid) {
        return null;
    }
    
}