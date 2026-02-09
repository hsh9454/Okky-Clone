package com.mytest.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mytest.domain.MemberVO;
import com.mytest.mapper.MemberMapper;
import com.mytest.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper mapper;
    
    @Override
    public MemberVO login(MemberVO vo) {
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