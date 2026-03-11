package com.okkyclone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import com.okkyclone.domain.CustomUser;
import com.okkyclone.domain.MemberVO;
import com.okkyclone.mapper.MemberMapper;

public class CustomUserDetailsService implements UserDetailsService {

    @Autowired 
    private MemberMapper memberMapper;

    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder; 
    
    @Override
    public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
        
        System.out.println("로그인 시도 아이디: " + userid); 

        MemberVO vo = memberMapper.read(userid); 

        if (vo == null) {
            throw new UsernameNotFoundException("사용자 없음");
        }
        String dbPw = vo.getUserPw().trim(); 

        boolean isMatch = bcryptPasswordEncoder.matches("1234", dbPw);
        System.out.println("★ 대조 결과: " + isMatch);

        return new CustomUser(vo);
    }
}