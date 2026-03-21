package com.okkyclone.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.okkyclone.domain.ActivityVO;
import com.okkyclone.domain.MemberVO;
import com.okkyclone.domain.ReplyVO;
import com.okkyclone.mapper.MemberMapper;
import com.okkyclone.service.MemberService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Override
    public MemberVO read(String userid) {
        System.out.println("���񽺿��� ȸ�� ���� �б� �õ�: " + userid);
        return mapper.read(userid); 
    }
	
    @Autowired
    private MemberMapper mapper;
    
    @Autowired
    private BCryptPasswordEncoder pwEncoder;
    
    public boolean modifyPassword(String userId, String currentPw, String newPw) {
        MemberVO user = mapper.read(userId);
        
        if (pwEncoder.matches(currentPw, user.getUserPw())) {
            String encryptedPw = pwEncoder.encode(newPw);
            return mapper.updatePassword(userId, encryptedPw) == 1; 
        }
        return false;
    }
    
    @Override
    public List<ActivityVO> getActivityList(String memberId) {
        return mapper.selectActivityList(memberId);
    }
    
    @Override
    public void join(MemberVO vo) {
    	System.out.println("Service: ȸ������ ó�� �� -> " + vo.getUserId());
    	mapper.join(vo);
    }
    
    @Override
    public MemberVO login(MemberVO vo) {
    	System.out.println("Service: �α��� Ȯ�� �� -> " + vo.getUserId());
        return mapper.login(vo);
    }
    
    @Override
    public void register(MemberVO member) {
    }

    @Override
    public MemberVO get(String userid) {
        return null;
    }
    
    public int modify(ReplyVO vo) {
        return mapper.update(vo);
    } 
    
    @Override
    public void modifyProfileImg(String userid, String userImg) {
        mapper.updateProfileImg(userid, userImg);
    }
      
    @Override
    public boolean modifyProfile(MemberVO vo) { 
        return mapper.updateMemberProfile(vo) == 1; 
    } 
    
    @Override
    public boolean updateMemberProfile(MemberVO vo) {
        return mapper.updateMemberProfile(vo) == 1; 
    }
    
    @Override
    public List<ActivityVO> getActivityByType(String userId, String type) {
        return mapper.getActivityByType(userId, type);
    }
}