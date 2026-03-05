package com.okkyclone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.okkyclone.domain.CustomUser;
import com.okkyclone.domain.MemberVO;
import com.okkyclone.mapper.MemberMapper;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

	    MemberVO vo = memberMapper.read(userName); 

	    if (vo == null) {
	        throw new UsernameNotFoundException("no member found with username: " + userName);
	    }

	    return new CustomUser(vo);
	}
}