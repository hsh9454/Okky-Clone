package com.okkyclone.domain;

import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUser extends User {

    private static final long serialVersionUID = 1L;
    private MemberVO user; 
    public CustomUser(MemberVO vo) {
       
        super(vo.getUserId(), vo.getUserPw(), 
              vo.getAuthList().stream()
                .map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
                .collect(Collectors.toList()));
        
        this.user = vo; 
    }

    public MemberVO getUser() {
        return user;
    }

    public void setUser(MemberVO user) {
        this.user = user;
    }
}