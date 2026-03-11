package com.okkyclone.domain;

import org.springframework.security.core.userdetails.User;
import java.util.stream.Collectors;

public class CustomUser extends User {

    private static final long serialVersionUID = 1L;
    private MemberVO member; 

    public CustomUser(MemberVO vo) {
        super(vo.getUserId(), vo.getUserPw(), 
              vo.getAuthList().stream()
                .map(auth -> new org.springframework.security.core.authority.SimpleGrantedAuthority(auth.getAuth()))
                .collect(Collectors.toList()));
        
        this.member = vo;
    }

    public MemberVO getMember() {
        return member;
    }

    public MemberVO getUser() {
        return member;
    }

    public void setMember(MemberVO member) {
        this.member = member;
    }
}